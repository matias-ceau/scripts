# MegaIgnore File Editor

---

**megaignore_editor.sh**: Fuzzy finder interface for searching, editing, and deleting `.megaignore` files.

---

### Dependencies

- `fd`: Fast and user-friendly alternative to `find`, used for locating `.megaignore` files.
- `fzf`: Command-line fuzzy finder to interactively select files.
- `bat`: A `cat` clone with syntax highlighting in the preview pane.
- `nvim`: Neovim editor, for opening selected files.
- `rm`: Standard UNIX tool for removing files.
- Bash shell.
- (Optionally) runs best under a terminal in Arch Linux with qtile window manager.

### Description

This script provides an interactive tool for managing your `.megaignore` files scattered throughout your home and `/mnt` directories. It continuously presents you with a fuzzy finder list (via `fzf`) of all `.megaignore` files found by `fd`. 

Key functions:
- **Preview**: When browsing, the contents of each file are previewed with syntax highlighting by `bat`.
- **Edit**: Pressing `Enter` opens the selected file in `nvim` for editing.
- **Delete**: Pressing `Ctrl-D` deletes the selected file using `rm`.

After each fuzzy finder session, you're asked if you want to continue; typing `n` exits the script, hitting Enter or any other key starts a new search cycle.

### Usage

The script is designed to be run in a terminal session:

```sh
~/.scripts/bin/megaignore_editor.sh
```

- Upon running, you'll be presented a list of all `.megaignore` files.
- Use the interactive fuzzy search to filter files.
- **Preview** content: Automatically shown on selecting any file.
- **Edit file**: Press `Enter`—opens in Neovim.
- **Delete file**: Press `Ctrl-D`.
- After exiting the fzf window, confirm if you'd like to continue.

#### Example session

1. Run the script:
    ```sh
    ~/.scripts/bin/megaignore_editor.sh
    ```
2. Use fzf to select and preview `.megaignore` files.
3. Hit `Enter` to edit, or `Ctrl-D` to delete.
4. Respond to the prompt to repeat or exit.

---

> [!TIP]
> 
> - There’s no confirmation for `rm`, which could lead to accidental file loss; consider adding a confirmation step.
> - The script assumes all dependencies (`fd`, `fzf`, `bat`, `nvim`) are installed and available in your `PATH`.
> - Users not running Neovim should adjust the editor to preference.
> - If you have many `.megaignore` files or filesystem access is slow, there might be a short delay while running `fd`.
> - Handling file names with spaces could be improved (e.g., quoting `{}` parameters more carefully).
> - Long-running in an infinite loop; user can only exit cleanly by entering `n` at the prompt. Optional early exit (e.g., by pressing `q` in `fzf`) could be a nice feature.