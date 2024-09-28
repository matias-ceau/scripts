# Ripgrep and FZF Integration Script

---

**rgfzf.sh**: Integrate `ripgrep` and `fzf` to search text and open files in `vim`

---

### Dependencies

- `ripgrep` (`rg`): A fast search tool for files.
- `fzf`: A command-line fuzzy finder.
- `bat`: A syntax highlighting tool for viewing files.
- `vim` or `neovim` (`nvim`): A highly configurable text editor built to work efficiently.

### Description

This script combines the powerful searching capabilities of `ripgrep` (`rg`) with the interactive file selection provided by `fzf`. It allows you to search for text within your files and then select from the search results to open specific lines in `vim` or `neovim`.

The script performs the following steps:

1. **Search**: Uses `ripgrep` to search for text within files. You can provide a search pattern which is passed to `rg`.
2. **Filter**: The search results are piped into `fzf`, allowing you to interactively narrow down the list. `fzf` is configured to display results with color and underlined highlights for better visibility.
3. **Preview**: It uses `bat` to provide a preview of the file content, with the search term highlighted.
4. **Open**: Once you select a result in `fzf`, pressing `Enter` opens the file in `vim` at the specific line containing the match.

### Usage

Make sure you have the required dependencies installed:

```bash
sudo pacman -S ripgrep fzf bat neovim
```

To run the script, use:

```bash
/home/matias/.scripts/rgfzf.sh <search_term>
```

- `<search_term>` is the text you want to search for within your files.
- If you don't provide a search term, it will default to search without any restrictions, effectively listing all files in the directory hierarchy interactively.
  
You can bind this script to a key combination within `qtile` for quick access.

Example to search "function":

```bash
/home/matias/.scripts/rgfzf.sh function
```

---

> [!NOTE]
> While this script is efficient, it depends heavily on the installed tools (`fzf`, `bat`, and `neovim`). Ensure all dependencies are correctly installed and configured. You might also consider making the command-line tools configurable via variables in the script for more flexibility, or adding error handling for cases where the search term yields no results.