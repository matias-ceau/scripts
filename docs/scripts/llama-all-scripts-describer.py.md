# Llama Script Describer

---

**[llama-all-scripts-describer.py](llama-all-scripts-describer.py)**: Automates script documentation generation using Llama 3.1

---

### Dependencies

- `ollama`: A library to interface with the Llama language model for generating documentation.
- `colorama`: A package for cross-platform colored terminal text.
- `fd`: A fast and simple file finder.
- `rg`: A command-line search tool (ripgrep) for filtering files.

### Description

This Python script is designed to facilitate the automatic generation of documentation for user scripts found in a specified directory. By leveraging the Llama 3.1 model, the script reads the content of each script file, analyzes it, and produces a structured markdown documentation file.

Key functionalities:

1. **Script Detection**: It identifies script files in the directory specified by the `SCRIPTS` environment variable, excluding markdown files.
2. **Orphaned Documentation Checking**: It checks for existing markdown documentation files and alerts the user if they do not have corresponding script files.
3. **Binary File Handling**: If a script is binary, it attempts to find its source file.
4. **Llama Interaction**: It communicates with the Llama model to generate documentation based on script content.
5. **Markdown Generation**: It creates and writes markdown files with generated documentation and updates an index.

### Usage

To execute the script, navigate to the terminal and run:

```bash
python /home/matias/.scripts/llama-all-scripts-describer.py [path_to_csv]
```

If `path_to_csv` is not supplied, the script defaults to `$SCRIPTS/data/symlink_data.csv`.

#### Example:

```bash
# Running the script with the default CSV file
python /home/matias/.scripts/llama-all-scripts-describer.py
```

**Interactive Element**: The script will prompt whether to execute `utils_update_symlinks.sh`. Respond with 'y' or 'yes' to run it or 'n' to skip.

---

> [!TIP]  
> The script could benefit from additional error handling for file I/O operations to ensure robustness, especially during the reading of binary files. Additionally, logging can be implemented for better tracking of operations and errors across larger projects. Consider compressing redundant functionalities into reusable functions to improve code readability and maintenance.
