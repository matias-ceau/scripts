# Script Describer

---

**llama-all-scripts-describer.py**: Automatically generates GitHub documentation for scripts using Llama 3.1.

---

### Dependencies

- `argparse`: Built-in library for parsing command-line arguments.
- `csv`: Built-in library to handle CSV files.
- `subprocess`: Used for executing shell commands.
- `ollama`: Python client for interacting with the Llama model.
- `colorama`: Facilitates colored terminal output for better readability.
- `fd`: A simple, fast, and user-friendly alternative to `find`.
- `rg`: A tool that combines text searching (grep) with the power of Rust.

### Description

This script is designed to automate the process of generating descriptive documentation for various scripts within a defined directory. It utilizes the Llama 3.1 model for generating descriptions based on the script content. Here’s how the script operates:

1. **Completion Check**: The script checks for the existence of binary files and tries to find their source counterparts.
2. **Descriptive Generation**: Content from the identified scripts is sent to the Llama 3.1 model, which generates a comprehensive description.
3. **Documentation Management**: It manages orphaned documentation files by identifying documentation that doesn’t correspond to any script.
4. **Interactive Features**: The script prompts the user about whether to run a utility script for updating symlinks.

### Usage

To run the script, call it from the terminal and pass the path to the CSV file containing script information:
```bash
python /home/matias/.scripts/llama-all-scripts-describer.py /path/to/your.csv
```
If no CSV path is provided, it defaults to `$SCRIPTS/data/symlink_data.csv`.

---

> [!TIP] Consider handling the case where the Llama model is unavailable or fails to generate a description, and improve user interactions by providing more detailed prompts or confirmations. Additionally, consider logging more errors to better understand potential issues during execution.