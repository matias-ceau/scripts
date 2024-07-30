#!/usr/bin/env python

import sys
import os
import argparse
import csv
import subprocess
import json
import hashlib
from openai import OpenAI
from colorama import init, Fore, Style

# Initialize colorama for cross-platform colored output
init()

SCRIPTS = os.environ.get('SCRIPTS', '')
DOCS = os.path.join(SCRIPTS, 'docs')
DOCS_scripts = os.path.join(DOCS, 'scripts')

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
For sections, always use the template provided below, between `<template>` and `</template>` (nb: lines between double accolades ({{}}) are comments to give you guidance):

<template>\
# {{Script Name (filename in parenthesis)}}

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
</template>\
"""
def print_colored(message, color=Fore.WHITE, style=Style.NORMAL, end='\n'):
    print(f"{style}{color}{message}{Style.RESET_ALL}", end=end)

def run_update_symlinks():
    print_colored("Do you want to run utils_update_symlinks.sh? (y/N): ", Fore.YELLOW, Style.BRIGHT, end='')
    response = input().lower()
    if response in ['y', 'yes']:
        print_colored("Running utils_update_symlinks.sh...", Fore.CYAN)
        try:
            subprocess.run(['utils_update_symlinks.sh'], check=True)
            print_colored("utils_update_symlinks.sh completed successfully.", Fore.GREEN)
        except subprocess.CalledProcessError:
            print_colored("Error: Failed to run utils_update_symlinks.sh", Fore.RED)
            sys.exit(1)
    else:
        print_colored("Skipping utils_update_symlinks.sh", Fore.YELLOW)

def get_script_files():
    try:
        result = subprocess.run(
            f"fd '' -tf {SCRIPTS} | rg -v 'md$' | xargs -I {{}} basename {{}}",
            shell=True, check=True, stdout=subprocess.PIPE, universal_newlines=True
        )
        return set(result.stdout.splitlines())
    except subprocess.CalledProcessError:
        print_colored("Error: Failed to get script files", Fore.RED)
        return set()

def check_orphaned_docs(script_files):
    orphaned_docs = []
    for doc_file in os.listdir(DOCS_scripts):
        if doc_file.endswith('.md'):
            script_name = doc_file[:-3]  # Remove .md extension
            if script_name not in script_files:
                orphaned_docs.append(doc_file)
    
    if orphaned_docs:
        print('')
        print_colored("The following documentation files are orphaned:", Fore.CYAN)
        for doc in orphaned_docs:
            print_colored(f"  - {doc}", Fore.RED)
        print_colored("Consider removing these files or updating the documentation.", Fore.YELLOW)
    else:
        print_colored("No orphaned documentation files found.", Fore.GREEN)

def is_binary(file_path):
    print_colored(f"Checking if file is binary: {file_path}", Fore.CYAN)
    try:
        with open(file_path, 'rb') as file:
            chunk = file.read(1024)
            return b'\0' in chunk
    except IOError:
        return False

def find_source_file(binary_path):
    print_colored(f"Attempting to find source file for: {binary_path}", Fore.CYAN)
    filename = os.path.basename(binary_path)
    name_without_ext = os.path.splitext(filename)[0]
    scripts_lib = os.path.join(SCRIPTS, 'lib')
    
    extensions = ['.c', '.cpp', '.py', '.sh', '.rs', '.go', '.js', '.ts', '.rb', '.java', '.cs']
    
    for ext in extensions:
        source_path = os.path.join(scripts_lib, f"{name_without_ext}{ext}")
        if os.path.exists(source_path):
            print_colored(f"Found source file: {source_path}", Fore.GREEN)
            return source_path
    
    print_colored(f"No source file found for: {binary_path}", Fore.YELLOW)
    return None

def read_script(file_path):
    print_colored(f"Reading script: {file_path}", Fore.CYAN)
    with open(file_path, 'r') as file:
        return file.read()

def describe_script(script_path, script_content):
    print_colored("Generating description using gpt-4o-mini model...", Fore.MAGENTA)
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
        print_colored(f"Error generating description: {str(e)}", Fore.RED)
        return "Error: Unable to generate description."

def write_markdown(filename, content):
    print_colored(f"Writing markdown file: {filename}", Fore.GREEN)
    with open(filename, 'w') as file:
        file.write(content)

def update_index(index_path, filename, relative_path):
    print_colored(f"Updating index file: {index_path}", Fore.GREEN)
    with open(index_path, 'r') as file:
        lines = file.readlines()
    
    new_line = f"- [{filename}]({relative_path})\n"
    if new_line not in lines:
        lines.append(new_line)
    
    lines.sort(key=lambda x: x.lower())
    
    with open(index_path, 'w') as file:
        file.writelines(lines)

def get_file_hash(file_path):
    sha256_hash = hashlib.sha256()
    with open(file_path, "rb") as f:
        for byte_block in iter(lambda: f.read(4096), b""):
            sha256_hash.update(byte_block)
    return sha256_hash.hexdigest()

def process_script(script_path, script_info):
    print_colored(f"\nProcessing script: {script_path}", Fore.BLUE, Style.BRIGHT)
    
    filename = os.path.basename(script_path)
    markdown_path = os.path.join(DOCS_scripts, f"{filename}.md")
    
    current_hash = get_file_hash(script_path)
    
    if filename in script_info and script_info[filename]['hash'] == current_hash:
        print_colored(f"Skipping unchanged script: {script_path}", Fore.YELLOW)
        return
    
    if is_binary(script_path):
        source_path = find_source_file(script_path)
        if source_path:
            script_content = read_script(source_path)
        else:
            script_content = None
    else:
        script_content = read_script(script_path)
    
    if script_content:
        description = describe_script(script_path, script_content)
    else:
        description = "No information could be generated for this binary file."
    
    os.makedirs(DOCS, exist_ok=True)
    
    write_markdown(markdown_path, description)
    
    index_path = os.path.join(DOCS, "index.md")
    relative_path = os.path.relpath(markdown_path, DOCS)
    update_index(index_path, filename, relative_path)
    
    short_description = description.split('---')[1].strip()
    
    script_info[filename] = {
        'file': filename,
        'path': os.path.relpath(script_path, SCRIPTS),
        'description': short_description,
        'doc_path': os.path.relpath(markdown_path, SCRIPTS),
        'hash': current_hash
    }

def update_readme(script_info):
    readme_path = os.path.join(SCRIPTS, 'README.md')
    with open(readme_path, 'r') as file:
        content = file.read()

    # Update the first section
    start_index = content.index('<!-- llm_generated_output_start -->')
    end_index = content.index('<!-- llm_generated_output_end -->')
    
    summary = "This repository contains a collection of personal scripts for various tasks. These scripts include common tools and utilities to streamline workflows and automate repetitive tasks."
    
    new_content = f"{content[:start_index]}<!-- llm_generated_output_start -->\n\n{summary}\n\n<!-- llm_generated_output_end -->{content[end_index + len('<!-- llm_generated_output_end -->'):]}"

    # Update the table
    table_start_index = new_content.index('<!-- table_start -->')
    table_end_index = new_content.index('<!-- table_end -->')
    
    table_content = "| File | Description |\n| --- | --- |\n"
    for filename, info in sorted(script_info.items()):
        table_content += f"| [{filename}]({info['doc_path']}) | {info['description']} |\n"
    
    new_content = f"{new_content[:table_start_index]}<!-- table_start -->\n\n{table_content}\n<!-- table_end -->{new_content[table_end_index + len('<!-- table_end -->'):]}"

    with open(readme_path, 'w') as file:
        file.write(new_content)

def process_csv(csv_path):
    print_colored(f"Processing CSV file: {csv_path}", Fore.BLUE, Style.BRIGHT)
    script_info_path = os.path.join(SCRIPTS, 'data', 'script_info.json')
    
    if os.path.exists(script_info_path):
        with open(script_info_path, 'r') as f:
            script_info = json.load(f)
    else:
        script_info = {}
    
    with open(csv_path, 'r') as csvfile:
        reader = csv.reader(csvfile)
        next(reader)  # Skip header
        for row in reader:
            original_path, symlink, command_name = row
            process_script(original_path, script_info)
    
    with open(script_info_path, 'w') as f:
        json.dump(script_info, f, indent=2)
    
    update_readme(script_info)

def cleanup_after_the_llm():
    patterns = ["^<template>", "</template>"]
    for pattern in patterns:
        try:
            subprocess.run([
                'rg', pattern, DOCS, '-l',
                '|', 'xargs', 'sed', '-i', f'/{pattern}/d'
            ], shell=True, check=True)
        except subprocess.CalledProcessError:
            print(f"No files found with '{pattern}'")

def main():
    parser = argparse.ArgumentParser(description="Describe scripts from a CSV file using gpt-4o-mini model.")
    parser.add_argument("csv_path", nargs='?', default=os.path.join(SCRIPTS, 'data', 'symlink_data.csv'),
                        help="Path to the CSV file (default: $SCRIPTS/data/symlink_data.csv)")
    args = parser.parse_args()

    csv_path = os.path.abspath(args.csv_path)
    
    if not os.path.exists(csv_path):
        print_colored(f"Error: The CSV file '{csv_path}' does not exist.", Fore.RED, Style.BRIGHT)
        sys.exit(1)

    run_update_symlinks()

    script_files = get_script_files()
    
    process_csv(csv_path)
    
    check_orphaned_docs(script_files)
    
    print_colored("Script processing completed successfully.", Fore.GREEN, Style.BRIGHT)
    cleanup_after_the_llm()

if __name__ == "__main__":
    main()
