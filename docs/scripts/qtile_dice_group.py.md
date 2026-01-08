# Qtile Dice Group Switcher

---

**qtile_dice_group.py**: Switch to the complementary group (dice sum to 7) in Qtile

---

### Dependencies

- `python`
- `qtile` (specifically `libqtile.command.client.InteractiveCommandClient`)

### Description

This small helper targets a very specific Qtile workflow: when your groups are named like dice faces (`"1"` through `"6"`), it jumps from the current group to its “complementary” group such that both add up to 7:

- from group `1` → `6`
- `2` → `5`
- `3` → `4`
- `4` → `3`
- `5` → `2`
- `6` → `1`

It does this by connecting to the running Qtile instance via `InteractiveCommandClient()`, reading the current group name through `c.group.info()["name"]`, converting it to an integer, and computing `complementary = 7 - current_group`. Finally, it focuses that target group with `c.group[str(complementary)].toscreen()`.

This is ideal for a qtile setup on Arch Linux where you keep 6 numeric groups and want a fast “mirror” jump across them.

### Usage

Run it from a terminal, or (more commonly) bind it in your Qtile config.

tldr:

- Run manually:
  - `~/.scripts/bin/qtile_dice_group.py`

- Example Qtile keybinding:
  - `Key([mod], "d", lazy.spawn("~/.scripts/bin/qtile_dice_group.py"), desc="Switch to complementary dice group")`

Notes:
- The script assumes your current group name is a number.
- It also assumes complementary groups exist (1–6).

---

> [!TIP]
> The script will crash if the current group name isn’t numeric (e.g., `"web"`) or if it’s outside `1..6`. Consider adding validation and a graceful fallback (no-op or notification). Also, `#!/usr/bin/python` can be brittle on Arch; `#!/usr/bin/env python` is usually safer. If you ever use multiple screens, you may want to ensure `toscreen()` targets the correct screen explicitly (e.g., `toscreen(screen=...)`).