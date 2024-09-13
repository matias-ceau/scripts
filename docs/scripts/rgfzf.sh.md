# Search and Open Files with Ripgrep and FZF

---

**rgfzf.sh**: Combines Ripgrep and FZF to search files and open in Vim interactively.

---

### Dependencies

- `ripgrep` (`rg`): A powerful search tool that recursively searches your current directory for a regex pattern.
- `fzf`: A command-line fuzzy finder that allows you to search through a list interactively.
- `bat`: A cat clone with syntax highlighting and Git integration, used for previews during searches.
- `neovim` (`nvim`): An extensible text editor, used to open files from the search.

### Description

This script provides an efficient way to search for text within files and open the selected file directly in Neovim. It utilizes Ripgrep to perform a fast search across directories, outputs results in a color-friendly format, and integrates with FZF for an interactive searching experience.

Here's how it works:

1. **Search**: The script begins with `rg` to search for the specified pattern in files.
2. **Filter**: The output is piped to `fzf`, which allows users to narrow down results using fuzzy matching.
3. **Preview**: During selection in FZF, `bat` shows a live preview of the file's content, enhancing usability.
4. **Open**: Once a file and line number are selected, pressing `Enter` opens the file in Neovim at the specific line.

### Usage

To use the script, simply execute it in your terminal followed by the search term. For example:

```bash
./rgfzf.sh "search term"
```

If you run it without any arguments, it will prompt to input a search term interactively.

You can also bind this script to a key combination in your window manager (`qtile`), allowing for quick access without typing the command each time.

---

> [!TIP] 
> This script is quite efficient, but there are opportunities for improvement. For instance, you might consider adding error handling to check if the dependencies are installed before proceeding with the search. Moreover, providing more customization options for FZF's preview window dimensions could enhance functionality based on personal preferences. It’s also a good practice to escape input arguments to avoid issues with special characters in search terms.