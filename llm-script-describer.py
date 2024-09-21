#!/usr/bin/env python

import argparse
import csv
import hashlib
import json
import os
import subprocess
import sys

from colorama import Back, Fore, Style, init
from openai import OpenAI

# Initialize colorama for cross-platform colored output
init()

# SCRIPTS folder
SCRIPTS_PATH = os.environ.get("SCRIPTS", "")

README_PATH = os.path.join(SCRIPTS_PATH, "README.md")

# DOCUMENTATION
DOCS_PATH = os.path.join(SCRIPTS_PATH, "docs")
INDEX_PATH = os.path.join(DOCS_PATH, "index.md")
DOCS_SCRIPTS_PATH = os.path.join(DOCS_PATH, "scripts")

# JSON file (primarily used by this script to know if a new documentation is needed)
INFO_JSON_PATH = os.path.join(SCRIPTS_PATH, "data", "script_info.json")

# location and possible extensions of source files for binary scripts that can't be read
BIN_FILE_SRC_PATH = os.path.join(SCRIPTS_PATH, "src")
SRC_FILE_EXTENSIONS = [
    ".c",
    ".cpp",
    ".py",
    ".sh",
    ".rs",
    ".go",
    ".js",
    ".ts",
    ".rb",
    ".java",
    ".cs",
]

client = OpenAI(api_key=os.environ.get("OPENAI_API_KEY"))
llm_model = "gpt-4o-mini"

system_prompt_1 = """\
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
The documentation's length should be between 200 and 400 words, depending on the complexity of the script.
You can use any github flavored markdown formatting to make the description clear (including code blocks, bloquotes, lists, tables, footnote, lines, etc), except when explicitly told otherwise.

4) For sections, always use the template provided below, after the tag <TEMPLATE_START> and 3 new lines (don't include this tag).
4.1) Lines between double accolades ({{ }}) are comments to give you guidance. Follow the advice but don't include the accolades.
4.2) Words between double brackets ([[]]) are to be substituted with the relevant value (example: '[[filename]]' becomes 'ardour-open.sh' when documenting the file called 'ardour-open.sh').
4.3) Finally other words and lines should remain as is.):

<TEMPLATE_START>


# [[Script Name]] {{choose an appropriate title}}

---

**[[filename]]**: [[Brief description of the script (maximum 100 characters), no special formating, be concise]]

---

### Dependencies

{{A list of any dependencies required by the script (including user scripts) ; NB: dependancies are always displayed with backquotes. You can add a brief description of the dependency.}}

### Description

{{Provide a more in depth description of the script, feel free to format this section as you find fits the best, including explaining functions or utilities used}}

### Usage

{{Explain how to use the script, including any command-line arguments, if it needs to be run interactively in a terminal or can be assigned to a keybinding, executed automatically, etc. Make heavy use of code blocks and provide examples of how to use the script in a "tldr" style}}

---

{{include a "critique" section, inside a mardown blockquote, where you, as the assistant, point out problems in the scripts or potential improvements. The first line should be '> [!TIP]' (you can switch TIP with NOTE, IMPORTANT, WARNING or even CAUTION}}
"""

system_prompt_2 = """\
1) You are a helpful assistant that generates a summary of the content of a GitHub script repository.Your audience is mainly the creator of the scripts themselves so provide information adapted to his context (OS : Arch linux, WM : qtile).
2) Your goal is to create a summary of the script repository based on the documentation for all of the scripts that you will receive. This will be integrated in the README.md file, so it shouldn't be too specific (DON'T DESCRIBE EACH SCRIPT INDIVIDUALLY). 
3) You should write a 300-400 word description of the kind of script it contains (You are free to format it using markdown features available on github, such as blockquotes, code blocks, lists, etc. WITH THE EXCEPTION OF HEADERS).
4) If you want to reference a script called "<script.sh>" in the summary, you can reference it like this : "[script.sh](docs/scripts/<scripts.sh>.md)" so that it will link to the documentation file on Github.
5) The user will send you the full content of the documentation in a single message. Each file documents a single script. The script filename is preceded with [FILE] and separated of the file content by a new line, '***' and a couple more new lines. Finally, each file is separated by '==='. Below you can see an example with 2 files :


[FILE] script_filename1.sh
***

<content of documentation of script 1>

===

[FILE] script_filename2.py
***

<content of documentation of script 2>

===
...
"""


def print_colored(message, kind="normal", style=Style.NORMAL, end="\n"):
    if kind == "main_section":
        color = Back.BLUE
        style = Style.BRIGHT
    elif kind == "main_function":
        color = Fore.CYAN
        style = Style.BRIGHT
    elif kind == "function_call":
        color = Fore.BLUE
    elif kind == "llm":
        color = Fore.MAGENTA
        style = Style.BRIGHT
    elif kind == "success":
        color = Fore.GREEN
    elif kind == "victory":
        color = Back.GREEN
        style = Style.BRIGHT
    elif kind == "error":
        color = Back.RED
        style = Style.BRIGHT
    elif kind == "warn":
        color = Fore.RED
    elif kind == "info":
        color = Fore.YELLOW
    else:
        color = Fore.WHITE
        style = Style.NORMAL
    print(f"{style}{color}{message}{Style.RESET_ALL}", end=end)


# INFO_JSON -> file content of INFO_JSON_PATH
if os.path.exists(INFO_JSON_PATH):
    with open(INFO_JSON_PATH, "r") as f:
        INFO_JSON = json.load(f)
        print_colored(f"Found existing {INFO_JSON_PATH} !", kind="success")
else:
    INFO_JSON = {}
    print_colored(f"Creating {INFO_JSON_PATH} !", kind="info")


def run_update_symlinks():
    print_colored(
        "Do you want to run utils_update_symlinks.sh? (y/N): ", kind="info", end=""
    )
    response = input().lower()
    if response in ["y", "yes"]:
        print_colored("Running utils_update_symlinks.sh...", kind="info")
        try:
            subprocess.run(["utils_update_symlinks.sh"], check=True)
            print_colored(
                "utils_update_symlinks.sh completed successfully.", kind="success"
            )
        except subprocess.CalledProcessError:
            print_colored("Error: Failed to run utils_update_symlinks.sh", kind="error")
            sys.exit(1)
    else:
        print_colored("Skipping utils_update_symlinks.sh", kind="info")


def get_script_files():
    # find all files in $SCRIPTS (not only executables because for binaries
    # I need the source files as well)
    fd_cmd = f"fd . -tf {SCRIPTS_PATH}"
    # Exclude folders that for sure don't have useful data, and especially
    # exclude 'archived' so its docs don't clunk up the documentation
    fd_cmd += " -E archived -E config -E docs -E log -E data"
    fd_cmd += " --format {/}"
    # Get rid of potential other files
    fd_cmd += " | rg -v '\\.md$|\\.png$|\\.csv$'"
    try:
        result = subprocess.run(
            fd_cmd,
            shell=True,
            check=True,
            stdout=subprocess.PIPE,
            universal_newlines=True,
        )

        return set(result.stdout.splitlines())
    except subprocess.CalledProcessError:
        print_colored("Error: Failed to get script files", kind="error")
        return set()


def rm_orphaned_docs(script_files):
    print_colored("Checking for orphaned doc files...", kind="function_call")
    orphaned_docs = []
    for doc_file in os.listdir(DOCS_SCRIPTS_PATH):
        if doc_file.endswith(".md"):
            script_name = doc_file[:-3]  # Remove .md extension
            if script_name not in script_files:
                orphaned_docs.append(doc_file)

    if orphaned_docs:
        print("")
        print_colored("Orphaned doc files found!", kind="warn")
        for doc in orphaned_docs:
            print_colored(f"    - Removing {doc}", kind="info")
            subprocess.run(f"rm {DOCS_SCRIPTS_PATH}/{doc}", shell=True, check=True)
    else:
        print_colored("No orphaned documentation files found.", kind="success")


def is_binary(file_path):
    print_colored(f"Checking if file is binary: {file_path}", kind="function_call")
    try:
        with open(file_path, "rb") as file:
            chunk = file.read(1024)
            return b"\0" in chunk
    except IOError:
        return False


def find_source_file(binary_path):
    print_colored(
        f"Attempting to find source file for: {binary_path}", kind="function_call"
    )
    filename = os.path.basename(binary_path)
    name_without_ext = os.path.splitext(filename)[0]

    for ext in SRC_FILE_EXTENSIONS:
        source_path = os.path.join(BIN_FILE_SRC_PATH, f"{name_without_ext}{ext}")
        if os.path.exists(source_path):
            print_colored(f"Found source file: {source_path}", kind="success")
            return source_path

    print_colored(f"No source file found for: {binary_path}", kind="error")
    return None


def read_script(file_path):
    print_colored(f"Reading script: {file_path}", kind="function_call")
    with open(file_path, "r") as file:
        return file.read()


def describe_script(script_path, script_content):
    print_colored("Generating description using gpt-4o-mini model...", kind="llm")
    try:
        response = client.chat.completions.create(
            model=llm_model,
            messages=[
                {"role": "system", "content": system_prompt_1},
                {
                    "role": "user",
                    "content": f"file: {script_path}\n\n________content:\n\n{script_content}",
                },
            ],
        )
        return response.choices[0].message.content
    except Exception as e:
        print_colored(f"Error generating description: {str(e)}", kind="error")
        return "Error: Unable to generate description."


def llm_summarize():
    print_colored("Generating doc summary using gpt-4o-mini model...", kind="llm")
    dic = {}
    for d in os.listdir(DOCS_SCRIPTS_PATH):
        with open(os.path.join(DOCS_SCRIPTS_PATH, d)) as f:
            data = f.read()
        dic[d] = data
    content = "".join(
        [f"[FILE]: {k[:-3]}\n***\n\n{v}\n\n===\n\n" for k, v in dic.items()]
    )
    try:
        response = client.chat.completions.create(
            model=llm_model,
            messages=[
                {"role": "system", "content": system_prompt_2},
                {"role": "user", "content": content},
            ],
        )
        return response.choices[0].message.content
    except Exception as e:
        print_colored(f"Error generating summary: {str(e)}", kind="error")
        return "Error: Unable to generate summary."


def write_markdown(filename, content):
    print_colored(f"Writing markdown file: {filename}", kind="success")
    with open(filename, "w") as file:
        file.write(content)


def update_index(filename, relative_path, short_description):
    print_colored(f"Updating index file: {INDEX_PATH}", kind="info")
    with open(INDEX_PATH, "a") as file:
        pass
    with open(INDEX_PATH, "r") as file:
        lines = file.readlines()

    new_line = f"- [{filename}]({relative_path}) -- *{short_description}*\n"
    for n, l in enumerate(lines):
        if filename in l.split("](")[0]:
            lines.pop(n)
    lines.append(new_line)

    lines.sort(key=lambda x: x.lower())

    with open(INDEX_PATH, "w") as file:
        file.writelines(lines)


def get_file_hash(file_path):
    sha256_hash = hashlib.sha256()
    with open(file_path, "rb") as f:
        for byte_block in iter(lambda: f.read(4096), b""):
            sha256_hash.update(byte_block)
    return sha256_hash.hexdigest()


def process_script(script_path):
    print_colored(f"\nProcessing script: {script_path}", kind="function_call")

    filename = os.path.basename(script_path)
    markdown_path = os.path.join(DOCS_SCRIPTS_PATH, f"{filename}.md")

    print_colored(f"Getting hash for {filename}...")
    current_hash = get_file_hash(script_path)

    if filename in INFO_JSON and INFO_JSON[filename]["hash"] == current_hash:
        print_colored(f"Skipping unchanged script: {script_path}", kind="info")
        return

    if is_binary(script_path):
        print_colored(
            f"{script_path} is a binary file, trying to find the source file..."
        )
        source_path = find_source_file(script_path)
        if source_path:
            print_colored(f"Found source {source_path}", kind="success")
            script_content = read_script(source_path)
        else:
            script_content = None
            print_colored(
                "No Found source {source_path}", kind="success", style="Style.dim"
            )
    else:
        script_content = read_script(script_path)

    if script_content:
        description = describe_script(script_path, script_content)
    else:
        description = "No information could be generated for this binary file."

    os.makedirs(DOCS_PATH, exist_ok=True)

    write_markdown(markdown_path, description)

    relative_path = os.path.relpath(markdown_path, DOCS_PATH)
    short_description = description.split("---")[1].split(":")[-1].strip()
    update_index(filename, relative_path, short_description)

    INFO_JSON[filename] = {
        "file": filename,
        "path": os.path.relpath(script_path, SCRIPTS_PATH),
        "description": short_description,
        "doc_path": os.path.relpath(markdown_path, SCRIPTS_PATH),
        "hash": current_hash,
    }


def update_readme():

    with open(README_PATH, "r") as file:
        content = file.read()

    # Update the first section
    llm_start_tag = "<!-- llm_generated_output_start -->"
    llm_end_tag = "<!-- llm_generated_output_end -->"
    start_idx = content.index(llm_start_tag)
    end_idx = content.index(llm_end_tag)

    summary = llm_summarize()

    new_content = f"{content[:start_idx] + llm_start_tag}\n\n{summary}\n\n{llm_end_tag + content[end_idx + len(llm_end_tag):]}"

    # Update the table
    table_start_tag = "<!-- table_start -->"
    table_end_tag = "<!-- table_end -->"
    table_start_index = new_content.index(table_start_tag)
    table_end_index = new_content.index(table_end_tag)

    table_content = "| File | Description |\n| --- | --- |\n"
    for filename, info in sorted(INFO_JSON.items()):
        table_content += (
            f"| [{filename}]({info['doc_path']}) | {info['description']} |\n"
        )

    new_content = f"{new_content[:table_start_index]+table_start_tag}\n\n{table_content}\n{table_end_tag + new_content[table_end_index + len(table_end_tag):]}"

    with open(README_PATH, "w") as file:
        file.write(new_content)


def process_csv(csv_path):

    # uses the csv file as script source
    with open(csv_path, "r") as csvfile:
        reader = csv.reader(csvfile)
        next(reader)  # Skip header
        for row in reader:
            original_path, symlink, command_name = row
            process_script(original_path)

    with open(INFO_JSON_PATH, "w") as f:
        json.dump(INFO_JSON, f, indent=2)


def main():
    parser = argparse.ArgumentParser(
        description="Describe scripts from a CSV file using gpt-4o-mini model."
    )
    parser.add_argument(
        "csv_path",
        nargs="?",
        default=os.path.join(SCRIPTS_PATH, "data", "symlink_data.csv"),
        help="Path to the CSV file (default: $SCRIPTS/data/symlink_data.csv)",
    )
    args = parser.parse_args()

    csv_path = os.path.abspath(args.csv_path)

    if not os.path.exists(csv_path):
        print_colored(f"Error: The CSV file '{csv_path}' does not exist.", kind="error")

    print_colored("Updating symlinks (optionnal)", kind="main_section")
    run_update_symlinks()

    print_colored("Removing orphaned docs", kind="main_section")
    rm_orphaned_docs(get_script_files())

    print_colored(
        f"Reading scripts from CSV file and creating docs and json datafile: {csv_path}",
        kind="main_section",
    )
    process_csv(csv_path)

    print_colored("Updating README.md", kind="main_section")
    update_readme()

    print_colored("Script processing completed successfully.", kind="victory")


if __name__ == "__main__":
    main()
