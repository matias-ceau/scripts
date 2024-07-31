# File Editor Script (editor.sh)

---

Edit any file in current folder or subfolders (recursively)

---

### Table of contents

- [Dependencies](#dependencies)
- [Description](#description)
    - [Overview](#overview)
    - [Usage](#usage)
    - [Examples](#examples)
- [Notes](#notes)

---

<a name="dependencies" />

### Dependencies

- `nvim` (Neovim text editor)
- `fzf` (Fuzzy Finder)
- `bat` (cat clone with syntax highlighting)
- `fd` (simple, fast and user-friendly alternative to `find`)
- `chezmoi` (optional, for config management)

<a name="description" />

### Description

<a name="overview" />

#### Overview

This script allows users to interactively open files located in the current directory or its subdirectories using the `fzf` fuzzy finding interface. It provides additional options such as editing with `sudo`, restricting the search to the current directory, or selecting a specific config file. The script relies on `fd` for efficient file searching, excluding common file types that are typically irrelevant for editing (e.g., images, archives).

---

<a name="usage" />

#### Usage

Run the script from the command line. It accepts several options:

```
./editor.sh [-S|--sudo] [-c|--cwd] [-C|--config] [-h|--help]
```

- `-S, --sudo`: Edit files with sudo permissions.
- `-c, --cwd`: Restrict search to the current directory only.
- `-C, --config`: Edit a specific config file.
- `-h, --help`: Display the help message.

You can bind this script to a key in your window manager (Qtile) for quick access.

<a name="examples" />

#### Examples

1. **Open a file normally**:
   ```
   ./editor.sh
   ```

2. **Open a file with sudo permissions**:
   ```
   ./editor.sh --sudo
   ```

3. **Open a file only within the current directory**:
   ```
   ./editor.sh --cwd
   ```

4. **Open a specific config file**:
   ```
   ./editor.sh --config
   ```

---

<a name="notes" />

### Notes

- Ensure that all dependencies are installed and available in your PATH.
- Use the `CTRL-H` and `CTRL-S` keybindings within `fzf` to toggle visibility of hidden files.

> **Critique:** 
> - The script could benefit from error handling in case no files match the search criteria when `fd` is executed. Implementing checks for exit statuses would enhance its robustness.
> - The multiple boolean flags (`SUDO_MODE`, `CWD_MODE`, and `CFG_MODE`) could be encapsulated within a more structured configuration method or a dictionary to simplify the code readability.
