# Edit Chezmoi Configuration Files

---

**edit_chezmoi_cfg_files.sh**: A script to manage and edit Chezmoi configuration files interactively using fzf.

---

### Dependencies

- `fzf`: A command-line fuzzy finder allowing for easy search and selection of files.
- `chezmoi`: A tool for managing your dotfiles, allowing you to source desired configurations easily.
- `bat`: A tool to view files with syntax highlighting, used for previewing configs.
- `eza`: An enhanced version of `ls` with color support and icons.
- `nvim`: A modern text editor, used here to edit selected configuration files.
- `fd`: A simple, fast, and user-friendly alternative to `find`.

### Description

This script allows users to browse and edit Chezmoi-managed configuration files through an interactive interface powered by `fzf`. It enables previews of files and directories, which enhances the user experience by quickly providing context for the selections made.

**Key Functions:**
- `remove_icons`: Cleans up output by removing non-printable characters.
- `preview_command`: Displays file previews using `bat` for files and `eza` for directories.
- `search_files`: Lists files managed by `chezmoi`, supported by `eza` for attractive output.
- `search_dirs`: Lists directories managed by `chezmoi`.

Users can bind keys to reload file or directory searches dynamically. Upon selection, the script will prompt for actions to apply Chezmoi changes or sync configurations with the repo.

### Usage

To use the script, simply run it from a terminal:

```bash
bash ~/home/matias/.scripts/edit_chezmoi_cfg_files.sh
```

While running:
- Navigate files with arrow keys or type to filter.
- Press `ALT + F` to reload the list of files or `ALT + D` to reload directories.
- After selecting a file or directory, you will be prompted to choose an action:
  - `a` (default): Apply the configuration.
  - `s`: Apply and sync the repository.
  - `x`: Exit without changes.

---

> [!TIP] 
> Consider enabling more user feedback during the script execution, such as progress notifications, especially when performing the apply or sync operations. Additionally, revising error handling could improve robustness, particularly in scenarios where `chezmoi` commands may fail.