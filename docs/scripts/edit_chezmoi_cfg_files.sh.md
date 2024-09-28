# Edit Chezmoi Configuration Files

---

**edit_chezmoi_cfg_files.sh**: A script to browse and edit Chezmoi-managed files with optional synchronization

---

### Dependencies

- `chezmoi`: A dotfile manager that manages your dotfiles.
- `bash`: The scripting shell interpreter.
- `fzf`: A command-line fuzzy finder used for interactive file search.
- `bat`: A cat clone with syntax highlighting and Git integration for previewing files.
- `eza`: A modern replacement for `ls` with a focus on user-friendliness.
- `nvim`: Neovim, a hyperextensible Vim-based text editor.
- `fd`: A simple, fast, and user-friendly alternative to `find`.

### Description

The `edit_chezmoi_cfg_files.sh` script is designed for users who manage their configuration files using Chezmoi on an Arch Linux system with the Qtile window manager. It streamlines the process of searching, previewing, and editing both files and directories managed by Chezmoi. The script uses fuzzy finding (via `fzf`) to select the files or directories you wish to edit, while `bat` provides syntax-highlighted previews. Directories are listed with `eza` to display icons and colored output.

The script automates the handling of Chezmoi `source-path` to open the selected file in `nvim`. Additionally, it provides options to apply changes with Chezmoi and optionally sync the repository if changes are meant to be shared.

### Usage

To use this script, execute it from your terminal:

```bash
~/.scripts/edit_chezmoi_cfg_files.sh
```

Upon execution, you will see a list of Chezmoi-managed files where you can navigate using `fzf`. Use `Alt-D` to switch to displaying directories and `Alt-F` to revert to files. Once a selection is made and you're editing in `nvim`, an option will appear to:

- [a] Apply changes with Chezmoi.
- [s] Apply changes and sync your repository.
- [x] Exit without applying changes.

Example use case:

```bash
# Just run and follow the prompt
~/.scripts/edit_chezmoi_cfg_files.sh
```

---

> [!TIP]
> Consider replacing direct calls to variables like `$HOME` with `${HOME}` to avoid potential word splitting. The script can also benefit from error checks for missing dependencies and ensuring that `cd` operations succeed before proceeding.