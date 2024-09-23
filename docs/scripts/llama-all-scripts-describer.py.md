# Llama All Scripts Describer

---

**llama-all-scripts-describer.py**: Generates GitHub documentation for scripts using Llama 3.1 model.

---

### Dependencies

- `colorama`: A library for cross-platform colored output in terminal.
- `ollama`: A client library that interacts with the Llama model for generating descriptions.
- `fd`: A fast alternative to `find`, used for searching files.
- `rg`: Ripgrep, a command line search tool that recursively searches your current directory for a regex pattern.

### Description

This script automates the process of generating GitHub documentation for user scripts stored in a specified directory. It uses Llama 3.1 model to generate human-readable descriptions from the contents of each script. 

Upon execution, it prompts the user to run a separate Bash script, `utils_update_symlinks.sh`, for updating symbolic links. It checks for executable script files and identifies orphaned documentation files that do not correspond to any existing scripts.

Key functionalities include:
- **Colorful console output**: Using `colorama` to create visually distinct messages.
- **File Checking**: Identifies both script and binary files, and attempts to locate source files for binaries.
- **Documentation Generation**: Reads each script, generates a description using the Llama model, and writes it into a Markdown file.
- **Index Updating**: Maintains an index of all generated documentation for easy navigation.

### Usage

To use the script, follow these steps:

1. Ensure the environment variable `SCRIPTS` is set to the directory containing your scripts and markdown documentation.
2. Execute the script with the optional path to your CSV file containing script information:

```bash
python /home/matias/.scripts/llama-all-scripts-describer.py /path/to/your/csvfile.csv
```

If no CSV path is provided, it defaults to `$SCRIPTS/data/symlink_data.csv`.

### Command-line Arguments

- `csv_path`: Path to the CSV file (defaults to `$SCRIPTS/data/symlink_data.csv`).

---

> [!TIP]  
This script operates without error handling on some subprocess calls, which could lead to silent failures. Consider adding more robust error handling to ensure that issues with file handling or external commands are caught and communicated clearly to the user. Additionally, since it depends on the Llama model, ensure that network access is available during execution, as it may not process offline.