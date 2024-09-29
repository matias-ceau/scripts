# Toggle Picom

---

**toggle_picom.sh**: Script to toggle the picom compositor in Arch Linux.

---

### Dependencies

- `notify-send`: A command-line utility for sending desktop notifications. It is usually included in the `libnotify` package.

### Description

The `toggle_picom.sh` script is designed to toggle the running state of the **picom** compositor on an Arch Linux system using the **qtile** window manager. This script checks whether **picom** is currently running and performs the following actions based on its state:

- If **picom** is running, it will stop the compositor and display a notification indicating this action.
- If **picom** is not running, it will start the compositor in the background and notify the user of this event.

The script utilizes `pgrep` to check the running processes, `pkill` to terminate **picom**, and `notify-send` to provide user feedback.

### Usage

To use the `toggle_picom.sh` script, follow these simple steps:

1. **Make the script executable** (if it isn't already):
   ```bash
   chmod +x /home/matias/.scripts/toggle_picom.sh
   ```

2. **Run the script** from the terminal or create a keybinding in your window manager configuration so that you can execute it easily. You can run it directly in the terminal by executing:
   ```bash
   /home/matias/.scripts/toggle_picom.sh
   ```

3. **Assign a keybinding in qtile** (optional):
   You can assign the script to a key combination in your `~/.config/qtile/config.py`:
   ```python
   Key([mod], "p", lazy.spawn("/home/matias/.scripts/toggle_picom.sh"), desc="Toggle Picom"),
   ```

---

> [!TIP]  
> The script currently lacks error handling. For example, if `picom` is not installed, the user will not receive any notification of failure. Consider adding checks to verify the existence of picom or provide more detailed feedback on errors. Additionally, you might want to include options for customizing picom's parameters such as enabling/disabling specific effects when starting picom.