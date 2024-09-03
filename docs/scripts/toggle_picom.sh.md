# Toggle Picom

---

**toggle_picom.sh**: Script to toggle the picom compositor on or off.

---

### Dependencies

- `picom`: A lightweight compositor for X11, required to manage your window transparency and effects.
- `notify-send`: A command to send desktop notifications, used to inform the user of the current action.

### Description

The `toggle_picom.sh` script is a simple shell script designed to manage the `picom` compositor. It checks whether `picom` is currently running and toggles its state accordingly. By using `pgrep`, the script detects if an instance of `picom` is active. If it is active, the script will send a notification indicating that it is stopping `picom` and then proceeds to kill the running process using `pkill`. Conversely, if `picom` is not running, the script starts it as a background process with the command `picom -b` and notifies the user that it is starting.

This script provides a convenient way to control your compositor directly from the command line or through a keybinding in your window manager.

### Usage

To use the script, simply run it from your terminal: 

```bash
bash ~/home/matias/.scripts/toggle_picom.sh
```

Alternatively, you can bind it to a key combination in your window manager (Qtile) for easier access. Here's how you can do that in your `config.py` for Qtile:

```python
keys.extend([
    Key([mod], "p", lazy.spawn("bash ~/home/matias/.scripts/toggle_picom.sh")),
])
```

This will allow you to toggle `picom` on and off with your chosen key combination.

---

> [!TIP]  
> Consider adding error handling for scenarios where `picom` fails to start or if the user does not have the necessary permissions to run `notify-send`. Additionally, you could provide an option to customize `picom` flags within the script, which could improve the script’s utility for advanced users.