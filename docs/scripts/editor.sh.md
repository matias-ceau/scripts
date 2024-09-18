# File Editor with fzf

---

**editor.sh**: A script to quickly edit files using fzf for file selection.

---

### Dependencies

- `fzf`: A command-line fuzzy finder for selecting files interactively.
- `bat`: A cat clone with syntax highlighting and Git integration.
- `nvim`: Neovim, a modern text editor that the script uses for editing files.
- `fd`: A simple, fast and user-friendly alternative to 'find'.

### Description

This script provides a convenient way to edit files directly from the terminal by utilizing `fzf` to filter the available files based on different contexts. The user has the ability to specify file paths and edit them with `nvim`, while efficiently managing which files are visible for editing by excluding many non-editable formats like images, audio files, and more.

The script supports multiple modes through command-line arguments, allowing users to specify where to search for files:

- **SCRIPTS**: Limited to the user's `$SCRIPTS` directory.
- **CWD**: Only finds files in the current working directory.
- **CONFIG**: Specifically targets a config file managed by chezmoi.
- **DIRECTORY**: A custom directory specified by the user.

The script uses the `fd` command to generate a list of files while excluding specified patterns using a long list of `-E` flags.

### Usage

To use the script, just run the command in your terminal, followed by any options you want to use:

```bash
./editor.sh                  # Use default search paths
./editor.sh -s               # Search in the $SCRIPTS directory
./editor.sh -c               # Search only in the current directory
./editor.sh -C               # Edit a config file
./editor.sh -d /path/to/dir  # Search in a specific directory
./editor.sh -S               # Open files with sudo
```

Use `Ctrl-H` to include hidden files in the search and `Ctrl-S` to exclude them if visible. 

---

> [!TIP]  
> The script could benefit from more detailed error handling when commands like `nvim` or `sudo` fail. Also, consider adding a configuration file or environment variables to set default options persistently. Additionally, you might want to modularize the options into functions to improve readability and maintenance.