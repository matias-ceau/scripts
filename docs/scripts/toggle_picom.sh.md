# Toggle Picom

---

**toggle_picom.sh**: A script to toggle the picom compositor on and off.

---

### Dependencies

- `pgrep`: A command-line utility for searching processes.
- `notify-send`: A command-line tool used to send desktop notifications. This is part of the `libnotify` package, which is often pre-installed in many desktop environments.
- `picom`: A lightweight compositor for X11, often used for window effects in lightweight window managers like `qtile`.

### Description

The `toggle_picom.sh` script is designed to manage the `picom` compositor, allowing users to start or stop it based on its current running state. The script performs the following key actions:

1. **Check if Picom is Running**: It uses the command `pgrep -x "picom"` to determine if the picom process is active.
2. **Send Notifications**: Depending on whether picom is running or not, it sends a notification to the user using `notify-send`, informing them of the action being taken (starting or stopping).
3. **Start/Stop Picom**: The script either kills the picom process using `pkill picom` or starts it in the background with the command `picom -b`.

This simple script can enhance workflow efficiency in your Arch Linux environment, particularly when managed through `qtile`, by streamlining the control of compositing effects.

### Usage

To use the script, simply execute it from a terminal or bind it to a key combination in your window manager configuration. Here’s how you can run it directly from the terminal:

```bash
bash /home/matias/.scripts/toggle_picom.sh
```

You can also add a keybinding to your `qtile` configuration. Here’s an example of how to map it to a key sequence:

```python
from libqtile import key

# Add the following line inside your keys list
Key([mod], "p", lazy.spawn("bash /home/matias/.scripts/toggle_picom.sh")),
```

This will allow you to quickly toggle picom on and off without needing to manually type commands each time.

---

> [!TIP]  
> The script could benefit from additional error handling. For instance, consider checking if picom is installed before trying to start it. This will make the script more robust and user-friendly. You could also enhance the notifications by providing more context or logging the actions taken to a file for future reference.