# Open NVIM in a Floating Terminal

---

**nvim_in_new_terminal.sh**: Opens a floating terminal to edit a file with nvim.

---

### Dependencies

- `alacritty`: A terminal emulator that supports floating windows.
- `nvim`: Neovim text editor, a modern version of Vim.

### Description

The `nvim_in_new_terminal.sh` script is a simple Bash script designed for users who want to open files in the Neovim text editor (`nvim`) within a floating terminal window. This script is particularly useful for Arch Linux users who utilize the `alacritty` terminal emulator, allowing them to seamlessly edit files without disrupting their current workflow.

When executed, this script uses `alacritty` to spawn a new terminal window titled "floating", within which `nvim` is run. The script takes one argument (the file path), which specifies the file you want to edit. If the user does not provide a file path, `nvim` will open without any specific file.

### Usage

To use the script, you must have both `alacritty` and `nvim` installed on your system. Ensure that the script has executable permissions. You can run it from the terminal as follows:

```bash
chmod +x /home/matias/.scripts/nvim_in_new_terminal.sh
/home/matias/.scripts/nvim_in_new_terminal.sh path/to/your/file.txt
```

This command opens `file.txt` in a floating `alacritty` terminal running `nvim`. You can replace `path/to/your/file.txt` with the path of whichever file you wish to edit.

Additionally, this script could be assigned to a keybinding in your window manager configuration (e.g., qtile) to streamline the editing process.

---

> [!TIP]  
> The script currently only handles a single file input. Consider adding error handling to manage cases where no file is provided or the file does not exist. This can enhance the user experience by preventing possible confusion when trying to open invalid files.