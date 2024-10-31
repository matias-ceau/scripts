# FZFMenu Run Script

---

**fzfmenu_run.sh**: A script to replace `dmenu_run` with `fzf` and a floating `xterm` terminal

---

### Dependencies

- `dmenu_path`: A utility to list executable files that appear in your `PATH`, typically part of the `dmenu` package.
- `fzfmenu.sh`: Presumably, a custom script that utilizes `fzf`, a command-line fuzzy finder, to select commands.
- `xargs`: A command used to build and execute command lines from standard input.
- `xterm`: A terminal emulator for the X Window System.

### Description

This script is designed as an alternative to `dmenu_run`, providing a feature-rich command launcher experience using `fzf` for fuzzy finding. The script first uses `dmenu_path` to generate a list of available commands from the user's `PATH`. This list is then piped into `fzfmenu.sh`, which likely processes the input using `fzf` to allow the user to interactively search and select a command. The selected command is then executed in a new instance of `xterm`, allowing you to run any command in a floating terminal window. This setup is particularly useful in a tiling window manager like `qtile`, where floating windows can help maintain the workflow without disrupting the current tile layout.

### Usage

To use this script, you can:

```bash
bash /home/matias/.scripts/bin/fzfmenu_run.sh
```

For a seamless experience, consider binding this script to a key combination in your `qtile` configuration. Here is an example of how you might add a keybinding:

```python
from libqtile.config import Key
from libqtile.lazy import lazy

keys = [
    # Other keybindings...

    # Bind `Mod + r` to launch fzfmenu_run
    Key(["mod4"], "r", lazy.spawn("/home/matias/.scripts/bin/fzfmenu_run.sh")),
]
```

Once executed, this script will display a searchable list of executables in a floating `xterm` window, allowing you to quickly find and run any program installed on your system.

---

> [!TIP]
> To make this script more robust, consider adding error handling to check if `fzfmenu.sh` and `xterm` are available. Additionally, documenting the `fzfmenu.sh` script would increase usability and transparency, ensuring users understand its role and dependencies.
