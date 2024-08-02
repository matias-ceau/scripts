# Edit Chezmoi Configuration Files

---

**edit_chezmoi_cfg_files.sh**: A script to visually select and edit Chezmoi-managed configuration files.

---

### Dependencies

- `fzf`: A command-line fuzzy finder used for efficient selection.
- `bat`: A syntax highlighting file viewer that enhances the preview.
- `eza`: An alternative to `ls`, providing an improved listing experience.

### Description

This script is designed for Arch Linux users who utilize `chezmoi` for managing their dotfiles. It integrates with `fzf` to provide an interactive command-line interface for selecting configuration files to edit.

The script defines two main functions:
- `preview_command()`: It checks if the selected item is a file or directory. If it is a file, it uses `bat` to display a preview with line numbers and syntax highlighting. If it's a directory, it calls `eza` to list its contents.
- `colorize_file_list()`: This function outputs a colorized list of the managed files from Chezmoi, applying different styles based on whether the entries are files or directories.

The core functionality launches `fzf` with an improved preview feature, allowing users to navigate their Chezmoi-managed files efficiently. 

### Usage

To run this script, simply execute it in your terminal:

```bash
bash /home/matias/.scripts/edit_chezmoi_cfg_files.sh
```

The script will:
1. Generate a list of managed files using `chezmoi`.
2. Allow you to preview the file/directory contents using `fzf`.
3. Upon selection, it will open the chosen file in `nvim` (Neovim) for editing.

You can also assign this script to a keybinding in your window manager, `qtile`, to streamline your workflow. 

Example of a keybinding in `config.py` for `qtile`:

```python
Key([mod], "e", lazy.spawn("bash /home/matias/.scripts/edit_chezmoi_cfg_files.sh")),
```

---

> [!TIP]  
One potential improvement for this script is to add error handling for scenarios where `chezmoi` isn't installed or the file list is empty, enhancing the user experience in case something goes wrong. كذلك، consider allowing the user to specify the editor instead of hardcoding `nvim` to increase flexibility.