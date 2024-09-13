# Edit Chezmoi Configuration Files

---

**edit_chezmoi_cfg_files.sh**: A script to efficiently edit and manage Chezmoi config files.

---

### Dependencies

- `chezmoi`: A tool for managing dotfiles across machines.
- `fzf`: A command-line fuzzy finder.
- `bat`: A `cat` clone with syntax highlighting and Git integration.
- `eza`: A modern replacement for `ls`.
- `nvim`: Neovim, a hyperextensible Vim-based text editor.
- `fd`: A simple, fast and user-friendly alternative to `find`.

### Description

This script is designed to assist users in managing their Chezmoi configuration files through an interactive command-line interface. It provides functionalities such as searching for files and directories managed by Chezmoi and previews their content using `fzf`. The script leverages several utilities to enhance the user experience:

- `remove_icons`: Filters and removes non-printable characters from user input.
- `preview_command`: Displays a preview of selected files or directories using `bat` for files and `eza` for directories.
- `search_files` and `search_dirs`: These functions retrieve lists of managed files and directories, respectively, formatting them for user-friendly display.

The core functionality allows users to select a file or directory, preview its contents, and then choose to edit or apply changes using Chezmoi.

### Usage

To execute the script, simply run:

```bash
bash /home/matias/.scripts/edit_chezmoi_cfg_files.sh
```

The script will:

1. Change the directory to your home directory.
2. Launch `fzf`, showcasing a list of Chezmoi-managed files.
3. Use the arrow keys to navigate through the files:
   - Preview files with `bat` or directories with `eza`.
   - Use `Alt-D` to refresh the directory list and `Alt-F` for files.

After making a selection:
- If the selected item is a file, it opens in `nvim`.
- If it's a directory, it opens the first file found in that directory.

After editing, you are prompted to:
- Apply changes without syncing, apply and sync the repo, or exit.

Here's a summary of the prompts:
```text
- [a] (default): Chezmoi apply
- [s]: Chezmoi apply and sync repo
- [x]: exit
```

---

> [!TIP]  
> The script could be improved by adding support for error handling throughout the file/directory checks and displaying user feedback. Additionally, it could benefit from more customization options for the preview window and user choices for editing tools.