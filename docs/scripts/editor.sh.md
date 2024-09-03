# Edit Files Easily with FZF

---

**editor.sh**: Edit files from the shell using fzf with customizable search options.

---

### Dependencies

- `fzf`: A command-line fuzzy finder that enables quick file selection.
- `bat`: A modern alternative to `cat` that provides syntax highlighting and line numbering.
- `nvim`: A text editor that offers advanced editing features.

### Description

The `editor.sh` script facilitates quick file editing from the terminal by leveraging `fzf` for fuzzy search. Users can specify various search paths and filter criteria through command-line options. The script effectively excludes non-editable files (like images and archives) and allows the user to specify whether they want to edit with regular or superuser permissions.

The usage of `fd`, a simple, fast, and user-friendly alternative to `find`, allows rapid file discovery across specified directories, while also supporting hidden files. This script is particularly useful for users who frequently edit configuration files or scripts, as it streamlines the workflow to avoid tedious file navigation.

### Usage

Run the script directly from the terminal, optionally including flags to specify search parameters:

```bash
./editor.sh [-s|--scripts] [-c|--cwd] [-C|--config] [-d|--dir <dir>] [-S|--sudo] [-h|--help]
```

Available options include:

- `-s`, `--scripts`: Search in the user's `$SCRIPTS` directory.
- `-c`, `--cwd`: Limit search to the current directory.
- `-C`, `--config`: Look for config files in an unmanaged state (specifically for `chezmoi`).
- `-d`, `--dir <dir>`: Search for files in a specified directory.
- `-S`, `--sudo`: Edit files with superuser permissions.
- `-h`, `--help`: Display help information.

_For example, to edit a file in the current directory, you would run:_

```bash
./editor.sh --cwd
```

---

> [!NOTE] 
> The script could benefit from additional error handling, particularly when fetching files or executing commands as `sudo`. Furthermore, enhancing the flexibility of the excluded files list to allow user customization through command-line arguments could significantly improve usability.