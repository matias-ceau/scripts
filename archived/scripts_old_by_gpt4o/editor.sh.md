# editor.sh

# Script Documentation

## Overview

This script allows you to edit any file in the current folder or subfolders recursively using `nvim`. It leverages `fd` and `fzf` for file searching and selection, respectively. You can choose to search only the current directory, edit files with sudo permissions, or edit a specific configuration file.

## Usage

```bash
./script.sh [OPTIONS]
```

### Options

- `-S, --sudo` : Edit files with sudo permissions.
- `-c, --cwd` : Search only in the current directory.
- `-C, --config` : Edit configuration files.
- `-h, --help` : Show the usage message and exit.

## Description

### Main Functionality

Upon running the script, it uses `fd` to search for files according to the specified options and leverage `fzf` for an interactive selection. When a file is selected, it is opened in `nvim`. If the `--sudo` option is set, the file is opened with sudo permissions.

### File Search Exclusions

The script excludes certain file types and directories from the search to improve performance and relevance:
- Excludes hidden files, large files (more than 2GB), and various common file types (e.g., images, media, archives, databases).
- Excludes specific directories like `.git`, `node_modules`, and specific system directories depending on the selected mode.

### Interactive Selection with `fzf`

- **CTRL-H**: Shows hidden files.
- **CTRL-S**: Hides hidden files.
- Uses `bat` for file preview with line numbers and syntax highlighting.

### Modes of Operation

- **Default**: Searches recursively in the current directory and certain important directories.
- **Sudo Mode** (`-S`/`--sudo`): Searches in system directories requiring root permissions.
- **Current Directory Mode** (`-c`/`--cwd`): Searches only in the current directory.
- **Config Mode** (`-C`/`--config`): Searches for configuration files.

## Example Commands

1. **Edit files with sudo permissions:**
    ```bash
    ./script.sh --sudo
    ```
2. **Find files only in the current directory:**
    ```bash
    ./script.sh --cwd
    ```
3. **Edit a configuration file:**
    ```bash
    ./script.sh --config
    ```
4. **Show help:**
    ```bash
    ./script.sh --help
    ```

## Code Breakdown

The script starts by defining the `usage` function, which is used to display usage information. Then, it processes input options with a `while` loop and `case` statements.

### `get_fd_cmd` Function

This function assembles the `fd` command based on the options specified:

1. **Initialization**: The command starts with `fd '' -tf` to search for text files.
2. **Exclusions**: Various file extensions and directories are excluded to improve search relevance.
3. **Mode Checks**: Depending on the specified options, different search parameters are added for sudo, current directory, or config file searches.

### Main Script Execution

1. **Initial `fd` Command**: Generates the base `fd` command without hidden files.
2. **File Selection**: Uses the generated `fd` command with `fzf` for file selection.
3. **File Opening**: Opens the selected file in `nvim`, with sudo permissions if required.

## Contributing

Feel free to open an issue or submit a pull request if you'd like to contribute to this script. Any improvements or suggestions are welcome.

## License

This project is licensed under the MIT License.

---

**Note**: Make sure you have `nvim`, `fd`, `fzf`, and `bat` installed on your system for this script to function properly.