# rgfzf: Ripgrep and Fzf Integration Script

---

**rgfzf.sh**: A script combining ripgrep and fzf to search files and open results in Vim.

---

### Dependencies

- `ripgrep`: A line-oriented search tool that recursively searches the current directory for a regex pattern.
- `fzf`: A general-purpose command-line fuzzy finder.
- `bat`: A cat clone with syntax highlighting and Git integration.
- `nvim`: Neovim, serves as the text editor for opening the selected file.

### Description

The `rgfzf.sh` script is a nifty utility for users who often find themselves needing to search and edit files from the terminal. It leverages the power of `ripgrep` to perform a fast recursive search across files, `fzf` for interactively selecting from the search results, and `nvim` to open files directly at the searched line. `bat` is used for syntax-highlighted previews of the results.

Here's a breakdown of its operation:
- `ripgrep` (`rg`) is used to search files with provided search terms. It is configured to display colored output, line numbers, and to ignore headings.
- `fzf` presents these results interactively, allowing users to narrow down using fuzzy searching. Its configuration supports ANSI colors and custom highlight settings, with a preview that shows syntax-highlighted content from `bat`.
- Upon selection and pressing enter, `fzf` invokes `nvim`, opening the chosen file at the specified line number.

### Usage

This script can be easily run from the terminal:

```bash
~/.scripts/bin/rgfzf.sh [search-term]
```

- Replace `[search-term]` with the text you're searching for.
- Optionally, you can integrate it with your qtile keybindings for efficient access.

**Example:**

```bash
~/.scripts/bin/rgfzf.sh "function main"
```

This command would search for occurrences of "function main" in your project files, allow you to select a match using `fzf`, and then open the file in `nvim` at the location of the match.

---

> [!TIP] 
> While the script is quite effective, consider adding argument validation or help flags to guide new users. Additionally, integrating editor-agnostic configurations might broaden usability, accommodating those who might use editors other than `nvim`.