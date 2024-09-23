# ChatGPT All Scripts Describer

---

**chatgpt-all-scripts-describer.py**: A Python script to generate GitHub documentation for user scripts.

---

### Dependencies

- `colorama`: A library to print colored text in the terminal.
- `openai`: The OpenAI API client for interacting with the GPT models.
- `argparse`: Python's built-in library for parsing command-line arguments.
- `csv`: A built-in library for CSV file operations.
- `os`, `subprocess`, `sys`: Essential standard libraries for file and command execution operations.
  
### Description

This script automates the process of generating Markdown documentation for scripts located in a specified directory. It does so by reading script files, determining their contents, and using the OpenAI API (specifically the `gpt-4o` model) to generate descriptive content. 

The script performs several key functions:

1. **Running Symlink Updates**: It prompts the user to run another script called `utils_update_symlinks.sh`.
2. **File Management**: It scans a specific directory for existing scripts, checking for orphaned documentation files.
3. **Source File Identification**: For binary files, it attempts to locate the corresponding source files.
4. **Script Processing**: It reads script contents and generates documentation by querying OpenAI's GPT model.
5. **Markdown Generation**: The documentation is saved in Markdown format, and an index is updated in the documentation directory.

### Usage

To use the script, run it from your terminal, making sure to provide an optional path to a CSV file containing information about the scripts. Here’s how to execute it:

```bash
python chatgpt-all-scripts-describer.py /path/to/your/csvfile.csv
```

If the CSV path is not provided, it defaults to `$SCRIPTS/data/symlink_data.csv`.

### Example

To process the default CSV file using the script, run:

```bash
python chatgpt-all-scripts-describer.py
```

The script will then execute the following steps:
1. Ask to run a symlink update script.
2. Gather available script files.
3. Process scripts mentioned in the CSV to generate corresponding Markdown documentation.

---

> [!TIP]  
> The script relies on the OpenAI service, which requires an API key stored in the `OPENAI_API_KEY` environment variable. Make sure this is set correctly before running the script. Additionally, functions could be modularized further for improved readability and maintainability. Consider implementing error handling for cases where documentation or script files are not found.