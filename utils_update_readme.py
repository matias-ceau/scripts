#! /usr/bin/env python

#DOC#=2024-07=@UTL@ "Updates the README.md file with the script info (provided by bin/cache_script_info)"

import csv
import os
import subprocess

def run_cache_script_info():
    subprocess.run(['cache_script_info'])

def read_csv(file_path):
    with open(file_path, 'r') as file:
        reader = csv.DictReader(file)
        return list(reader)

def format_to_markdown_table(data):
    headers = ["file", "description", "date", "type", "status", "host", "tag"]
    table = "| " + " | ".join(headers) + " |\n"
    table += "| " + " | ".join(['---'] * len(headers)) + " |\n"

    sorted_data = sorted(data, key=lambda x: (x['status'], x['file']))

    for row in sorted_data:
        table += "| " + " | ".join([row[header] if row[header] else "" for header in headers]) + " |\n"

    return table

def update_readme(table, readme_path):
    section_start = "<!-- script_info_start -->"
    section_end = "<!-- script_info_end -->"

    if os.path.exists(readme_path):
        with open(readme_path, 'r') as file:
            content = file.read()

        if section_start in content and section_end in content:
            content = content.split(section_start)[0] + section_start + "\n" + table + section_end + content.split(section_end)[1]
        else:
            content += f"\n{section_start}\n{table}\n{section_end}\n"
    else:
        content = f"# Scripts Information\n\n{section_start}\n{table}\n{section_end}\n"

    with open(readme_path, 'w') as file:
        file.write(content)

def main():
    run_cache_script_info()
    csv_data = read_csv(os.path.expanduser('~/.scripts/data/script_info.csv'))
    markdown_table = format_to_markdown_table(csv_data)
    update_readme(markdown_table, os.path.expanduser('~/.scripts/README.md'))

if __name__ == "__main__":
    main()
