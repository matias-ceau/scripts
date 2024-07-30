# utils_update_readme.py

# Script Documentation: Update README.md with Script Info

## Overview

This script updates the `README.md` file with information about available scripts. The script gathers data from a CSV file and inserts it into a specified section of the `README.md` file.

## Functionalities

- **Run cache_script_info**: Fetches the latest script information via a command-line tool `cache_script_info`.
- **CSV Reading**: Reads data from a CSV file that contains script information.
- **Markdown Table Formatting**: Formats the CSV data into a markdown table.
- **Update README**: Inserts or updates a specific section in the `README.md` file with the generated markdown table.

## Detailed Description

### Running the Cache Script Info

The function `run_cache_script_info()` executes the `cache_script_info` command to fetch the latest script information.

```python
def run_cache_script_info():
    subprocess.run(['cache_script_info'])
```

### Reading CSV Data

The function `read_csv(file_path)` reads CSV data from a specified file path and returns it as a list of dictionaries.

```python
def read_csv(file_path):
    with open(file_path, 'r') as file:
        reader = csv.DictReader(file)
        return list(reader)
```

### Formatting Data to Markdown Table

The function `format_to_markdown_table(data)` converts the CSV data into a markdown table format. It also sorts the data based on the `status` and `file` columns.

```python
def format_to_markdown_table(data):
    headers = ["file", "description", "date", "type", "status", "host", "tag"]
    table = "| " + " | ".join(headers) + " |\n"
    table += "| " + " | ".join(['---'] * len(headers)) + " |\n"

    sorted_data = sorted(data, key=lambda x: (x['status'], x['file']))

    for row in sorted_data:
        table += "| " + " | ".join([row[header] if row[header] else "" for header in headers]) + " |\n"

    return table
```

### Updating the README.md File

The function `update_readme(table, readme_path)` takes the formatted markdown table and updates the `README.md` file. It looks for placeholders `<!-- script_info_start -->` and `<!-- script_info_end -->` to insert the table.

```python
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
```

### Main Function

The `main()` function orchestrates the entire process: it runs the cache script, reads the CSV data, formats it into a markdown table, and updates the README file.

```python
def main():
    run_cache_script_info()
    csv_data = read_csv(os.path.expanduser('~/.scripts/data/script_info.csv'))
    markdown_table = format_to_markdown_table(csv_data)
    update_readme(markdown_table, os.path.expanduser('~/.scripts/README.md'))

if __name__ == "__main__":
    main()
```

## Usage

To use this script, simply run it in an environment where the `cache_script_info` tool is available and executable.

```sh
python path_to_script/update_readme.py
```

Ensure the `script_info.csv` file exists at `~/.scripts/data/script_info.csv`, and the `README.md` file is located at `~/.scripts/README.md`.

## Prerequisites

- Python 3.6 or later
- Necessary permissions to run `cache_script_info` and read/write access to `~/.scripts/data/script_info.csv` and `~/.scripts/README.md`.
- `cache_script_info` command should be available and executable.

This script automates the process of keeping your `README.md` up to date with the latest script information, making it an invaluable tool for maintaining up-to-date documentation.