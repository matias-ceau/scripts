# File Editor Script for Easy Access

---

**editor.sh**: Edit files in the current directory or subdirectories with additional options.

---

### Dependencies

- `nvim`: A modern text editor that allows for powerful editing features.
- `fzf`: A command-line fuzzy finder for quick file selection.
- `bat`: A command-line tool to view files with syntax highlighting and paging.
- `fd`: A simple, fast and user-friendly alternative to `find`.

### Description

This script, `editor.sh`, provides a convenient interface to edit files within the current directory or its subdirectories using the `nvim` editor. The script allows you to invoke additional options for refining the search and operation modes, such as editing with sudo permissions or specifying a narrower search scope.

- The script uses the `fd` command to search for files, excluding certain patterns (like hidden files and common binaries).
- Users can select files through a fuzzy search powered by `fzf`, with visual previews provided by `bat`.
- The script supports various flags:
  - `-S` or `--sudo`: Edit files with elevated permissions.
  - `-c` or `--cwd`: Search only in the current directory.
  - `-C` or `--config`: Edit configuration files.

### Usage

To use the `editor.sh` script, simply run it in your terminal. Here are a few examples:

- To edit any file in the current directory or subdirectories:
  
  ```bash
  ./editor.sh
  ```

- To edit a file with sudo permissions:

  ```bash
  ./editor.sh --sudo
  ```

- To search only within the current directory:

  ```bash
  ./editor.sh --cwd
  ```

- To edit a specific config file:

  ```bash
  ./editor.sh --config
  ```

You can access help information using:

```bash
./editor.sh --help
```

---

> [!TIP]
> Consider improving the suggestions or autocorrect functionality in case the user inputs an invalid option. Additionally, you might want to streamline the `fd` command; excessive ignored file types can make it less efficient.