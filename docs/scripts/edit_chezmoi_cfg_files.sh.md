# Edit Chezmoi Configuration Files

---

**edit_chezmoi_cfg_files.sh**: Script to interactively edit and apply Chezmoi configuration files.

---

### Dependencies

- `bash`: The shell used to execute this script.
- `fzf`: A command-line fuzzy finder that enables interactive file selection.
- `bat`: A cat clone with syntax highlighting and Git integration designed for previewing files.
- `eza`: An enhanced version of `ls` used for listing directory contents with colors and icons.
- `chezmoi`: A tool for managing dotfiles across multiple machines.
- `nvim`: The Neovim text editor used to edit configuration files.

### Description

This script provides a user-friendly interface to manage and edit configuration files with Chezmoi. It utilizes `fzf` to present a list of files tracked by Chezmoi, offering a preview of the selected file or directory with the help of `bat` and `eza` for enhanced visualization. 

The script defines two core functions:
- `preview_command()`: Displays the contents of selected files or the listing of directories inside a preview window.
- `colorize_file_list()`: Outputs a formatted list of files and directories with ANSI color codes for improved readability.

The user can select multiple files or directories, and upon selection, they are prompted to choose between applying Chezmoi changes, syncing with the repository, or exiting the script.

### Usage

To run the script, execute the following command in a terminal:

```
bash /home/matias/.scripts/edit_chezmoi_cfg_files.sh
```

This initiates the Chezmoi file management process. You can navigate the file list using the arrow keys. The following keybindings are available:

- **Tab**: Select files or directories for subsequent action.
- **Alt+D**: Reload the list with only directories.
- **Alt+F**: Reload the list with files only.

Once a selection is made, a prompt allows you to:

```
- [a] (default): Chezmoi apply
- [s]: Chezmoi apply and sync repo
- [x]: exit
```

Simply enter your choice and press Enter to proceed accordingly.

---

> [!TIP] 
> This script handles user inputs and file selections effectively. However, consider adding error handling to manage scenarios where `chezmoi` commands might fail, or when a file cannot be opened in `nvim`. Additionally, implementing logging could help in troubleshooting and improving user experience.