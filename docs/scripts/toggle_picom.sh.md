# Toggle Picom Compositor

---

**toggle_picom.sh**: Simple script to toggle the Picom compositor on and off with notifications.

---

### Dependencies

- `picom` - Lightweight compositor for X11
- `pkill` / `pgrep` - Process management commands (provided by `procps-ng`)
- `notify-send` - Desktop notification tool (commonly provided by `libnotify`)
- `bash` - The script interpreter

### Description

This script checks if the `picom` compositor is currently running and toggles its state accordingly, providing a desktop notification on both actions:

- If `picom` is running, it sends a notification and terminates the process.
- If `picom` is not running, it notifies the user and starts `picom` in the background with the `-b` option.

The script is especially useful in tiling window manager setups (such as qtile on Arch Linux), where you may want to quickly enable or disable window transparency and other compositor effects.

#### Breakdown

- `pgrep -x "picom"`: Checks for running `picom` processes.
- `notify-send`: Sends a desktop notification for user feedback.
- `pkill picom`: Stops any running `picom`.
- `picom -b`: Starts `picom` in daemon/background mode.

### Usage

This script can be executed directly, or bound to a keybinding in qtile for fast toggling.

**Direct terminal usage:**
```
/home/matias/.scripts/bin/toggle_picom.sh
```

**Example qtile keybinding (Python, in your config.py):**
```python
Key([mod], "F12", lazy.spawn("/home/matias/.scripts/bin/toggle_picom.sh"))
```

**tldr**

- Just run the script; it will start or stop picom, with a notification.
- Useful to quickly disable compositing for screen sharing/gaming, or re-enable it for eye candy.

---

> [!TIP]
> 
> The script is effective and minimal! Some potential improvements:
> - There's no error handling for cases where `picom` fails to start (e.g., config issues).
> - It assumes only one `picom` instance ever runs (multiple displays/setups might want more).
> - If you want custom configurations or logging, you could add arguments to pass extra options to `picom`.
> - On Wayland, `picom` is not relevant; script only applies for X11 sessions.
> - You could add audible feedback (e.g., with `aplay` or similar) for extra accessibility.