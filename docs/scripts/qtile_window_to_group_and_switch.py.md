# Qtile Window Group Switcher

---

**qtile_window_to_group_and_switch.py**: Script to move and switch the current window to the next or previous group in Qtile.

---

### Dependencies

- `libqtile`: This script uses `InteractiveCommandClient` from the Qtile library, which facilitates communication with the Qtile window manager.
- `subprocess`: Standard Python module for running system commands (used here for displaying error notifications).
- `notify-send`: Sends desktop notifications, used to inform the user of errors if script arguments are invalid.

### Description

This script is designed for the Qtile window manager on Arch Linux with the purpose of moving the currently focused window to the next or previous group and switching to it. It leverages the `libqtile.command.client.InteractiveCommandClient` to issue commands directly to the Qtile instance.

The script checks for command-line arguments `-n` (next) and `-p` (previous). Based on the argument, it computes the target group using a modulo operation that cycles through groups 1 to 6 and instructs Qtile to move the focused window to the computed group. If the arguments are incorrect, it sends a notification using `notify-send`.

### Usage

This script should be executed in a terminal or bound to a key combination within Qtile for quick access. It requires one of two arguments:

- `-n`: Move the current window to the next group and switch to it.
- `-p`: Move the current window to the previous group and switch to it.

#### Example
To move the current window to the next group:
```bash
python /home/matias/.scripts/qtile_window_to_group_and_switch.py -n
```

To move the current window to the previous group:
```bash
python /home/matias/.scripts/qtile_window_to_group_and_switch.py -p
```

### Keybinding
Consider adding keybindings in your Qtile config to use this script. For example:
```python
Key([mod], "n", lazy.spawn("python /home/matias/.scripts/qtile_window_to_group_and_switch.py -n")),
Key([mod], "p", lazy.spawn("python /home/matias/.scripts/qtile_window_to_group_and_switch.py -p")),
```

---

> [!TIP]
> The script currently handles only six groups—this restriction can be adjusted if your configuration uses more. Additionally, including a check to ensure that the `InteractiveCommandClient` successfully retrieves the current group before operating could prevent potential runtime errors.