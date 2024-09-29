# Try the Bat Suit

---

**try_the_bat_suit.sh**: A script that utilizes `bat` and `fzf` for enhanced file previewing.

---

### Dependencies

- `bash`: The shell interpreter in which the script runs.
- `fd`: A simple, fast, and user-friendly alternative to `find`, used for file discovery.
- `fzf`: A command-line fuzzy finder that allows for interactive file selection.
- `bat`: A modern alternative to `cat`, which provides syntax highlighting and other features for file viewing.
- `rg` (ripgrep): A command-line search tool that recursively searches your current directory for a regex pattern.

### Description

This script serves as an advanced file previewing tool, combining the capabilities of `bat` and `fzf`. The purpose of this script is to allow users to select a file and preview its content with syntax highlighting and language specifications.

When executed, the script first checks if a file path has been provided as an argument. If a valid file is supplied, it will be used for the preview. If no filename is provided, it uses `fd` to list files in the current directory and `fzf` to select from them interactively.

The `preview_cmd` function extracts the language that should be used for syntax highlighting from the selected file, leveraging commands like `rg` and `cut`. It then invokes `bat` to preview the file with the appropriate language settings.

### Usage

To run the script, execute it from your terminal. You can either provide a specific file or select one interactively:

```bash
# Run with an explicit file path
./try_the_bat_suit.sh /path/to/your/file.txt

# Run without an argument to choose a file interactively
./try_the_bat_suit.sh
```

Upon execution, if no file path is provided, a list of files will be displayed via `fzf`. Selecting a file will trigger the preview function, allowing you to view the contents of the file with syntax highlighting.

---

> [!TIP]  
> This script could benefit from input validation for the file path provided. Additionally, consider adding error handling in case `bat` or `fzf` fail during execution. Enhancing user feedback when selecting files may also improve the overall experience.