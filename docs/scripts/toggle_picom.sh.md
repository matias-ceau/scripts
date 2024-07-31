# Toggle Picom

---

**[toggle_picom.sh](toggle_picom.sh)**: Script to toggle the Picom compositor on and off.

---

### Dependencies

- `picom`: A lightweight compositor for X11, used to add effects like transparency and shadows to windows.

### Description

This script is designed to quickly toggle the Picom compositor on an Arch Linux environment using the Qtile window manager. When executed, it will check if the Picom process is currently running.

- If Picom is active, the script will terminate it using the `pkill` command.
- If Picom is not running, it will start the compositor in the background (`-b` flag) ensuring the graphical effects are applied to the open windows.

The script utilizes `pgrep` to check for the running instance of Picom without any direct user input, making it efficient and user-friendly.

### Usage

To use this script, save it to an appropriate location, for example `/home/matias/.scripts/toggle_picom.sh`, and make sure to give it executable permissions:

```bash
chmod +x /home/matias/.scripts/toggle_picom.sh
```

You can then run the script directly from your terminal:

```bash
/home/matias/.scripts/toggle_picom.sh
```

For a smoother user experience, consider binding this script to a key combination in your Qtile configuration. Here’s a sample keybinding you could add to your `~/.config/qtile/config.py`:

```python
from libqtile import key

keys = [
    key.Key(["mod4"], "p", lazy.spawn("/home/matias/.scripts/toggle_picom.sh")),
]
```

---

> [!TIP]  
> The script currently uses `pkill picom`, which can be imprecise if other processes have similar names. Consider specifying a more unique identifier if you encounter issues. Additionally, adding flags to `picom` when starting (like `--config`) can allow you to customize its behavior.
