# Toggle Picom

---

**toggle_picom.sh**: Toggles the `picom` compositor on or off.

---

### Dependencies

- `pgrep`: Used to check if `picom` is currently running.
- `notify-send`: Sends desktop notifications indicating the action being taken.
- `pkill`: Used to stop the `picom` process.
- `picom`: Compositor for X11 to provide effects like shadows, transparency, and fade.

### Description

This script serves to easily toggle the `picom` compositor on your Arch Linux system using qtile as your window manager. The script operates by first checking if a `picom` process is active using `pgrep`. If `picom` is found running, it sends a desktop notification to inform the user that `picom` is stopping and then proceeds to kill the `picom` process with `pkill`. Conversely, if no `picom` process is detected, it notifies the user that `picom` is starting before launching it in daemon mode with the `-b` flag. This script offers a straightforward method to manage your desktop's compositor state without manually starting or stopping `picom` via command line each time.

### Usage

To use this script, it should be executed in a terminal or mapped to a keybinding in your qtile configuration for quick access. 

Ensure the script is executable:

```bash
chmod +x /home/matias/.scripts/bin/toggle_picom.sh
```

Run the script with:

```bash
/home/matias/.scripts/bin/toggle_picom.sh
```

For an even smoother experience, consider adding a keybinding in your qtile config file to execute this script, providing instantaneous control over `picom` with just a keystroke.

---

> [!TIP] 
> Including error handling could improve this script. For instance, adding checks to handle failures when starting `picom` or if `notify-send` fails can make the script more robust. Additionally, consider logging the operations to a file for easier debugging if something doesn't work as expected.