# Edit Chezmoi Configuration Files

---

**edit_chezmoi_cfg_files.sh**: A script to select and edit Chezmoi-managed configuration files using fzf

---

### Dependencies

- `bash`: For running the script itself.
- `tr` and `sed`: Text manipulation tools used for cleaning up file names.
- `chezmoi`: A dotfile management tool to manage your configuration files.
- `bat`: A cat clone with syntax highlighting for viewing file previews.
- `eza`: A modern replacement for `ls` for displaying files with icons and colors.
- `fzf`: A command-line fuzzy finder to help select files or directories to edit.
- `fd`: A simple, fast alternative to `find`.
- `nvim`: For editing files, though the script is currently using `chezmoi edit`. Make sure your setup aligns with your preferences.

### Description

This script is designed to help you quickly select and edit configuration files managed by Chezmoi on your Arch Linux system, specifically in a qtile window manager environment. The script leverages a fuzzy finder (`fzf`) to present a list of Chezmoi-managed files and directories. Upon selecting a file, it is edited using the `chezmoi edit` command. Additionally, a preview feature is provided, which uses `bat` for files and `eza` for directories, ensuring you get a clear and formatted preview of the content.

The script includes the following key functions:

- **`remove_icons`**: Cleans up filenames by removing non-printable characters and leading whitespaces.
- **`preview_command`**: Determines whether a selected item is a file or directory and then previews its content accordingly.
- **`search_files` and `search_dirs`**: Retrieve lists of files and directories managed by Chezmoi with formatting for `fzf`.

### Usage

1. Run the script from a terminal:
   ```bash
   /home/matias/.scripts/bin/edit_chezmoi_cfg_files.sh
   ```
2. Use `fzf` to search and select a file or directory to edit.
   - Navigate lists using arrow keys.
   - Use `Alt-D` to toggle between directories and files.
3. Upon selection, the script will open the file for editing using `chezmoi edit`.
4. After editing, choose whether to:
   - Apply changes (`a` or default)
   - Apply changes and sync the repo (`s`)
   - Exit without applying (`x`)

---

> [!TIP]
> Consider handling exceptions if the file or path does not exist to improve script robustness. Additionally, you may want to ensure that the `$SCRIPTS/sync-repo.sh` path is correctly set up in your environment. Adjust the script to use `nvim` or another editor if preferred.