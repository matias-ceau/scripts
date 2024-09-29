# Chezmoic Config File Editor

---

**edit_chezmoi_cfg_files.sh**: A script for editing and applying changes to chezmoi-managed configuration files.

---

### Dependencies

- `chezmoi`: A tool for managing dotfiles effortlessly.
- `fzf`: A command-line fuzzy finder tool for robust searching capabilities.
- `bat`: A cat clone with syntax highlighting and Git integration.
- `eza`: A modern replacement for `ls` with additional features.
- `nvim`: A text editor to modify files interactively.
- `fd`: A simple, fast and user-friendly alternative to `find`.

### Description

This script is designed to efficiently search and edit configuration files managed by `chezmoi`. By leveraging the power of `fzf` for fuzzy finding and `bat` for file previews, the script enhances the user experience of managing dotfiles.

Key functions include:
- **remove_icons**: Cleans up the input to remove special characters that can disrupt file paths.
- **preview_command**: Previews files using `bat` for visual inspection of the config files and `eza` for directories.
- **search_files** and **search_dirs**: Generate lists of files and directories managed by `chezmoi`, displaying them with `eza`.

When executed, the script prompts the user to select a file or directory from the `chezmoi` managed files. After selection, it provides an option to apply changes or sync the repository.

### Usage

Run the script in your terminal:

```bash
bash /home/matias/.scripts/edit_chezmoi_cfg_files.sh
```

Follow these prompts:
1. Use arrow keys to navigate or start typing to filter results.
2. Press `Enter` to select a file/directory.

Options upon selection:
- `a` (default): Apply changes using `chezmoi`.
- `s`: Apply changes and sync the repository.
- `x`: Exit the script without action.

---

> [!TIP] 
> Consider handling potential errors more gracefully, especially when checking for file or directory existence. This can improve user experience by providing clearer feedback on what went wrong. Additionally, integrating logging could help in debugging issues that may arise during file operations. Furthermore, consider adding an interactive menu to let users select which action to perform, especially for advanced options like syncing the repository.