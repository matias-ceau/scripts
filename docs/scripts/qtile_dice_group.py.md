# Qtile Dice Group Switcher

---

**qtile_dice_group.py**: Switches to the complementary group in Qtile, based on a dice concept

---

### Dependencies

- `qtile`: This script specifically uses the Qtile window manager's Python API to interact with workspaces.
- `libqtile.command.client.InteractiveCommandClient`: A Qtile API module used for interacting with, and sending commands to, Qtile.

### Description

The `qtile_dice_group.py` script is a utility for the Qtile window manager that allows users to quickly switch between workspace groups like a die. In the context of this script, think of each workspace as a side of a 6-sided die. Each time the script is executed, it computes the "complementary" workspace on this "die". For example, if you're on workspace 1, the complementary workspace is 6 (since 7 - 1 = 6), making the total "7", similar to the sum of opposite sides on a standard die.

This script uses Qtile's `InteractiveCommandClient` to access the current group information and change to the complementary group.

### Usage

To use the `qtile_dice_group.py` script, ensure it is executable:

```bash
chmod +x /home/matias/.scripts/qtile_dice_group.py
```

You can bind this script to a key within your Qtile configuration to quickly switch to the complementary group. For example, to bind the script to a key combination, you could add something like the following to your Qtile config:

```python
Key([mod], "g", lazy.spawn("/home/matias/.scripts/qtile_dice_group.py")),
```

Replace `[mod]` with your modifier key (e.g., `mod4` for the Super/Windows key).

To run the script manually from the terminal, simply execute:

```bash
python /home/matias/.scripts/qtile_dice_group.py
```

This assumes you are running this script in an environment where the correct Python and Qtile installations are present.

---

> [!TIP]
> This script offers a unique way to switch between workspace groups, but it is limited to the concept of "complementary groups", meaning it only works effectively if you have exactly 6 groups set up in your Qtile configuration. If you have more or fewer groups, the logic will need adjustment to ensure correct functionality.