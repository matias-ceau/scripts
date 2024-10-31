# Pacman Fuzzy Search Script

---

**pacman-fuzzy-search.sh**: A fuzzy search script for Arch Linux's pacman and AUR packages.

---

### Dependencies

- `bash`: The shell used to run the script.
- `paru`: An AUR helper that simplifies package management from the AUR.
- `fzf`: A command-line fuzzy finder that is utilized for the search interface.
- `ripgrep (rg)`: A fast search tool that is used for regex-based searching.
- `bat`: A `cat` clone with syntax highlighting and Git integration, used for previewing package information.

### Description

The `pacman-fuzzy-search.sh` script is designed to enhance the package searching experience for Arch Linux users, leveraging the power of fuzzy searching provided by `fzf`. Here's how it works:

1. **Initialization**: It creates a cache directory to store any necessary files and initializes environment variables.
2. **Utility Functions**:
   - `preview_cmd()`: Prepares and formats detailed package information for display. It uses `paru` to fetch package data and `bat` for enhanced formatting.
   - `paruSl()`: Lists installed packages with color highlighting.
   - `search_cmd()`: Constructs a search criteria based on user options and displays notifications about repositories and installations.
3. **Main Function**:
   - `fzf_cmd()`: This is the main command that invokes `fzf` with custom bindings and options for user interaction.

### Usage

You can execute the script directly from the terminal using:

```bash
bash /home/matias/.scripts/pacman-fuzzy-search.sh
```

The script executes a fuzzy search of the installed packages and AUR packages, allowing you to interactively select a package to perform actions such as installation. Here are some useful key bindings while using `fzf`:

- `enter`: Install the selected package.
- `ctrl-r`: Reload the search.
- `alt-m`: Change search mode (e.g. AUR or repo).
- `alt-o`: Sort the results by various criteria.
- `alt-c`: Change the search criteria.

You can adjust the search options on-the-fly by using the key bindings provided.

---

> [!TIP]
> The script is well-structured, but it could benefit from modularizing by separating the utility functions into a different file for better readability and maintenance. Additionally, more error handling could improve the user experience, especially when no packages are found or if there’s an issue with `paru`.