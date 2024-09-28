# Quick File Editor with FZF

---

**editor.sh**: Script to rapidly edit files using `fzf` for search and `nvim` for editing, suitable for various directory contexts.

---

### Dependencies

- `fzf`: A command-line fuzzy finder used to filter and select files.
- `bat`: A clone of `cat` with syntax highlighting and Git integration, used for previewing files.
- `fd`: A simple, fast and user-friendly alternative to `find`.
- `chezmoi`: A personal dotfile manager (used when editing config files).
- `nvim`: Neovim, a hyperextensible Vim-based text editor.
- `sudo`: Required if editing files with root permissions.

### Description

This script is designed to streamline file editing on an Arch Linux system with **qtile** as the window manager. It uses `fzf` to allow users to search for files within specified directories and various contexts. The selections made by `fzf` can then be edited with `nvim`.  
- The functionality is ranger-like, making it ideal for users who work extensively with command-line interfaces and need quick access to their files without manual searching.

The script excludes certain directories and file types to optimize search results, aiming for editable files only. It supports several modes via flags, such as editing files within a specific directory, script directory, or configuration files, among others.

### Usage

The script can be executed directly in a terminal, and it supports various command-line arguments:

```bash
editor.sh [-s|--scripts] [-c|--cwd] [-C|--config]
          [-d|--dir <dir>] [-S|--sudo] [-h|--help]
```

**Options:**
- `-s, --scripts`: Search in the user `SCRIPTS` directory.
- `-c, --cwd`: Search within the current working directory.
- `-C, --config`: Edit unmanaged config files.
- `-d, --dir <dir>`: Search within a specified directory.
- `-S, --sudo`: Open files with `sudo` permissions.
- `-h, --help`: Display the usage message.

**Key Bindings in FZF:**
- `<C-H>`: Toggle hidden files.
- `<C-S>`: Disable hidden files.

Example of executing the script to search and edit files in scripts directory:

```bash
editor.sh --scripts
```

---

> [!TIP]
> - Consider expanding the comment documentation within your script for better readability.
> - Current script assumes the existence and correctness of environment variables like `$SCRIPTS` and `$LOCALDATA`. Ensure they are always set.
> - Adding debugging or logging can be a valuable enhancement for complex scripts like this, to track operations and error handling.