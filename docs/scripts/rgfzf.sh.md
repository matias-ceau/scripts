# `rgfzf.sh` — Fuzzy Ripgrep/Vim file opener

---

**rgfzf.sh**: Search for text using ripgrep + fuzzy finder, preview with bat, open in neovim.

---

### Dependencies

- `rg`  
    Ripgrep for fast file and text searching.
- `fzf`  
    Fuzzy finder, provides interactive UI for selecting results.
- `bat`  
    For previewing file content with syntax highlighting.
- `nvim`  
    Opens the selected file and line (swap for another editor if needed).
- `bash`  
    Required for the script and `fzf` interactions.

### Description

This script allows you to:

1. Search files for some text using `ripgrep` (`rg`).
2. Pipe the results to `fzf` for interactive, incremental narrowing.
3. Use `bat` to preview search matches in context and with syntax highlighting.
4. Open the selected file at the given line with `nvim` (great for code navigation).

The command pipeline works like this:
- Results from `rg` are fed to `fzf` (`fzf --ansi` for color compat).
- `fzf` parses results using `:` as the delimiter (`filename:line:text`).
- On selection, a floating preview window pops up (`bat`, colored), highlighting the relevant line.
- Pressing `enter` launches `nvim` at the selected file and line.

#### Example run:
Suppose you search for a string:
```
rgfzf.sh 'def main'
```
You’ll get a live-updating list of ripgrep hits, fuzzy filter it, preview with bat, and `Enter` to jump to code in neovim.

### Usage

```sh
# Search for a string in the current directory and subdirectories
rgfzf.sh <search_terms>

# Example: Find all "TODO" comments
rgfzf.sh TODO

# For interactivity via keybinding (Qtile / sxhkd)
# In your config: bind a key to run this script (ensure terminal popup)
```

- You can run `rgfzf.sh <pattern>` from any directory.
- If assigned to a keybinding, it works best if your terminal will pop up (such as with a scratchpad in Qtile).

---

> [!TIP]
> - `nvim` is hardcoded; consider passing your preferred editor as an argument or environment variable.
> - The preview window is set at 60% height; this could be adjusted for smaller/larger terminals.
> - If `bat` or `fzf` are missing, the script will fail silently. Defensive checks could improve the UX.
> - The script doesn’t work in directories with no ripgrep hits; some user feedback here could help.
> - If you use `kitty`, `alacritty` or similar GPU terminals, preview/ansi-rendering will look best.