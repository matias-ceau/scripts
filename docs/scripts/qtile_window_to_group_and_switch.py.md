# qtile_window_to_group_and_switch.py

---

**qtile_window_to_group_and_switch.py**: Move the current window to the next or previous group and switch to it.

---

### Dependencies

- `libqtile`: The script interacts with qtile through the `InteractiveCommandClient`.
- `notify-send`: Used for sending notifications in case of an error.

### Description

This script enhances your qtile window manager experience by providing shortcuts to move the current active window to the next or previous group. It utilizes the `InteractiveCommandClient` from the `libqtile.command.client` module to interact with qtile's commands and gather information about the current focused group.

- **Flow of Execution**:
  1. **Parsing Arguments**: The script checks the first command-line argument. It accepts either `-n` (next group) or `-p` (previous group).
  2. **Identify Current Group**: It retrieves the index of the current group the active window belongs to.
  3. **Calculate Target Group**: 
     - For `-n`, it increments the group index, rolling over to 1 after the last group.
     - For `-p`, it decrements the index, rolling over to the last group when reaching before the first.
  4. **Move and Switch**: The active window is moved to the target group, and also switches the view to this group.
  5. **Error Handling**: If any command besides `-n` or `-p` is provided, a notification is issued.

### Usage

You can execute the script from the terminal with either of the options:

```bash
python /home/matias/.scripts/bin/qtile_window_to_group_and_switch.py -n  # Move to the next group
python /home/matias/.scripts/bin/qtile_window_to_group_and_switch.py -p  # Move to the previous group
```

This script can be bound to keyboard shortcuts in your qtile configuration to facilitate rapid window management.

---

> [!NOTE]
> Currently, the script assumes the existence of exactly six groups (1 to 6). If your qtile configuration has a different number of groups, you should adjust the modulo operation accordingly. Additional error handling could be implemented to gracefully handle cases where the script is run with no arguments or invalid options.