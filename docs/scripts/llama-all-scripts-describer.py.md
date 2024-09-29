# Llama Script Describer

---

**llama-all-scripts-describer.py**: Automatically generates GitHub documentation for scripts using Llama 3.1 model.

---

### Dependencies

- `argparse`: Provides a command-line argument parser.
- `csv`: For handling CSV file reading.
- `os`: For interacting with the operating system.
- `subprocess`: To run external scripts and commands.
- `sys`: Provides access to system-specific parameters and functions.
- `colorama`: Enables colored output in terminal across platforms.
- `ollama`: Client library to interact with the Llama model for generating text.

### Description

This script automates the generation of helpful GitHub documentation for scripts present in a specified directory. It uses the Llama 3.1 model to describe each script's functionality based on its content. Major functionalities include:

- **Colorful Console Output**: Utilizes `colorama` for color-coded terminal messages, improving the readability of outputs.
- **Script Discovery**: Gathers script files from a specified directory while excluding markdown files.
- **Orphaned Document Check**: Identifies any documentation files not linked to existing scripts, prompting the user to manage them.
- **Source File Resolution**: When provided a binary file, the script attempts to find and read its source code from a specified directory.
- **CSV Integration**: Processes scripts listed in a CSV file, allowing batch documentation generation.

### Usage

To run the script, you must provide a path to a CSV file with script metadata. If no path is provided, it defaults to `$SCRIPTS/data/symlink_data.csv`. Here's how to use it:

```bash
python /home/matias/.scripts/llama-all-scripts-describer.py /path/to/your/csv_file.csv
```

#### Key Command-Line Arguments:

- `csv_path`: Path to the CSV file containing script information (optional, defaults to `$SCRIPTS/data/symlink_data.csv`).

#### Typical Workflow:

1. Run the script to generate documentation for all scripts defined in the CSV.
2. The script will prompt whether to execute the `utils_update_symlinks.sh` script and then continue processing.
3. It will create markdown documentation for each script and update an index file when completed.

---

> [!TIP]  
> The script currently lacks robust error handling for file reading operations which could lead to unstable behavior. Consider adding more exception handling to improve reliability, specifically around file I/O. Additionally, the script assumes that the CSV format is strictly followed; adding checks to validate entries could avoid potential runtime errors.