# qtile_window_to_group_and_switch.py

---

**qtile_window_to_group_and_switch.py**: Switches the active window to a new group in Qtile.

---

### Dependencies

- `python`: The script is written in Python and requires it to be executed.
- `libqtile`: A library from the Qtile window manager necessary for interacting with window groups.
- `notify-send`: A tool to display notifications, used here for error reporting.

### Description

This script allows the user to move the currently active window to a different group within the Qtile window manager. Depending on the argument passed (`-n` for next group or `-p` for previous group), it calculates the target group to which the active window should be sent. 

When executed, the script queries the current active group using `c.screen[0].items("group")` to find the last active group's index. If the argument is `-n`, it increments the current group index, and if it's `-p`, it decrements it. An important constraint is that the target group index is wrapped around by using modulus operation with the total number of groups (in this case, assumed to be 6). 

In case of incorrect usage, a notification is sent using `notify-send`, informing the user of the error.

### Usage

To run this script, you need to invoke it from the terminal with either `-n` or `-p`. Here are some examples:

**To switch the active window to the next group:**
```bash
/home/matias/.scripts/qtile_window_to_group_and_switch.py -n
```

**To switch the active window to the previous group:**
```bash
/home/matias/.scripts/qtile_window_to_group_and_switch.py -p
```

You can also assign these commands to keybindings in your Qtile configuration file.

---

> [!TIP] 
One potential improvement for this script would be to add error handling for cases where no arguments are passed. Currently, invoking the script without arguments results in an uncaught exception. Also, consider making the number of groups more dynamic by retrieving it from the configuration instead of hardcoding the value. This will enhance its reusability in different setups with varying group configurations.