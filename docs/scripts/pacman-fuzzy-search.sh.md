# Pacman Fuzzy Search Script

---

**pacman-fuzzy-search.sh**: A fuzzy search script for Arch Linux's package manager with enhanced preview.

---

### Dependencies

- `bash`: The shell interpreter used to execute the script.
- `paru`: A modern AUR helper, required for package searching.
- `fzf`: A command-line fuzzy finder that allows for flexible searching.
- `ripgrep (rg)`: A fast command-line search tool for filtering results.
- `bat`: A cat clone with syntax highlighting and Git integration.

### Description

The `pacman-fuzzy-search.sh` script provides a user-friendly interface to search for installed and AUR packages using fuzzy searching capabilities. It enhances the search experience by integrating a preview feature and allowing for intuitive filtering between installed packages and available AUR packages.

The script defines several functions:
- **`preview_cmd`**: This function generates a preview of package details from the output of `paru`. It applies various `sed` transformations to format the information for readability and highlights the installed status using ANSI escape codes.
  
- **`paruSl`**: A simple function to list all installed packages with colored output.

- **`search_cmd`**: It constructs search filters based on user-defined conditions (AUR or installed packages). The user can modify the search criteria dynamically by pressing designated keys within the fuzzy finder.

- **`blabel`**: Creates a border label to indicate the current search mode. It handles switching labels between AUR and installed package searches.

- **`fzf_cmd`**: This function utilizes `fzf` to produce an interactive fuzzy search interface, complete with custom key bindings for easier navigation.

### Usage

To use the script, execute it from a terminal:

```bash
bash /home/matias/.scripts/pacman-fuzzy-search.sh
```

Within the fuzzy search interface:
- Use the arrow keys to navigate through the list of packages.
- Press `Enter` to install the selected package.
- Use `Alt + a` to switch to searching AUR packages, `Alt + i` for installed packages.
- The search results will dynamically update based on the selected mode.

---

> [!TIP]  
> Consider adding error handling in your script for cases where the `paru` command fails or when no packages meet the search criteria. Manual testing for edge cases would also enhance the script's robustness and usability. Additionally, documenting each function further within the code will help future users (or yourself) understand its operations quickly.