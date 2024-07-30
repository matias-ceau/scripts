# Editor Script (editor.sh)

---

A script to edit any file recursively in the current folder or subfolders.

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

- `nvim` (Neovim)
- `fzf` (Fuzzy Finder)
- `fd` (Simple, fast and user-friendly alternative to find)
- `bat` (cat command with syntax highlighting)

<a name="description" />

### Description

<a name="overview" />

#### Overview

This script provides a convenient interface to edit files within the current directory or its subdirectories. Using `fzf` for fuzzy searching and `nvim` for text editing, it enables users to find files interactively. The script accepts various flags to modify its behavior, such as viewing hidden files, working in specific directories, or editing with `sudo` permissions. Additionally, it utilizes `fd` to filter out undesired file types consistently, promoting a cleaner search experience.

---

<a name="usage" />

#### Usage

To utilize the script, make sure it is executable by running `chmod +x /home/matias/.scripts/editor.sh`. You can then invoke it from the terminal with various options:

```bash
./editor.sh [-S|--sudo] [-c|--cwd] [-C|--config] [-h|--help]
```

- `-S, --sudo`: Edit files with sudo permissions.
- `-c, --cwd`: Limit search to the current directory only.
- `-C, --config`: Edit configuration files.
- `-h, --help`: Display a help message with usage instructions.

The script will use `fd` to find files and `fzf` to assist in interactive selection.

<a name="examples" />

#### Examples

1. To search and edit a file in the current directory and its subdirectories:
   ```bash
   ./editor.sh
   ```

2. To edit a file with elevated permissions:
   ```bash
   ./editor.sh --sudo
   ```

3. To restrict file search to the current directory:
   ```bash
   ./editor.sh --cwd
   ```

4. To edit a configuration file:
   ```bash
   ./editor.sh --config
   ```

5. For help on using the script:
   ```bash
   ./editor.sh --help
   ```

---

<a name="notes" />

### Notes

This script employs a variety of file exclusion patterns to prevent the selection of non-text file types like images, binaries, and others. The list of excluded file extensions is substantial, ensuring users can focus on relevant files.

> **Critique:** 
> The script is generally well-structured, but there are a few potential improvements:
> - The `get_fd_cmd` function could accept parameters for file exclusions rather than hardcoding them. This would increase flexibility.
> - The `fd` command could be further optimized to handle a broader range of scenarios, like incorporating user-defined paths or conditions.
> - Consider adding error handling after invoking `nvim` to manage scenarios such as a failure in opening the file due to permissions or file existence.