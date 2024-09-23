# Python Module Navigation Script

---

**pyman.sh**: A script for navigating Python modules and viewing documentation interactively.

---

### Dependencies

- `python`: Required to fetch version information and built-in functions.
- `bat`: A cat alternative that provides syntax highlighting and pager support.
- `fd`: A simple, fast and user-friendly alternative to `find`.
- `rg` (ripgrep): A line-oriented search tool that recursively searches your current directory.
- `fzf`: A command-line fuzzy finder to enhance the interactive experience.

### Description

The `pyman.sh` script is designed to facilitate an interactive exploration of Python packages and modules within the Python environment on your system. It provides quick access to documentation and file structures using `fzf` for fuzzy searching, while leveraging several utilities for enhanced output formatting.

Key functionalities of the script include:

- **Getting Topics and Keywords**: Functions `get_topics` and `get_keywords` fetch the topics and keywords available in the Python modules and format them for easier readability using `bat`.
  
- **Retrieving Site Packages**: `get_site_packages` lists Python site packages in a structured format, emphasizing file types with color-coded outputs.
  
- **Submodules Listing**: `get_submodules` navigates within specified packages to find and display submodules.

- **Built-ins**: The `get_builtins` function retrieves Python built-in functions, formatted appropriately.

- **Dynamic Previewing**: `bat_preview` functions provide dynamic previews of module documentation when using `fzf` for selection.

- **Command Execution**: The `enter_cmd` function allows users to execute commands for exploring files or directories within the selected modules.

### Usage

To use the script, run the following command in your terminal:

```bash
bash /home/matias/.scripts/pyman.sh
```

This launches an interactive fuzzy finder interface that allows you to navigate through Python modules and documentation. You can use various key bindings such as:

- `Alt + B`: Show built-in functions.
- `Alt + K`: Show keywords.
- `Alt + T`: Show topics.
- `Enter`: Preview the selected item or open it in `ranger` or `bat`.

---

> [!TIP]
> The script relies heavily on external utilities like `fzf`, `bat`, and `fd`. Ensure these are properly installed and configured on your Arch Linux system. Additionally, the initial directory may not be set up correctly if `$SEARCH_PATH` is not matching your Python installation. It would be beneficial to add error handling to manage scenarios where the required directories or commands are not accessible.