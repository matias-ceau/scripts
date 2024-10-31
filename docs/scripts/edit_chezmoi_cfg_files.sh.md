# Edit Chezmoi Config Files

---

**edit_chezmoi_cfg_files.sh**: Script to search and edit Chezmoi managed configuration files and directories.

---

### Dependencies

- `bash`: The Bourne Again Shell, required for running this script.
- `fzf`: A command-line fuzzy finder for text filtering.
- `bat`: A cat clone with syntax highlighting and Git integration.
- `chezmoi`: A tool for managing dotfiles.
- `eza`: A modern replacement for `ls`, with additional features.
- `fd`: A simple, fast and user-friendly alternative to `find`.

### Description

This script is designed to enhance the editing and management of files and directories managed by Chezmoi. It utilizes several dependencies to provide a user-friendly command-line interface, allowing you to quickly search for and preview files, as well as open them for editing.

The script defines several functions:
- `remove_icons`: Cleans up output by removing non-printable characters.
- `preview_command`: Provides a preview of a selected file or directory using `bat` and `eza`.
- `search_files`: Lists files managed by Chezmoi along with additional formatting from `eza`.
- `search_dirs`: Lists directories managed by Chezmoi.

At its core, the script leverages `fzf` to present an interactive interface, enabling users to search through managed files and directories, and then edit them seamlessly with Chezmoi.

### Usage

1. Ensure the necessary dependencies are installed on your Arch Linux system.
2. Run the script from a terminal:
   ```bash
   bash /home/matias/.scripts/bin/edit_chezmoi_cfg_files.sh
   ```

3. After launching, you can navigate through your configuration files and directories.
4. Use the keyboard shortcuts:
   - `Alt + D` to reload the directory list.
   - `Alt + F` to reload the file list.
5. When selecting a file or directory, confirmation prompts will allow you to edit or synchronize changes.

### Example Usage
Run:
```bash
bash edit_chezmoi_cfg_files.sh
```
Select a file from the interactive menu, and choose an action to apply your changes.

---

> [!TIP]
This script could benefit from improved error handling to ensure robustness, especially when checking for file and directory statuses with `chezmoi`. Consider implementing checks around the `chezmoi apply` commands as well to handle edge cases more gracefully. Additionally, provide users with the option to customize their preview settings directly in the script.