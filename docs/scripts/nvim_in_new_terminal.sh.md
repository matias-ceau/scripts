# Open Neovim in Floating Terminal

---

**nvim_in_new_terminal.sh**: Opens a floating terminal to edit a file with Neovim

---

### Dependencies

- `alacritty`: A fast, cross-platform, OpenGL terminal emulator.
- `nvim`: Neovim, a hyperextensible Vim-based text editor.
- `setsid`: Runs a program in a new session, used here to launch `alacritty` independently.

### Description

This script is designed to open a specified file in Neovim inside a new, floating terminal window. Leveraging the power of `alacritty` to provide a graphical terminal, the script ensures that your editing session is visually distinct by running `alacritty` with a custom title (`nvim-term`) and class name ('floating'). This allows you to utilize window management features in qtile specific to windows with the 'floating' class. The script uses `setsid` to detach the process from the terminal, allowing the script to exit without closing the terminal window.

### Usage

To use this script, pass the file you want to edit as an argument. The script can be executed directly from the terminal or bound to a key combination in your qtile configuration for quick access.

```bash
~/.scripts/bin/nvim_in_new_terminal.sh /path/to/file.txt
```

Example of running the script:

```bash
~/.scripts/bin/nvim_in_new_terminal.sh ~/Documents/notes.txt
```

For integration with qtile, you might bind the script to a key combination by editing your qtile configuration file (`config.py`) with something like:

```python
Key(["mod4"], "e", lazy.spawn("~/.scripts/bin/nvim_in_new_terminal.sh '/path/to/file.txt'")),
```

Replace `/path/to/file.txt` with your desired default file or modify as per your workflow.

---

> [!TIP] This script assumes that `alacritty` and `nvim` are installed and located in your `$PATH`. Ensure that these dependencies are met before using the script. Additionally, consider enhancing the script to check if the file specified exists before attempting to open it, or to handle multiple file arguments to increase its versatility.