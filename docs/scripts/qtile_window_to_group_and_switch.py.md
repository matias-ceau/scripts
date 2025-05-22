# Move Focused Window to Next/Previous Group and Switch — qtile_window_to_group_and_switch.py

---

**qtile_window_to_group_and_switch.py**: Moves the current focused window to the next or previous qtile group and switches focus to that group

---

### Dependencies

- `python` (any version with qtile support)
- `libqtile.command.client.InteractiveCommandClient`  
  Used for communicating with the running qtile instance to manipulate windows and groups.
- `notify-send`  
  For graphical feedback in case of command misuse.

### Description

This script is designed to be used with the qtile window manager on your Arch Linux system. It allows quick reassignment of the currently-focused window to another group, either the next (`-n`) or previous (`-p`), with an automatic switch to that group. The script uses `InteractiveCommandClient` to interface with the active qtile instance.

Logic summary:

- Checks command-line argument (`-n` for next, `-p` for previous).
- Determines current group index from qtile.
- Calculates the target group, cycling through 6 groups (uses modular arithmetic).
- Moves the window to the target group and switches to it.
- On wrong arguments, sends a critical notification using `notify-send`.

Groups are numbered 1 through 6. The script wraps around: moving forward from group 6 brings you to group 1, and moving backward from group 1 brings you to group 6.

### Usage

Run directly from your terminal, or (more likely) bind to key combinations in your qtile config as an efficient window management shortcut.

**Terminal invocation examples:**

```sh
~/.scripts/bin/qtile_window_to_group_and_switch.py -n   # Move to next group
~/.scripts/bin/qtile_window_to_group_and_switch.py -p   # Move to previous group
```

**Typical qtile keybinding:**

```python
Key([mod, "shift"], "period", lazy.spawn("~/.scripts/bin/qtile_window_to_group_and_switch.py -n")),
Key([mod, "shift"], "comma", lazy.spawn("~/.scripts/bin/qtile_window_to_group_and_switch.py -p")),
```

**Error handling:**  
If called with incorrect arguments, you'll get a critical urgency notification via `notify-send`, e.g.:

> Problem running /home/matias/.scripts/bin/qtile_window_to_group_and_switch.py

---

> [!TIP]
> - The "6" in `current % 6 + 1` is hardcoded, so if you ever change the number of groups, this must be updated manually in the script.
> - No argument validation for missing or extra arguments: running without arguments or with invalid ones will cause an unhandled index error.
> - Consider adding a `try/except` block to gracefully handle missing argument cases (e.g., via `argparse` or manual checks).
> - If you use group names not strictly numbered "1" to "6", this will break. Either generalize the logic to get all groups from qtile dynamically, or maintain group numbers.
> - For larger configs, extracting group count directly from qtile's state would make this more robust.