# Open Neovim in a New Floating Terminal

---

**nvim_in_new_terminal.sh**: Opens a floating terminal to edit a file with Neovim.

---

### Dependencies

- `alacritty`: A modern terminal emulator that supports floating windows and various features suited for developers.
- `nvim`: Neovim is an extensible text editor based on Vim.

### Description

This script provides a convenient way to open files in Neovim within a floating terminal window. It utilizes `alacritty`, a fast OpenGL terminal emulator, to create a new terminal instance. The script is particularly useful for users who prefer to quickly edit files without leaving their current workspace in Qtile.

When executed, the script uses the `setsid` command to start a new session for `alacritty`. The terminal window is titled `nvim-term` and is assigned a class of 'floating', which allows it to overlay other windows effectively. The script then invokes `nvim` with the specified file as an argument.

### Usage

To use the script, simply execute it from the command line with the desired file to edit as an argument. Here’s how to run it:

```bash
bash /home/matias/.scripts/nvim_in_new_terminal.sh /path/to/your/file.txt
```

Alternatively, you can assign this script to a keybinding in your window manager (Qtile). For example:

```python
# In your ~/.config/qtile/config.py
from libqtile import key

keys = [
    key.Key([mod], "n", 
             lazy.spawn("/home/matias/.scripts/nvim_in_new_terminal.sh ~/file_to_edit.txt"))
]
```

This configuration would open the specified file in a floating terminal whenever you press the assigned key combination.

---

> [!TIP]  
> The script currently does not check if the file exists before attempting to open it. To improve robustness, consider adding a file existence check and providing a user-friendly message if the file isn't found. This can prevent errors and enhance user experience. Additionally, allowing the user to specify terminal options via arguments could make the script more flexible.