# Move focused window to next/prev group and follow

---

**qtile_window_to_group_and_switch.py**: Move focused window to adjacent qtile group and switch to it

---

### Dependencies

- `python` (shebang: `/usr/bin/python`)
- `qtile` (provides `libqtile.command.client.InteractiveCommandClient`)
- `notify-send` (from `libnotify`, used for error notifications)

### Description

This script is a small helper meant for your qtile workflow on Arch Linux: it takes the currently focused window and sends it to another group, *then switches your view to that group*.

It uses qtile’s IPC command interface via `InteractiveCommandClient()`, then:

- Reads the current group index from `c.screen[0].items("group")`
- Computes a target group in a fixed set of **6 groups** (numbered `1..6`)
  - `-n` → next group (wraps: 6 → 1)
  - `-p` → previous group (wraps: 1 → 6)
- Calls `c.window.togroup(str(target), switch_group=True)` to both move the window and follow it.

If the first CLI argument is not `-n` or `-p`, it sends a critical desktop notification via `notify-send`.

### Usage

Run from a terminal, or more typically bind it in qtile (recommended).

tldr:

- Move focused window to next group and switch:
  - `qtile_window_to_group_and_switch.py -n`
- Move focused window to previous group and switch:
  - `qtile_window_to_group_and_switch.py -p`

Example qtile keybindings:

- `mod + shift + l` → next group:
  - `lazy.spawn("~/.scripts/bin/qtile_window_to_group_and_switch.py -n")`
- `mod + shift + h` → previous group:
  - `lazy.spawn("~/.scripts/bin/qtile_window_to_group_and_switch.py -p")`

---

> [!TIP]
> Improvements to consider:
> - Guard against missing arguments (`sys.argv[1]` will crash if none is provided). A usage message + nonzero exit code would be cleaner.
> - The group discovery is brittle: `items("group")[-1][0]` assumes ordering and numeric names. If you rename groups or have >6, this will misbehave. Consider using `c.group.info()` / `c.groups()` and derive the current group name directly.
> - Hardcoding “6 groups” is limiting; you could compute the list of available groups and wrap over its length.
> - The error path only triggers for “wrong flag”, not for IPC failures; wrapping the main logic in `try/except` and notifying on exceptions would help.