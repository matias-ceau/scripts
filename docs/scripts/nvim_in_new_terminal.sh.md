# Launch Neovim in a Floating Terminal

---

**nvim_in_new_terminal.sh**: Opens a floating terminal to edit a file with Neovim.

---

### Dependencies

- `alacritty`: A terminal emulator that supports advanced features including window class settings.
- `nvim`: Neovim, an extensible text editor that is a continuation of Vim.

### Description

This script allows users to open a file in Neovim using a floating terminal window. It utilizes `alacritty`, a GPU-accelerated terminal emulator, to provide a user-friendly interface. The script takes one argument, the file to be edited, and launches `nvim` within a new instance of `alacritty` set as a floating window. 

The line `setsid` is employed to start the `alacritty` terminal in a new session, which ensures that the terminal runs independently of the current shell session.

### Usage

To use the script, simply execute it from the command line with the name of the file you wish to edit as an argument. Here is how you can run it:

```bash
/home/matias/.scripts/nvim_in_new_terminal.sh path/to/your/file.txt
```

This will open `file.txt` in a floating terminal running `nvim`. The terminal can be moved or resized as needed, allowing for a versatile editing experience.

You can also bind this script to a key combination in your window manager (Qtile) for quick access. For example, you can add the following configuration to your Qtile config:

```python
keybindings = [
    Key([mod], "n", lazy.spawn("bash /home/matias/.scripts/nvim_in_new_terminal.sh")),
]
```

This binding will allow you to open a terminal with Neovim by simply pressing the designated key combination.

---

> [!TIP] 
The script currently accepts only one argument. Consider enhancing it to handle multiple files or to include additional options for Neovim to provide better usability. Furthermore, you might want to implement error handling to inform the user if a file does not exist or is not specified.