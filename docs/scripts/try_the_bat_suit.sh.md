# Try the Bat Suit

---

**try_the_bat_suit.sh**: A script to preview files using `bat` and `fzf` with language detection.

---

### Dependencies

- `bash`: A Unix shell and command language.
- `bat`: A cat clone with syntax highlighting and Git integration.
- `fd`: A simple, fast and user-friendly alternative to `find`.
- `fzf`: A command-line fuzzy finder.
- `ripgrep` (`rg`): A line-oriented search tool that recursively searches your current directory for a regex pattern.

### Description

This script enables users to preview files within a terminal using `bat`, a command line syntax highlighter, in conjunction with `fzf`, a fuzzy file finder. When executed, the script checks if a file path is provided as an argument. If not, it prompts the user to select a file from the current directory using `fd` and `fzf`.

The selected file is then set as the variable `FILE`, and a language detection function (`preview_cmd`) is defined. This function extracts the language type from `bat` command output using `rg` and outputs a preview of the file with syntax highlighting. 

The script leverages the functionality of `fzf` to integrate file selection with real-time previews, enhancing the user's experience when working with multiple files. 

### Usage

To use the script, simply make it executable and run it from the terminal:

```bash
chmod +x /home/matias/.scripts/try_the_bat_suit.sh
/home/matias/.scripts/try_the_bat_suit.sh [optional_file_path]
```

- **Without argument**: The script will invoke `fd` to list files and allow you to search through them using `fzf`.
- **With argument**: Directly pass a file path to preview it using `bat`.

For example:

```bash
/home/matias/.scripts/try_the_bat_suit.sh myfile.txt
```

This will open `myfile.txt` for preview if it exists; otherwise, it will allow interactive file selection.

---

> [!TIP] 
> Consider adding error handling for cases where `bat` or `fzf` is not installed, as this will enhance user experience by preventing the script from failing silently. Also, consider expanding language detection capabilities beyond what is currently done since it relies on the output format of the `bat --list-languages` command, which may change in future versions of `bat`.