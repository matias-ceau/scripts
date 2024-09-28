# Toggle Picom Script

---

**toggle_picom.sh**: Toggles the picom compositor on and off.

---

### Dependencies

- `picom`: A lightweight compositor for X11, commonly used to enable window shadows, transparency, and other effects.
- `notify-send`: A utility that sends desktop notifications, used to inform you when picom starts or stops.

### Description

This script is designed for environments running X11, like qtile on Arch Linux. It toggles the state of `picom`, a widely-used compositor, particularly in lightweight window manager setups. By checking if `picom` is currently running (using `pgrep`), it either stops the compositor when running or starts it in the background (with `picom -b`) when it is not. Notification messages are displayed using `notify-send` to keep you informed about the change in picom's status.

### Usage

To use the script, you can run it directly from the terminal:

```bash
/home/matias/.scripts/toggle_picom.sh
```

You might consider integrating it into your qtile configuration as a keybinding:

```python
Key([mod], "p", lazy.spawn("~/.scripts/toggle_picom.sh")),
```

This setup allows you to easily toggle picom on and off by pressing `mod+p` [replace `mod` with your actual qtile modifier key].

---

> [!TIP] In environments where minimal delay in toggling is desirable, consider verifying if the scripts or services that rely on picom have the appropriate conditions to handle sudden compositor state changes. Additionally, implementing a logging mechanism might help diagnose issues if the compositor fails to start or stop correctly.