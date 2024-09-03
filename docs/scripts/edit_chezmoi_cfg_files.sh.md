# Edit Chezmoi Configuration Files

---

**edit_chezmoi_cfg_files.sh**: A script for editing and managing Chezmoi configuration files.

---

### Dependencies

- `bash`: The shell interpreter used to run the script.
- `chezmoi`: A tool for managing dotfiles and configuration files.
- `fzf`: A command-line fuzzy finder to select files easily.
- `bat`: A cat clone with syntax highlighting and Git integration for file previews.
- `eza`: An enhanced version of `ls` for listing files and directories.
- `nvim`: Neovim text editor used to open configuration files.
- `fd`: A simple, fast and user-friendly alternative to `find`.

### Description

This script allows users to easily navigate, preview, and edit files managed by Chezmoi. It incorporates a fuzzy finder (`fzf`) which displays Chezmoi-managed files and directories, allowing for quick access. The preview of each file or directory is enhanced using `bat` and `eza` for better readability and user experience.

Key functions include:

- `preview_command`: Previews files and directories in an organized manner using `bat` and `eza`.
- `colorize_file_list`: Colorizes the output of file listings to differentiate between files and directories, using ANSI color codes for better visualization.
- The script binds specific keys for custom actions within the fuzzy finder, such as reloading directories or files.

### Usage

To run this script, simply execute it in your terminal:

```bash
bash ~/.scripts/edit_chezmoi_cfg_files.sh
```

Upon running, the script will initiate the fuzzy finder interface, where you can navigate through your Chezmoi-managed files and directories. You can select multiple files with the keyboard and preview them immediately. Pressing Enter opens the selected file in Neovim.

At the end of your editing session, you can choose one of the following actions when prompted:

- **a** (default): Apply the changes made with Chezmoi.
- **s**: Apply changes and sync the repository.
- **x**: Exit without applying changes.

---

> [!TIP]  
> The script assumes `chezmoi` is properly configured and that `SCRIPTS` and `CHEZMOI` variables are defined in your environment. Ensure that these paths are correctly set to avoid runtime errors. Additionally, consider adding error-handling mechanisms when dealing with file operations to enhance reliability.