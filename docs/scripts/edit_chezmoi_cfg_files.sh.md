# Edit Chezmoi Configuration Files

---

**edit_chezmoi_cfg_files.sh**: Script for selecting and editing Chezmoi managed configuration files.

---

### Dependencies

- `chezmoi`: This is the primary tool for managing dotfiles and configuration files.
- `fzf`: A command-line fuzzy finder for selecting items interactively.
- `bat`: A cat clone with syntax highlighting and Git integration (used for previewing files).
- `eza`: An enhanced version of `ls` with colored output and icons.
- `nvim`: Neovim, a text editor used to open the configuration files.
- `fd`: A simple, fast, and user-friendly alternative to `find` (used for locating files).

### Description

This script facilitates the editing of configuration files managed by Chezmoi. It allows users to visually select files or directories from their Chezmoi-managed configurations through an interactive fuzzy finder (`fzf`). 

When executed, the script performs the following:

1. It defines two helper functions:
   - `preview_command`: Previews files and directories using `bat` or `eza`.
   - `colorize_file_list`: Colorizes file and directory names for improved readability in `fzf`.

2. The script gathers all files managed by Chezmoi and pipes them into `fzf`, presenting the user with a list to select from. The selected file's path is determined based on the Chezmoi source path and opened with Neovim.

3. After editing, the user is presented with options to apply changes:
   - Apply changes directly to Chezmoi.
   - Sync the changes to a repository.
   - Exit without applying any changes.

### Usage

To use this script, simply run it in your terminal. Here’s a quick command to execute it:

```bash
/home/matias/.scripts/edit_chezmoi_cfg_files.sh
```

This will trigger an interactive session where you can:

- Navigate through your managed configuration files.
- Preview files on the right-hand side as you navigate using `fzf`.
- Select a file or directory, which will open it in Neovim.

After editing, you will see the following prompt:

```
- [a] (default): Chezmoi apply
- [s]: Chezmoi apply and sync repo
- [x]: exit
 > 
```

You can then choose to apply changes, apply and sync, or exit.

---

> [!TIP]
> Potential improvements for the script could include:
> - Adding error handling for various commands to manage unexpected behavior gracefully.
> - Implementing user-configurable options for `fzf` layout or preview settings.
> - Documentation for the functions included within the script for further clarity on usage and customization options.