#!/usr/bin/env python

import argparse
import csv
import os
import subprocess
import sys

from colorama import Fore, Style, init
from openai import OpenAI

# Initialize colorama for cross-platform colored output
init()

client = OpenAI(api_key=os.environ.get("OPENAI_API_KEY"))


def print_colored(message, color=Fore.WHITE, style=Style.NORMAL, end="\n"):
    print(f"{style}{color}{message}{Style.RESET_ALL}", end=end)


def run_update_symlinks():
    print_colored(
        "Do you want to run utils_update_symlinks.sh? (y/N): ",
        Fore.YELLOW,
        Style.BRIGHT,
        end="",
    )
    response = input().lower()
    if response in ["y", "yes"]:
        print_colored("Running utils_update_symlinks.sh...", Fore.CYAN)
        try:
            subprocess.run(["utils_update_symlinks.sh"], check=True)
            print_colored(
                "utils_update_symlinks.sh completed successfully.", Fore.GREEN
            )
        except subprocess.CalledProcessError:
            print_colored("Error: Failed to run utils_update_symlinks.sh", Fore.RED)
            sys.exit(1)
    else:
        print_colored("Skipping utils_update_symlinks.sh", Fore.YELLOW)


def get_script_files():
    scripts_dir = os.environ.get("SCRIPTS", "")
    try:
        result = subprocess.run(
            f"fd '' -tf {scripts_dir} | rg -v 'md$' | xargs -I {{}} basename {{}}",
            shell=True,
            check=True,
            stdout=subprocess.PIPE,
            universal_newlines=True,
        )
        return set(result.stdout.splitlines())
    except subprocess.CalledProcessError:
        print_colored("Error: Failed to get script files", Fore.RED)
        return set()


def check_orphaned_docs(script_files):
    docs_dir = os.path.join(os.environ.get("SCRIPTS", ""), "docs", "scripts")
    orphaned_docs = []
    for doc_file in os.listdir(docs_dir):
        if doc_file.endswith(".md"):
            script_name = doc_file[:-3]  # Remove .md extension
            if script_name not in script_files:
                orphaned_docs.append(doc_file)

    if orphaned_docs:
        print("")
        print_colored("The following documentation files are orphaned:", Fore.CYAN)
        for doc in orphaned_docs:
            print_colored(f"  - {doc}", Fore.RED)
        print_colored(
            "Consider removing these files or updating the documentation.", Fore.YELLOW
        )
    else:
        print_colored("No orphaned documentation files found.", Fore.GREEN)


def is_binary(file_path):
    print_colored(f"Checking if file is binary: {file_path}", Fore.CYAN)
    try:
        with open(file_path, "rb") as file:
            chunk = file.read(1024)
            return b"\0" in chunk
    except IOError:
        return False


def find_source_file(binary_path):
    print_colored(f"Attempting to find source file for: {binary_path}", Fore.CYAN)
    filename = os.path.basename(binary_path)
    name_without_ext = os.path.splitext(filename)[0]
    scripts_src = os.path.join(os.environ.get("SCRIPTS", ""), "src")

    extensions = [
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

    for ext in extensions:
        source_path = os.path.join(scripts_src, f"{name_without_ext}{ext}")
        if os.path.exists(source_path):
            print_colored(f"Found source file: {source_path}", Fore.GREEN)
            return source_path

    print_colored(f"No source file found for: {binary_path}", Fore.YELLOW)
    return None


def read_script(file_path):
    print_colored(f"Reading script: {file_path}", Fore.CYAN)
    with open(file_path, "r") as file:
        return file.read()


def describe_script(script_content):
    print_colored("Generating description using GPT-4o model...", Fore.MAGENTA)
    try:
        response = client.chat.completions.create(
            model="gpt-4o",
            messages=[
                {
                    "role": "system",
                    "content": "You are a helpful assistant that generates GitHub documentation in markdown format for scripts.",
                },
                {
                    "role": "user",
                    "content": f"Please generate the GitHub documentation (markdown format) of the following script (describe its functionalities):\n\n{script_content}",
                },
            ],
        )
        return response.choices[0].message.content
    except Exception as e:
        print_colored(f"Error generating description: {str(e)}", Fore.RED)
        return "Error: Unable to generate description."


def write_markdown(filename, content):
    print_colored(f"Writing markdown file: {filename}", Fore.GREEN)
    with open(filename, "w") as file:
        file.write(content)


def update_index(index_path, filename, relative_path):
    print_colored(f"Updating index file: {index_path}", Fore.GREEN)
    with open(index_path, "a") as file:
        file.write(f"- [{filename}]({relative_path})\n\n")


def process_csv(csv_path):
    print_colored(f"Processing CSV file: {csv_path}", Fore.BLUE, Style.BRIGHT)
    with open(csv_path, "r") as csvfile:
        reader = csv.reader(csvfile)
        next(reader)  # Skip header
        for row in reader:
            original_path, symlink, command_name = row
            process_script(original_path)


def process_script(script_path):
    print_colored(f"\nProcessing script: {script_path}", Fore.BLUE, Style.BRIGHT)

    filename = os.path.basename(script_path)
    docs_dir = os.path.join(os.environ.get("SCRIPTS", ""), "docs")
    scripts_docs_dir = os.path.join(docs_dir, "scripts")
    markdown_path = os.path.join(scripts_docs_dir, f"{filename}.md")

    if os.path.exists(markdown_path):
        print_colored(f"Skipping already processed script: {script_path}", Fore.YELLOW)
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
        description = describe_script(script_content)
    else:
        description = "No information could be generated for this binary file."

    os.makedirs(scripts_docs_dir, exist_ok=True)

    markdown_content = f"# {filename}\n\n{description}"
    write_markdown(markdown_path, markdown_content)

    index_path = os.path.join(docs_dir, "index.md")
    relative_path = os.path.relpath(markdown_path, docs_dir)
    update_index(index_path, filename, relative_path)


def main():
    parser = argparse.ArgumentParser(
        description="Describe scripts from a CSV file using Llama 3.1 model."
    )
    parser.add_argument(
        "csv_path",
        nargs="?",
        default=os.path.join(os.environ.get("SCRIPTS", ""), "data", "symlink_data.csv"),
        help="Path to the CSV file (default: $SCRIPTS/data/symlink_data.csv)",
    )
    args = parser.parse_args()

    csv_path = os.path.abspath(args.csv_path)

    if not os.path.exists(csv_path):
        print_colored(
            f"Error: The CSV file '{csv_path}' does not exist.", Fore.RED, Style.BRIGHT
        )
        sys.exit(1)

    run_update_symlinks()

    script_files = get_script_files()

    process_csv(csv_path)

    check_orphaned_docs(script_files)

    print_colored("Script processing completed successfully.", Fore.GREEN, Style.BRIGHT)


if __name__ == "__main__":
    main()
