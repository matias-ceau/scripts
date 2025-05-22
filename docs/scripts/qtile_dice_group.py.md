# qtile_dice_group: Quick Switch to Complementary Qtile Group

---

**qtile_dice_group.py**: Instantly switches to the workspace ("group") with a number summing to 7 with the current one.

---

### Dependencies

- `python`  
  Standard Python 3 interpreter.

- `libqtile.command.client.InteractiveCommandClient`  
  Qtile's IPC client for issuing commands to the running window manager instance.

- Qtile must be running as your window manager.

### Description

This script provides a unique and fast way of jumping between two "complementary" numbered workspaces (Qtile calls them "groups") whose labels are integers. The complement is defined by the equation:  
> **complement = 7 - current_group_number**

For example, if you are currently on group `1`, running this script will take you to group `6` (because 1 + 6 = 7). Works best if you use six number-labeled groups (e.g. 1-6).

#### How it Works

1. Gets the current active group's name (assumes it's an integer in string form).
2. Computes the complementary group number as `7 - <current group number>`.
3. Switches to the complementary group using Qtile's command interface, with no need for restarting Qtile or logging out.

This setup is particularly useful for quickly toggling between pairs of workspaces, for example, focusing on two related tasks and switching context instantly.

### Usage

Usually, you will want to bind this script to a key in Qtile's configuration or execute it in your terminal:

```
$ python /home/matias/.scripts/bin/qtile_dice_group.py
```

#### Keybinding Example (`~/.config/qtile/config.py`):

```python
Key([mod], "F12", lazy.spawn("python /home/matias/.scripts/bin/qtile_dice_group.py")),
```

You can trigger this key to hop to the paired workspace instantly.  
No arguments or further configuration required, as long as your group names are numerically labeled.

---

> [!TIP]
> - **Assumptions & Limitations**: The script strictly assumes that the group names are digits (`1` through `6` or more). If you're on a group whose name isn't an integer, it will crash with a `ValueError`.
> - It does not check whether the computed complementary group exists, so if you don't consistently maintain your group numbering/names, nothing will happen or you may get an error.
> - Consider wrapping the group lookup and switching in a `try-except` block for robustness.  
> - You might want to parameterize the `7` to allow flexibility if you use a different number of groups.  
> - No feedback or logging is provided on failure/success — adding some notification might improve UX.