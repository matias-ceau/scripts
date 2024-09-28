# Llama All Scripts Describer

---

**llama-all-scripts-describer.py**: Script to document user scripts and manage their associations with symlink data.

---

### Dependencies

- `argparse`: For parsing command-line arguments.
- `csv`: To handle CSV file reading.
- `os`: For environment interactions and path manipulations.
- `subprocess`: For executing shell commands.
- `sys`: To exit the script on error.
- `colorama`: For colored terminal output.
- `ollama` (assumed to be a custom or third-party library like Client): Used to interact with the Llama 3.1 model for script description.

### Description

This script automates the generation of GitHub documentation for various user scripts. It uses the Llama 3.1 model to generate descriptions in markdown format. The process involves reading a CSV file that contains script paths and their symlink data. If not already documented, it generates markdown files for each script, storing them in a predefined directory structure under `docs/scripts`. The script also checks for orphaned documentation files that no longer have associated scripts.

Key features:
- **Symlink Update**: Optionally runs `utils_update_symlinks.sh` to update script symlinks.
- **Script Identification**: Finds and differentiates between binary and non-binary files, fetching source code for binaries if possible.
- **Description Generation**: Uses the Llama 3.1 model to generate detailed markdown descriptions for each script file that lacks documentation.
- **Index Update**: Updates an index markdown file with links to all documented scripts.
- **Orphan Check**: Identifies and alerts the user about documentation files with no corresponding script files.

### Usage

This script should be run from a terminal and can be integrated into keybindings or automated workflows in your Arch Linux environment with qtile WM. Basic command to run the script:

```bash
python /home/matias/.scripts/llama-all-scripts-describer.py [path/to/CSV]
```

If no path is provided, it defaults to `$SCRIPTS/data/symlink_data.csv`.

Example invocation:
```bash
python /home/matias/.scripts/llama-all-scripts-describer.py
```

Simply follow the on-screen prompts for actions like running the symlink update.

---

> [!WARNING]
> While this script provides a comprehensive solution for documentation generation, it heavily relies on the existence of the `ollama` library, and assumes the `Client` class works with the Llama 3.1 model in a specific manner. Ensure that all dependencies are installed correctly. Additionally, error-handling could be improved, especially in subprocess operations and when interacting with file systems, to better address and recover from potential failures.