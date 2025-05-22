# Edit Chezmoi Config Files

---

**edit_chezmoi_cfg_files.sh**: Fuzzy-find and edit dotfiles managed by chezmoi, with preview and optional sync/apply.

---

### Dependencies

- `chezmoi`: Manages personal dotfiles as source-controlled templates.
- `eza`: `ls` replacement for colorful/fancy directory listings.
- `fzf`: Command-line fuzzy finder for interactive file selection.
- `bat`: `cat` clone with syntax highlighting and Git integration (for file preview).
- `fd`: Simple, fast file finder (used for globbing files in directories).
- `$SCRIPTS/sync-repo.sh`: User script to sync repositories. (Script references this for optional syncing.)
- Optional: `nvim` (currently commented out), for editing files.

---

### Description

This script provides an interactive way to browse, preview, and edit dotfiles managed by chezmoi on your Arch Linux system. Leveraging the fuzzy finder `fzf`, the script initially lists all files managed by chezmoi, allowing quick filtering and selection. Pressing <kbd>Alt+D</kbd> toggles to directory mode, allowing navigation into directories managed by chezmoi. Previews are shown for files (with `bat`) and folders (with tree view from `eza`).

Once a file or directory is selected, the script opens it for editing via `chezmoi edit`. After editing, you are prompted to:

- Apply the changes with `chezmoi apply` (`a` or Enter)
- Apply and also sync the repo (`s`)
- Exit without applying/syncing (`x`)

The script is engineered for quick use within a terminal and can be easily bound to a custom keybinding in qtile for even snappier access to your chezmoi workflow.

**Key implemented functions:**
- `remove_icons`: Filters out terminal icons/escape sequences for clean file operations.
- `preview_command`: Generates live previews for files (using `bat`) and directories (using `eza`).
- `search_files/search_dirs`: Returns lists of managed files/directories for selection/reloading in fzf.

---

### Usage

**Typical workflow (`tldr` version):**

```sh
~/.scripts/bin/edit_chezmoi_cfg_files.sh
```

**Within fzf prompt:**
- Filter to find the file or directory managed by chezmoi you'd like to edit.
- Press <kbd>Alt+D</kbd> to switch to directory view.
- Press <kbd>Alt+F</kbd> to switch back to file view.
- Press <kbd>Enter</kbd> on your selection.

**After editing:**
```
- [a] Apply changes
- [s] Apply and sync repo
- [x] Exit (no apply)
```

This script is best launched from a terminal or bound to a custom key in your `qtile` configuration.

---

> [!TIP]
> **Critique / Potential Improvements:**
> - Script assumes `$SCRIPTS/sync-repo.sh` and `$CHEZMOI` are properly set up in the environment. Consider adding checks and clearer error handling for missing variables or dependencies.
> - Usage of `chezmoi edit $(fd . -tf "$path")` is a bit ambiguous: if the chosen directory contains many files, you may want to provide more selective logic, otherwise this could open an excessive number of editors or possibly fail.
> - The script could leverage `chezmoi source-path` to ensure file paths are correct, especially with unusual chezmoi configuration.
> - Some code (e.g. `nvim` integration) is commented out; clarify or remove.
> - For large chezmoi repos, consider limiting the search scope or preview size for responsiveness.  
> - `remove_icons` may not be foolproof for all terminal-icon themes; further refinement might be needed for maximum robustness.