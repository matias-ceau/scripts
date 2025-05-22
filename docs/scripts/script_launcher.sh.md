# Script Launcher Utility

---

**script_launcher.sh**: Fuzzy-find and launch scripts with enhanced previews and editing options

---

### Dependencies

- `fzf`: Interactive command-line fuzzy finder.
- `improved-fzfmenu.sh`: Custom wrapper for `fzf` (for enhanced appearance/functionality).
- `fd`: Efficient, user-friendly alternative to `find` for directory traversal.
- `bat`: Syntax-highlighting `cat` clone, used for previewing code/docs.
- `ripgrep` (`rg`): Fast grep alternative for pattern-matching file types.
- `pastel`: Tool for formatting colors in the terminal.
- `terminal_with_command.sh`: Launch scripts inside a new terminal (user-defined helper).
- `nvim`: Used for editing scripts.
- `nvim_in_new_terminal.sh`: Open nvim in a new terminal window (user-defined helper).
- Environment variables: Requires `$SCRIPTS` directory for locating scripts, and color variables (`$FLEXOKI_ORANGE`, etc.).

---

### Description

This launcher script provides a powerful and interactive way to discover, preview, and execute scripts from your predefined `$SCRIPTS` directory using `fzf`, with rich color coding and previews.

- **Script Listing**: Uses `fd` to find scripts, color-coding them by type (shell, python, etc.) using Unicode icons and pastel color schemes for visual clarity.
- **Previews**:
  - *Source preview* (`bat`): Shows the actual script file with syntax highlighting.
  - *Docs preview* (`bat`): Shows the corresponding documentation (expects `.md` files in `$SCRIPTS/docs/scripts/`).
- **Keybindings**:
  - `Enter`: Run the selected script.
  - `Alt+Enter` (`A-cr`): Run script in a new terminal.
  - `Ctrl+E`: Edit script in `nvim`.
  - `Alt+E`: Edit in a new terminal.
  - `Alt+S` / `Alt+D`: Toggle between doc/source preview.

The script adapts to either a standalone or embedded mode depending on arguments (`--embedded` or `-E` for simple `fzf` interface).

Relevant color settings are dynamically built via the `pastel` utility, aligning with your custom color scheme.

---

### Usage

Run interactively from a terminal:

```
$ ~/.scripts/bin/script_launcher.sh
```

For embedded/simple fzf menu (for plain terminals/picker integration):

```
$ ~/.scripts/bin/script_launcher.sh --embedded
```

Add a keybinding in your Qtile config:

```python
Key([mod], "p", lazy.spawn("~/.scripts/bin/script_launcher.sh"), desc="Script Launcher")
```

**Navigation/Actions:**
- **Navigate**: Arrow keys or type to filter scripts.
- **Preview**: Shift between documentation/source with `Alt+S`, `Alt+D`.
- **Run/Edit**: Use listed keybindings to execute/edit in-place or in new terms.

---

> [!TIP]
> **Critique:**  
> - The preview for documentation assumes strict naming and existence of markdown files in `$SCRIPTS/docs/scripts/`. Consider adding error handling if a doc is missing.  
> - The color formatting relies on several environment variables (`$FLEXOKI_*`) and will not display correctly unless these are set. Defaults or checks would improve portability.  
> - The helper scripts (`improved-fzfmenu.sh`, `terminal_with_command.sh`, `nvim_in_new_terminal.sh`) are user-created and not validated here—documenting and standardizing these would improve maintainability.  
> - The function `cmd-full-path` is unnecessarily convoluted; you can invoke `fd` more simply and directly.  
> - Consider supporting multiple selection (for batch operations) or exposing function arguments as hinted in the TODOs.  
> - Overall this is a very extensible, visually effective launcher, well suited for your workflow.