# Pacman Fuzzy Search 

---

**pacman-fuzzy-search.sh**: A script for fuzzy searching Arch Linux packages with previews.

---

### Dependencies

- `bash`: The shell used to execute the script.
- `paru`: A package manager helper for `pacman` that supports AUR.
- `rg` (ripgrep): A fast search tool for assisting in regex-based searches.
- `sed`: A stream editor for filtering and transforming text.
- `bat`: A cat clone with syntax highlighting and Git integration.
- `fzf`: A command-line fuzzy finder.

### Description

This script leverages the `fzf` fuzzy finder to allow users to quickly search for installed or available packages in Arch Linux using the `paru` package manager. It provides a preview of the package details dynamically as the user types. 

Key functions of the script include:

- **preview_cmd**: This function prepares and formats the preview output for a selected package using `paru` combined with multiple `sed` transformations for clean presentation. It adapts the command based on whether the package is installed or not.
- The script uses a pipeline to fetch the list of packages and formats the output to be compatible with `fzf`, which allows for real-time searching and selection.

Here’s how the preview generation works:
- It checks if the package is installed and alters the command accordingly.
- It enriches the displayed information using multiple substitutions via `sed` to enhance readability and format.

### Usage

To utilize the script, simply run it from the terminal. You can pass an optional query string that `fzf` will use for filtering:

```bash
bash /home/matias/.scripts/pacman-fuzzy-search.sh [search_query]
```

- `search_query`: An optional argument that is preloaded into the `fzf` search.

Without any arguments, you can access the full list of packages:

```bash
bash /home/matias/.scripts/pacman-fuzzy-search.sh
```

### Example

Run the script to search for packages containing "firefox":

```bash
bash /home/matias/.scripts/pacman-fuzzy-search.sh firefox
```

---

> [!TIP]  
> The script could benefit from error handling, ensuring a smoother user experience, especially if dependencies are missing or commands fail. Another enhancement could be to allow keyboard shortcuts for ease of use inside `fzf` for faster operations.