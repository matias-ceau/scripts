# Open nvim in a Floating Terminal

---

**nvim_in_new_terminal.sh**: Opens a floating terminal to edit a file using nvim

---

### Dependencies

- `alacritty`: A GPU-accelerated terminal emulator that allows for floating windows.
- `nvim`: Neovim, a modernized version of Vim, which is a highly extensible text editor.

### Description

This script is designed to launch a new floating terminal window using **Alacritty** and open a specified file in **Neovim**. By utilizing `setsid`, the script ensures that the terminal runs in a new session, keeping it independent from the terminal that initiated it.

The command used is:

```bash
setsid alacritty -T nvim-term --class 'floating' -e nvim "$1" &
```

- **setsid**: Starts a new session and detaches the terminal, which prevents the script from terminating when the calling terminal is closed.
- **alacritty**: This command specifies the terminal emulator to be opened.
  - `-T nvim-term`: Sets the title of the terminal window to "nvim-term".
  - `--class 'floating'`: Assigns a specific class to the window for window manager (WM) purposes, making it behave as a floating window.
  - `-e nvim "$1"`: Executes the command to run neovim with the first argument passed to the script, which is the file to be edited.

### Usage

To use the script, simply provide the filename you wish to edit as an argument. You can run the script from the terminal as follows:

```bash
bash /home/matias/.scripts/nvim_in_new_terminal.sh path/to/yourfile.txt
```

Alternatively, you can create a keybinding in your window manager to execute this script quickly. For instance, in **Qtile**, you can add a key binding like so in your configuration file:

```python
Key([mod], 'n', lazy.spawn('bash /home/matias/.scripts/nvim_in_new_terminal.sh path/to/yourfile.txt')),
```

---

> [!TIP] The script assumes that the `nvim` command and `alacritty` are accessible in your system's PATH. You may want to add error handling to notify the user if either command fails to execute. Additionally, consider implementing a default filename if none is provided, ensuring the script remains robust during usage.