# Open File with Neovim in a Floating Terminal

---

**nvim_in_new_terminal.sh**: Script to open a file with `nvim` in a floating terminal window.

---

### Dependencies

- `alacritty`: A modern terminal emulator with a strong focus on performance.
- `nvim`: Neovim, an extendable Vim-based text editor.

### Description

This script is designed to enhance your workflow by opening files in `nvim` using a floating terminal window. It utilizes `setsid` to detach the terminal session, ensuring that the newly spawned terminal operates independently from the terminal that initiated it.

The script launches `alacritty`, specifying a window title (`-T nvim-term`) and a class (`--class 'floating'`) to facilitate integration with window managers like `qtile`, which can be configured to automatically place such windows in floating mode. The script passes the filename as a positional argument (`"$1"`) to `nvim`, allowing the user to directly open the desired file.

### Usage

To use this script, you can either execute it directly from the terminal or bind it to a keybinding in `qtile` for quicker access.

```sh
# Direct execution with a specified file
./nvim_in_new_terminal.sh path/to/your-file.txt
```

For usage within `qtile`, you might add a keybinding in your `qtile` configuration:

```python
# Keybinding example in qtile config
Key([mod], "e", lazy.spawn("/home/matias/.scripts/nvim_in_new_terminal.sh /path/to/your-file.txt")),
```

Make sure the script has execute permissions:

```sh
chmod +x /home/matias/.scripts/nvim_in_new_terminal.sh
```

---

> [!TIP]
> While the script effectively opens a floating terminal, additional flexibility can be incorporated by allowing more command-line options such as specifying `nvim` options or different terminal profiles. To further enhance functionality, consider handling scenarios where no file name is provided by defaulting to opening the terminal with `nvim` ready for a new file.