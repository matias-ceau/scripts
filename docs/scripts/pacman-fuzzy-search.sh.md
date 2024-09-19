# Pacman Fuzzy Search

---

**pacman-fuzzy-search.sh**: A script to fuzzy search installed and available packages using `fzf`.

---

### Dependencies

- `bash`: A widely-used shell that provides command-line interface for command execution.
- `paru`: An AUR helper for managing packages in Arch Linux.
- `fzf`: A command-line fuzzy finder that enables efficient searching through outputs.
- `bat`: A command-line tool to view files with syntax highlighting and formatting.

### Description

This script provides an interactive way to search for installed and available packages on an Arch Linux system using `paru` and `fzf`. When executed, it utilizes the `fzf` interface to display a list of packages while allowing you to filter results using fuzzy search, an intuitive method for querying data.

1. **Preview Function**: The `preview_cmd` function formats and beautifies output before displaying it. It checks whether the package is installed or available, modifies the command appropriately (`-Si` for available packages, `-Qi` for installed ones), and processes the output using several `sed` expressions to ensure readability and clarity.

2. **Output Customization**: The script also pipes output into `bat` for enhanced visualization, highlighting, and maintaining terminal compatibility.

3. **Fuzzy Search Interface**: The command utilizes `fzf` to create an interactive interface, offering multi-selection capabilities and a preview pane to view detailed package information dynamically.

### Usage

To run the script, simply execute it from the terminal:

```bash
bash /home/matias/.scripts/pacman-fuzzy-search.sh
```

You can further refine your search by typing part of the package name inside the fuzzy search prompt.

Example:

```bash
bash /home/matias/.scripts/pacman-fuzzy-search.sh | fzf
```

---

> [!TIP] 
> While the script is functional, you may want to consider:
> - Adding error handling to check if dependencies (`paru`, `fzf`, and `bat`) are installed.
> - Introducing command-line arguments to customize the behavior (e.g., searching only installed packages).
> - Providing a setup or installation guide for users unfamiliar with Arch Linux package management.