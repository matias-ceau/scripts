# Edit Chezmoi Configuration Files

---

**edit_chezmoi_cfg_files.sh**: A script to browse and edit Chezmoi-managed configuration files.

---

### Dependencies

- `fzf`: A command-line fuzzy finder for selecting files with an interactive preview.
- `bat`: A cat clone with syntax highlighting for improved file viewing.
- `eza`: A modern replacement for `ls`, that provides colored and icon-rich output.
- `nvim`: A text editor command for editing configuration files.
- `chezmoi`: A tool for managing your dotfiles.

### Description

The `edit_chezmoi_cfg_files.sh` script allows users to browse and edit configuration files managed by Chezmoi, in a user-friendly manner using `fzf`. The script provides a preview feature for files and directories, utilizing external utilities for a better visual experience.

Here’s a brief overview of the main functions:

- `preview_command`: Displays a preview of the selected file or directory. It uses `bat` for files and `eza` for directories.
- `colorize_file_list`: Formats the list of files and directories with ANSI color codes. Directories are shown in bold blue, while files are color-coded distinctly.

The script executes the following steps:

1. List all files managed by Chezmoi.
2. Use `fzf` to allow the user to interactively select a file or directory.
3. On selection, it opens the file in `nvim` or, if it’s a directory, opens it using the `fd` command.
4. After editing, users are prompted to apply changes or sync the configuration with the repository.

### Usage

To use the script, simply execute it from the terminal:

```bash
bash /home/matias/.scripts/edit_chezmoi_cfg_files.sh
```

You can navigate through your Chezmoi-managed files and directories with the arrow keys. Use the following key bindings while in `fzf`:

- **Tab**: Select multiple files
- **Alt + D**: Reload directory list
- **Alt + F**: Reload file list

After editing, you will be prompted to choose one of the following actions:

- **a** (default): Apply changes with `chezmoi`
- **s**: Apply changes and sync the repository
- **x**: Exit without applying changes

---

> [!TIP]
> Consider improving error handling throughout the script to manage cases where files or directories may not exist or are inaccessible. Additionally, enhancing the user experience with more informative prompts and messages could help users navigate through potential issues easily.