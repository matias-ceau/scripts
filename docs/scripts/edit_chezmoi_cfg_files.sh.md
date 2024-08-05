# Edit Chezmoi Config Files

---

**edit_chezmoi_cfg_files.sh**: Launches fzf to edit Chezmoi managed config files with previews.

---

### Dependencies

- `bat`: A cat clone with syntax highlighting and Git integration.
- `eza`: A modern replacement for `ls` with extra features and color support.
- `fzf`: A general-purpose command-line fuzzy finder.
- `chezmoi`: A tool for managing your dotfiles across multiple machines.
- `nvim`: A highly configurable text editor for writing and editing code.

### Description

This script facilitates the editing of configuration files managed through Chezmoi. By using `fzf`, it allows users to visually select files or directories, with instant previews of their contents. 

The `preview_command` function determines whether the selected item is a file or a directory:

- For files, it uses `bat` to display a colored view with line numbers and highlights based on the file type (e.g., INI, CONF).
- For directories, it utilizes `eza` to list the contents with colors and icons.

The script also includes a function called `colorize_file_list`, which enhances the display of the file paths by applying ANSI color codes to differentiate between directories and files effectively.

### Usage

To run the script, execute it in the terminal:

```bash
bash /home/matias/.scripts/edit_chezmoi_cfg_files.sh
```

It will present an interface where you can freely navigate and select the managed config files. Once you select a file, it will open in `nvim` for you to edit. If you wish to bind this to a keyboard shortcut in qtile, you can use:

```python
@hook.subscribe.startup
def autostart():
    run_cmd("bash /home/matias/.scripts/edit_chezmoi_cfg_files.sh")
```

---

> [!TIP]  
> Consider adding error handling for cases when `chezmoi` or the dependencies like `fzf` fail to execute. Additionally, specifying fallback options for viewers in case `bat` or `nvim` are not installed could improve user experience. Furthermore, implementing a function to navigate back to the original directory after editing may enhance the workflow.