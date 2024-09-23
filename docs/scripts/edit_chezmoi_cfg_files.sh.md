# Edit Chezmoi Configuration Files

---

**edit_chezmoi_cfg_files.sh**: A script to search and edit Chezmoi-managed configuration files.

---

### Dependencies

- `chezmoi`: A tool for managing dotfiles across multiple machines.
- `fzf`: A command-line fuzzy finder for interactive filtering.
- `bat`: A cat clone with syntax highlighting and Git integration.
- `eza`: An improved version of `ls` with icons and other enhancements.
- `nvim`: Neovim, a modernized text editor.
- `fd`: A simple, fast, and user-friendly alternative to `find`.

### Description

This script is designed to facilitate the editing of configuration files managed by Chezmoi. It leverages several command-line tools to provide an interactive experience for users looking to modify their dotfiles.

The core functionality involves:

- **Previewing Files**: The script provides a preview of the selected file or directory using `bat` for files and `eza` for directories.
- **Searching**: It allows users to search through managed files and directories using `chezmoi` commands, sorting them by modification time or alphabetically.
- **Interactive Selection**: With the help of `fzf`, users can visually select the desired file or directory to edit.
- **Editing with Neovim**: After selection, it opens the file in Neovim, allowing immediate edits.

### Usage

To execute the script, you must have it saved and made executable:

```bash
chmod +x ~/.scripts/edit_chezmoi_cfg_files.sh
```

You can then run it from the terminal:

```bash
~/.scripts/edit_chezmoi_cfg_files.sh
```

Upon running, users will encounter an interactive fuzzy search interface. Here's a rundown of the usage flow:

1. **File Search**: Type to filter through managed files.
2. **Preview**: The right pane provides a preview of the highlighted file or directory.
3. **Selection**: Press enter to select a file or directory.
4. **Edit Prompt**: Based on the selection, you’ll be prompted with options:
    - `[a]`: Apply the changes
    - `[s]`: Apply and sync to the repository
    - `[x]`: Exit without making changes

---

> [!TIP]  
> The usage of external commands (e.g., `bat`, `fzf`, `chezmoi`) should ensure they are installed and accessible from your `PATH`. Consider adding error handling or checking the availability of these commands before executing the script. Additionally, since this script uses a lot of external dependencies, it could benefit from a configuration section at the start where users can customize file search parameters or actions.