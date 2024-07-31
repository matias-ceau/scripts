# FZF Menu Run

---

**[fzfmenu_run.sh](/fzfmenu_run.sh)**: A script to replace dmenu with fzf for running commands in a floating terminal.

---

### Dependencies

- `dmenu`: A dynamic menu for X11, often used for launching applications.
- `fzf`: A command-line fuzzy finder that allows you to search and select from a list.
- `st`: Simple Terminal, a simple terminal emulator.

### Description

This script provides a replacement for `dmenu` by leveraging `fzf` for a more interactive and visually appealing command execution experience. When executed, the script constructs a list of available commands using `dmenu_path`, which outputs the standard commands available in the user's environment.

The output is then piped into `fzfmenu.sh`, a helper script (presumably your custom fzf interface), allowing users to interactively select their desired command. Once a command is selected, it is executed in a new instance of the `st` terminal, enhancing user convenience by creating a floating terminal window where the command runs.

This approach not only makes executing commands easier but also provides a more aesthetically pleasing experience than traditional menus.

### Usage

To use this script, you can execute it from your terminal or assign it to a keybinding within your window manager (Qtile) configuration. Here’s how you might run this script directly from the terminal:

```bash
/home/matias/.scripts/fzfmenu_run.sh
```

For setting it to a keybinding in Qtile, you can modify your `config.py` file like so:

```python
from libqtile.config import Key
from libqtile.command import lazy

keys = [
    Key([mod], "r", lazy.spawn("/home/matias/.scripts/fzfmenu_run.sh")),  # Replace mod with your modifier key
]
```

Upon running the script, a floating terminal will appear containing the fzf interface. Type to filter through the commands, select one, and hit enter to execute it.

---

> [!TIP] 
> While this script effectively enhances the command execution experience, consider adding error handling to check whether the required dependencies (`dmenu`, `fzf`, and `st`) are installed. This can make the script more robust and user-friendly by providing meaningful error messages to the user. Additionally, including a preview of the command before execution could increase usability.
