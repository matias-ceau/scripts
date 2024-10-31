# Script Describer using Llama 3.1

---

**llama-all-scripts-describer.py**: Automate the generation of Markdown documentation for scripts using Llama 3.1.

---

### Dependencies

- `argparse`: Standard Python module for argument parsing.
- `csv`: Standard Python module for CSV file handling.
- `os`: Standard Python module for OS interaction.
- `subprocess`: Standard Python module for running shell commands.
- `sys`: Standard Python module for system-specific parameters and functions.
- `colorama`: For colored terminal text in a cross-platform manner.
- `ollama`: Python client for interacting with AI models like Llama 3.1.
- `fd`, `rg` (ripgrep): Utilities used to search for files.
- `utils_update_symlinks.sh`: Custom user script for updating symlinks.

### Description

This script facilitates the generation of detailed GitHub-style Markdown documentation for user-created scripts located in a specified directory structure. It utilizes the Llama 3.1 model via the `ollama` package, generating descriptions automatically. The script checks for orphaned documentation files, detects binary files to find their corresponding source code, reads existing script files, generates Markdown documentation, and maintains an index of documented scripts. The script is primarily intended for users with an Arch Linux system and qtile window manager setup, utilizing a custom environment variable `$SCRIPTS` for locating script directories and the CSV file detailing scripts and symlinks.

### Usage

You can execute the script directly from the terminal. It can either take a CSV file as an argument or process the default CSV file specified in the environment variable.

```bash
python /home/matias/.scripts/bin/llama-all-scripts-describer.py [optional_csv_path]
```

The script will interactively prompt to run `utils_update_symlinks.sh` optionally. It processes each script and generates corresponding markdown documentation in `$SCRIPTS/docs/scripts` directory. Additionally, updates are appended to an index file in `$SCRIPTS/docs/index.md`.

**Example Command:**

```bash
python /home/matias/.scripts/bin/llama-all-scripts-describer.py /path/to/csv_file.csv
```

---

> [!WARNING]  
> Some potential improvements include converting shell subprocesses to native Python for better performance and error handling. Additionally, ensure all environment variables are correctly set, as the script heavily relies on them. Also, consider adding logging for easier debugging and tracking execution flow.