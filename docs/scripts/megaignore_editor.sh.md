# Megaignore Editor

---

**megaignore_editor.sh**: Interactive editor for .megaignore files using `fzf` and `nvim`.

---

### Dependencies

- `fd`: Finds files with specified patterns; used here to locate `.megaignore` files.
- `fzf`: A command-line fuzzy finder; used for selecting files and integrating previews.
- `bat`: A `cat` clone with syntax highlighting; used for file preview.
- `nvim`: The hyperextensible Vim-based text editor; used to edit selected files.
- `rm`: Standard Unix command for removing files; used here to delete files interactively.

### Description

The `megaignore_editor.sh` script aids in managing `.megaignore` files scattered throughout your home (`$HOME`) and mounted (`/mnt`) directories. It leverages `fd` to locate these specific files and present them in an interactive selection interface powered by `fzf`.

- The script uses `fd` to search recursively for `.megaignore` files. 
- `fzf` presents these files, allowing you quick access to view and edit them using `nvim`. By default, a file preview is shown using `bat`.
- You can press `Enter` to open a selected file in `nvim` for editing.
- `Ctrl-d` allows for the deletion of the selected `.megaignore` file permanently.
- After each action, you are prompted if you want to continue or quit the script.

### Usage

This script is intended to be executed interactively in a terminal. 

```bash
# Navigate to the directory containing megaignore_editor.sh or add it to your PATH
./megaignore_editor.sh
```

- **To edit a file:** Use arrow keys to navigate, press `Enter` to open the file in `nvim`.
- **To delete a file:** Navigate and press `Ctrl-d`.
- **To exit:** When prompted, type `n` and press Enter to stop the loop.

This utility can be optionally set to run with a hotkey in `qtile`, automating the execution from your window manager environment.

---

> [!TIP]
> This script is robust for its basic functionality, but there are potential enhancements. You could add logging for file edits and deletions, improve user prompts for more informed decisions, or incorporate error handling for cases where dependencies aren't met. Additionally, confirming deletions more explicitly could prevent accidental data loss.