# Qtile Window Group Switcher

---

**qtile_window_to_group_and_switch.py**: A script to toggle windows to specific groups in Qtile.

---

### Dependencies

- `libqtile`: This is the core library that provides the interactive command client functionality for managing windows and groups in the Qtile window manager.
- `notify-send`: Used to display notifications on the desktop, providing user feedback in case of an error.

### Description

This Python script is designed to be used with the Qtile window manager for Arch Linux. Its primary functionality is to move the currently focused window to a specified group and automatically switch to that group based on user input.

The script recognizes two command-line arguments:
- `-n`: Moves the current window to the next group (cycling from group 6 back to group 1).
- `-p`: Moves the current window to the previous group (cycling from group 1 back to group 6).

If an argument other than `-n` or `-p` is provided, or if there are any issues executing the script, a notification will be displayed using `notify-send`, indicating an error occurred during execution.

### Usage

To use the script, you can invoke it directly from the terminal or bind it to a key combination in your Qtile configuration. Below are examples of how to run the script correctly:

1. To move and switch to the next group:
   ```bash
   python /home/matias/.scripts/qtile_window_to_group_and_switch.py -n
   ```

2. To move and switch to the previous group:
   ```bash
   python /home/matias/.scripts/qtile_window_to_group_and_switch.py -p
   ```

To bind these commands to key combinations in your Qtile configuration, you can add entries to your `config.py` like so:

```python
Key([mod], "n", lazy.spawn("/home/matias/.scripts/qtile_window_to_group_and_switch.py -n")),
Key([mod], "p", lazy.spawn("/home/matias/.scripts/qtile_window_to_group_and_switch.py -p")),
```

---

> [!TIP] 
> Consider adding error handling for cases where no window is currently focused, or the group number falls outside the expected range. Expanding the notification messages can also enhance user experience by providing clearer feedback on the error encountered.