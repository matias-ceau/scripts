#!/usr/bin/env python

import sys
import os
import argparse
import csv
import subprocess
import json
import hashlib
from openai import OpenAI
from colorama import init, Fore, Style, Back

# Initialize colorama for cross-platform colored output
init()

SCRIPTS_PATH = os.environ.get('SCRIPTS', '')
DOCS_PATH = os.path.join(SCRIPTS_PATH, 'docs')
INDEX_PATH = os.path.join(DOCS_PATH, "index.md")
DOCS_SCRIPTS_PATH = os.path.join(DOCS_PATH, 'scripts')
INFO_JSON_PATH = os.path.join(SCRIPTS_PATH, 'data', 'script_info.json')
README_PATH = os.path.join(SCRIPTS_PATH, 'README.md')



client = OpenAI(api_key=os.environ.get('OPENAI_API_KEY'))
llm_model = "gpt-4o-mini"

system_prompt_1="""\
1) You are a helpful assistant that generates GitHub documentation in markdown format for user scripts. Your audience is mainly the creator of the scripts themselves so provide information adapted to his context (OS : Arch linux, WM : qtile).

2) When you receive a message, it will always be formatted like so:
```
file: <script_path>

________
content:

<script_content>
```
NB: `<script_path>` is the path of the file and `<script_content>` is the content of the file.

3) Please provide the documentation directly in markdown format, without using markdown code blocks.
The documentation's length should be between 200 and 500 words, depending on the complexity of the script.
You can use any github flavored markdown formatting to make the description clear (including code blocks, lists, tables, footnote, lines, etc), except when explicitly told otherwise.
For sections, always use the template provided below (nb: lines between double accolades ({{}}) are comments to give you guidance):

# Script Name {{ choose an appropriate title and add the filename in parenthesis}}

---

[Brief description of the script (maximum 100 characters), no special formating, be concise]

---

### Table of contents

- [Dependencies](#dependencies)
- [Description](#description)
    - [Overview](#overview)
    - [Usage](#usage)
    - [Examples](#examples)
- [Notes](#notes)

---

<a name="dependencies" />

### Dependencies

{{List any dependencies required by the script, including user scripts}}


<a name="description" />

### Description

<a name="overview" />

#### Overview

{{Provide a more in depth description of the script, feel free to format this section as you find fits the best, including explaining functions or utilities used}}

---

<a name="usage" />

#### Usage

{{Explain how to use the script, including any command-line arguments, if it needs to be run interactively in a terminal or can be assigned to a keybinding, executed automatically, etc}}

<a name="examples" />

#### Examples

{{Provide examples of how to use the script in a "tldr" style}}

---

<a name="notes" />

### Notes

{{Add any additional notes or considerations}}

{{include a "critique" section, inside a mardown blockquote, where you, as the assistant, point out problems in the scripts or potential improvements}}
"""

system_prompt_2 = """\
1) You are a helpful assistant that generates a summary of the content of a GitHub script repository.Your audience is mainly the creator of the scripts themselves so provide information adapted to his context (OS : Arch linux, WM : qtile).
2) Your goal is to create a summary of the script repository based on the documentation for all of the scripts that you will receive. This will be integrated in the README.md file, so it shouldn't be too specific (DON'T DESCRIBE EACH SCRIPT INDIVIDUALLY). You should write a 200-300 word description of the kind of script it contains (You are free to format it using markdown features available on github, with the exception of headers).
To help you, the user will send you messages in the format below.



[FILE]: script_filename1

<content of documentation of script 1>

---

[FILE]: script_filename2

<content of documentation of script 2>

---
...
""" 

def print_colored(message, kind='normal', style=Style.NORMAL, end='\n'):
    if kind == 'main_section':
        color = Back.BLUE ; style = Style.BRIGHT
    elif kind == 'main_function':
        color = Fore.CYAN ; style = Style.BRIGHT
    elif kind == 'function_call':
        color = Fore.BLUE
    elif kind == 'llm':
        color = Fore.MAGENTA ; style = Style.BRIGHT
    elif kind == 'success':
        color = Fore.GREEN
    elif kind == 'victory':
        color = Back.GREEN ; style = Style.BRIGHT
    elif kind == 'error':
        color = Back.RED ; style = Style.BRIGHT
    elif kind == 'warn':
        color = Fore.RED
    elif kind == 'info':
        color = Fore.YELLOW
    else:
        color=Fore.WHITE ; style=Style.NORMAL
    print(f"{style}{color}{message}{Style.RESET_ALL}", end=end)

#INFO_JSON -> file content of INFO_JSON_PATH
if os.path.exists(INFO_JSON_PATH):
    with open(INFO_JSON_PATH, 'r') as f:
        INFO_JSON = json.load(f)
        print_colored(f'Found existing {INFO_JSON_PATH} !', kind="success")
else:
    INFO_JSON = {}
    print_colored(f'Creating {INFO_JSON_PATH} !', kind="info")
def run_update_symlinks():
    print_colored("Do you want to run utils_update_symlinks.sh? (y/N): ", kind='info', end='')
    response = input().lower()
    if response in ['y', 'yes']:
        print_colored("Running utils_update_symlinks.sh...", kind='info')
        try:
            subprocess.run(['utils_update_symlinks.sh'], check=True)
            print_colored("utils_update_symlinks.sh completed successfully.", kind='success')
        except subprocess.CalledProcessError:
            print_colored("Error: Failed to run utils_update_symlinks.sh", kind='error')
            sys.exit(1)
    else:
        print_colored("Skipping utils_update_symlinks.sh", kind='info')

def get_script_files():
    try:
        result = subprocess.run(
            f"fd '' -tf {SCRIPTS_PATH} | rg -v 'md$' | xargs -I {{}} basename {{}}",
            shell=True, check=True, stdout=subprocess.PIPE, universal_newlines=True
        )

        return set(result.stdout.splitlines())
    except subprocess.CalledProcessError:
        print_colored("Error: Failed to get script files", kind='error')
        return set()

def check_orphaned_docs(script_files):
    print_colored("Checking for orphaned doc files...", kind='function_call')
    orphaned_docs = []
    for doc_file in os.listdir(DOCS_SCRIPTS_PATH):
        if doc_file.endswith('.md'):
            script_name = doc_file[:-3]  # Remove .md extension
            if script_name not in script_files:
                orphaned_docs.append(doc_file)
    
    if orphaned_docs:
        print('')
        print_colored("Orphaned doc files found!", kind='warn')
        for doc in orphaned_docs:
            print_colored(f"    - Removing {doc}", kind='info')
            subprocess.run(f"rm {DOCS_SCRIPTS_PATH}/{doc}", shell=True, check=True)
    else:
        print_colored("No orphaned documentation files found.", kind='success')

def is_binary(file_path):
    print_colored(f"Checking if file is binary: {file_path}", kind='function_call')
    try:
        with open(file_path, 'rb') as file:
            chunk = file.read(1024)
            return b'\0' in chunk
    except IOError:
        return False

def find_source_file(binary_path):
    print_colored(f"Attempting to find source file for: {binary_path}", kind='function_call')
    filename = os.path.basename(binary_path)
    name_without_ext = os.path.splitext(filename)[0]
    scripts_lib = os.path.join(SCRIPTS_PATH, 'lib')
    
    extensions = ['.c', '.cpp', '.py', '.sh', '.rs', '.go', '.js', '.ts', '.rb', '.java', '.cs']
    
    for ext in extensions:
        source_path = os.path.join(scripts_lib, f"{name_without_ext}{ext}")
        if os.path.exists(source_path):
            print_colored(f"Found source file: {source_path}", kind='success')
            return source_path
    
    print_colored(f"No source file found for: {binary_path}", kind='error')
    return None

def read_script(file_path):
    print_colored(f"Reading script: {file_path}", kind='function_call')
    with open(file_path, 'r') as file:
        return file.read()

def describe_script(script_path, script_content):
    print_colored("Generating description using gpt-4o-mini model...", kind='llm')
    try:
        response = client.chat.completions.create(
            model=llm_model,
            messages=[
                {"role": "system", "content": system_prompt_1},
                {"role": "user", "content": f"file: {script_path}\n\n________content:\n\n{script_content}"}
            ]
        )
        return response.choices[0].message.content
    except Exception as e:
        print_colored(f"Error generating description: {str(e)}", kind='error')
        return "Error: Unable to generate description."

def llm_summarize():
    print_colored("Generating doc summary using gpt-4o-mini model...", kind='llm')
    dic = {}
    for d in os.listdir(DOCS_SCRIPTS_PATH):
        with open(os.path.join(DOCS_SCRIPTS_PATH, d)) as f:
            data = f.read()
        dic[d] = data
    content = ''.join([f"[SCRIPT]: {k[:-3]}\n\n{v}\n\n---\n\n" for k,v in dic.items()])
    try:
        response = client.chat.completions.create(
            model=llm_model,
            messages=[
                {"role": "system", "content": system_prompt_2},
                {"role": "user", "content": content}
            ]
        )
        return response.choices[0].message.content
    except Exception as e:
        print_colored(f"Error generating summary: {str(e)}", kind='error')
        return "Error: Unable to generate summary."

def write_markdown(filename, content):
    print_colored(f"Writing markdown file: {filename}", kind='success')
    with open(filename, 'w') as file:
        file.write(content)

def update_index(filename, relative_path):
    print_colored(f"Updating index file: {INDEX_PATH}", kind='info')
    with open(INDEX_PATH, 'a') as file:
        pass
    with open(INDEX_PATH, 'r') as file:
        lines = file.readlines()
    
    new_line = f"- [{filename}]({relative_path})\n"
    if new_line not in lines:
        lines.append(new_line)
    
    lines.sort(key=lambda x: x.lower())
    
    with open(INDEX_PATH, 'w') as file:
        file.writelines(lines)

def get_file_hash(file_path):
    sha256_hash = hashlib.sha256()
    with open(file_path, "rb") as f:
        for byte_block in iter(lambda: f.read(4096), b""):
            sha256_hash.update(byte_block)
    return sha256_hash.hexdigest()

def process_script(script_path):
    print_colored(f"\nProcessing script: {script_path}", kind='function_call')
    
    filename = os.path.basename(script_path)
    markdown_path = os.path.join(DOCS_SCRIPTS_PATH, f"{filename}.md")
   
    print_colored(f'Getting hash for {filename}...')
    current_hash = get_file_hash(script_path)
    
    if filename in INFO_JSON and INFO_JSON[filename]['hash'] == current_hash:
        print_colored(f"Skipping unchanged script: {script_path}", kind='info')
        return
    
    if is_binary(script_path):
        print_colored(f'{script_path} is a binary file, trying to find the source file...')
        source_path = find_source_file(script_path)
        if source_path:
            print_colored(f'Found source {source_path}',kind='success')
            script_content = read_script(source_path)
        else:
            script_content = None
            print_colored('No Found source {source_path}', kind='success', style='Style.dim')
    else:
        script_content = read_script(script_path)
    
    if script_content:
        description = describe_script(script_path, script_content)
    else:
        description = "No information could be generated for this binary file."
    
    os.makedirs(DOCS_PATH, exist_ok=True)
    
    write_markdown(markdown_path, description)
    
    relative_path = os.path.relpath(markdown_path, DOCS_PATH)
    update_index(filename, relative_path)
    
    short_description = description.split('---')[1].strip()
    
    INFO_JSON[filename] = {
        'file': filename,
        'path': os.path.relpath(script_path, SCRIPTS_PATH),
        'description': short_description,
        'doc_path': os.path.relpath(markdown_path, SCRIPTS_PATH),
        'hash': current_hash,
    }

def update_readme():
    with open(README_PATH, 'r') as file:
        content = file.read()

    # Update the first section
    start_index = content.index('<!-- llm_generated_output_start -->')
    end_index = content.index('<!-- llm_generated_output_end -->')
    
    summary = llm_summarize()
    
    new_content = f"{content[:start_index]}<!-- llm_generated_output_start -->\n\n{summary}\n\n<!-- llm_generated_output_end -->{content[end_index + len('<!-- llm_generated_output_end -->'):]}"

    # Update the table
    table_start_index = new_content.index('<!-- table_start -->')
    table_end_index = new_content.index('<!-- table_end -->')
    
    table_content = "| File | Description |\n| --- | --- |\n"
    for filename, info in sorted(INFO_JSON.items()):
        table_content += f"| [{filename}]({info['doc_path']}) | {info['description']} |\n"
    
    new_content = f"{new_content[:table_start_index]}<!-- table_start -->\n\n{table_content}\n<!-- table_end -->{new_content[table_end_index + len('<!-- table_end -->'):]}"

    with open(README_PATH, 'w') as file:
        file.write(new_content)

def process_csv(csv_path):
    
    # uses the csv file as script source
    with open(csv_path, 'r') as csvfile:
        reader = csv.reader(csvfile)
        next(reader)  # Skip header
        for row in reader:
            original_path, symlink, command_name = row
            process_script(original_path)
    
    with open(INFO_JSON_PATH, 'w') as f:
        json.dump(INFO_JSON, f, indent=2)
    

def main():
    parser = argparse.ArgumentParser(description="Describe scripts from a CSV file using gpt-4o-mini model.")
    parser.add_argument("csv_path", nargs='?', default=os.path.join(SCRIPTS_PATH, 'data', 'symlink_data.csv'),
                        help="Path to the CSV file (default: $SCRIPTS/data/symlink_data.csv)")
    args = parser.parse_args()

    csv_path = os.path.abspath(args.csv_path)
    
    if not os.path.exists(csv_path):
        print_colored(f"Error: The CSV file '{csv_path}' does not exist.", kind='error')

    print_colored('Updating symlinks (optionnal)', kind='main_section')
    run_update_symlinks()

    print_colored(f"Reading scripts from CSV file and creating docs and json datafile: {csv_path}", kind='main_section')
    process_csv(csv_path)
    script_files = get_script_files()
    
    print_colored('Updating README.md', kind='main_section')
    update_readme()

    print_colored('Doing some cleanup', kind='main_section')
    check_orphaned_docs(script_files)

    print_colored("Script processing completed successfully.", kind='victory')

if __name__ == "__main__":
    main()
