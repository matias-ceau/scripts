# Help Pastel Script

---

**help-pastel.sh**: A script to display Pastel subcommands with live help.

---

### Dependencies

- `pastel`: A command-line tool for managing colors.
- `rg`: Ripgrep, a line-oriented search tool that recursively searches your current directory for a regex pattern.
- `cut`: A command-line utility that removes sections from each line of files.
- `bat`: A `cat` clone with syntax highlighting and Git integration.
- `fzf`: A command-line fuzzy finder used for searching and selecting.

### Description

The `help-pastel.sh` script is designed to assist users in finding and understanding the various subcommands available in the `pastel` command-line tool. This script accomplishes the following:

1. **Identify Subcommands**: It locates the line number in the help output where the subcommands begin using `rg` to search for the term 'SUBCOMMANDS'.
2. **Generate Help Output**: It uses `pastel -h` and pipes the output through `bat` to provide a visually appealing format. The script removes lines that contain the word 'help' and appends the contents of `README.md` for reference.
3. **Interactive Selection**: It leverages `fzf` to allow the user to interactively search through the list of subcommands. Users can preview the help information for each subcommand while selecting, enhancing the usability.

The following command illustrates the main logic flow of the script:

```bash
pastel -h | bat --line-range ${line_number}: | cat - <(echo "README.md") | rg -v ' *help' | bat -fpplhelp | fzf ...
```

### Usage

To run the script, execute the following command from your terminal:

```bash
bash /home/matias/.scripts/help-pastel.sh
```

Alternatively, you can bind this script to a key in your window manager (like Qtile) for quick access.

---

> [!TIP]  
> The script is generally well-structured; however, there are a few suggestions for improvement: 
> - Consider adding comments in the code to improve readability.
> - Error handling could be implemented to manage cases where the `pastel` command or its dependencies are not installed.
> - You might want to use more descriptive variable names instead of `line_number` for clarity.