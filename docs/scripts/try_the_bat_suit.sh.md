# Try the Bat Suit

---

**try_the_bat_suit.sh**: A script to preview files using `bat` with language highlighting.

---

### Dependencies

- `bash`: The script is written in bash and requires this shell to run.
- `fd`: A simple, fast and user-friendly alternative to `find`. It is used for file searching.
- `fzf`: A command-line fuzzy finder, utilized for selecting files interactively.
- `bat`: A `cat` clone with syntax highlighting and Git integration, fundamental for previewing file contents.
- `ripgrep (rg)`: A regex-based search tool that helps with filtering file content.

### Description

The purpose of this script is to facilitate the preview of files with syntax highlighting using the `bat` command. It allows the user to either specify a file directly as an argument or to select one interactively from the current directory.

1. **File Selection**:
   - If a file path is provided as an argument (`$1`), the script assigns that file to the `FILES` variable.
   - If no argument is given, it invokes `fd` to list files in the current directory and uses `fzf` for a user-friendly selection interface.

2. **Preview Function**:
   - The `preview_cmd` function constructs the language flag for `bat` by extracting the file type and its primary language from the output. The function runs `bat` with the necessary options to display the file preview in the terminal interface.

3. **Language Listing**:
   - The script utilizes `bat --list-languages` to fetch supported languages, formatting the output for better readability and integration with `fzf` to allow the user to preview files easily.

### Usage

To use the script, simply run it in your terminal. You can opt to supply a file name as an argument or make your selection:

To preview a specific file:
```bash
/home/matias/.scripts/try_the_bat_suit.sh /path/to/your/file.txt
```

To select a file interactively:
```bash
/home/matias/.scripts/try_the_bat_suit.sh
```

Once you run the script, you will see a list of file types. Selecting one will invoke `bat` to show the file preview highlighted according to its language.

---

> [!TIP]
> This script currently has an incomplete conditional structure in the file selection block (after `elif`). It would cause a syntax error when this path is taken. Additionally, consider adding error handling to manage cases where no files are found by `fd` or where `bat` fails to execute. This will improve user experience by providing informative messages.