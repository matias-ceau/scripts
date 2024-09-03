# ChatGPT Script Describer

---

**chatgpt-all-scripts-describer.py**: Generates GitHub markdown documentation for scripts using GPT-4o.

---

### Dependencies

- `openai`: Required for interacting with OpenAI's API to generate markdown documentation.
- `colorama`: Used to provide colored terminal output for better readability.
- `fd`: A command-line tool to find files.
- `rg`: Command-line utility for searching text using regular expressions.
- `csv`: Python's built-in library for reading and writing CSV files.
- `subprocess`: Used for executing shell commands.

### Description

This script automates the process of generating markdown documentation for user scripts. It reads script files from a specified directory, processes them, and generates a corresponding markdown file. The script utilizes OpenAI's GPT-4o model to generate descriptions based on the content of the scripts. It also performs checks for orphaned documentation and handles binary script scenarios by locating their source files.

1. **Color Output**: Using `colorama`, it enhances terminal output with color coding for different messages.
2. **Script Discovery**: Utilizes `fd` and `rg` to locate non-Markdown scripts in the specified scripts directory.
3. **Documentation Generation**: Reads script content, sends it to the OpenAI model, and writes back the auto-generated documentation.
4. **Orphaned Docs Check**: Validates and lists any Markdown files that do not correspond to existing scripts.
5. **CSV Input**: Accepts a CSV file to process multiple scripts and automate the documentation process.

### Usage

1. **Run the Script**: Execute the script from a terminal:
   ```bash
   python /home/matias/.scripts/archived/chatgpt-all-scripts-describer.py [path_to_csv]
   ```
   If no `path_to_csv` is provided, it defaults to `$SCRIPTS/data/symlink_data.csv`.

2. **CSV Format**: The CSV file should contain three columns: the original script path, symlink path, and command name.

3. **Interactive Mode**: The script will prompt to run `utils_update_symlinks.sh` if desired.

4. **Documentation Files**: It will generate `.md` files in the `docs/scripts/` directory based on each script processed.

---

> [!TIP] 
> The script could be improved with error handling for various subprocess calls and validating the content of scripts before sending them for documentation generation to avoid runtime errors. Consider adding unit tests to ensure reliability.