# Dice Group Switcher for Qtile

---

**qtile_dice_group.py**: Swiftly switches between complementary screen groups in Qtile.

---

### Dependencies

- `libqtile.command.client`: Integral to interacting with Qtile's command interface.

### Description

The script `qtile_dice_group.py` is designed for use within the Qtile window manager on Arch Linux. It aims to provide an efficient mechanism for switching between two complementary workspace groups by treating them like opposite sides on a die. 

Here's how it functions:
- **InteractiveCommandClient** from `libqtile` is initialized to communicate with Qtile's command system.
- The script retrieves the current group number using `group.info()["name"]`.
- It calculates a 'complementary' group number based on the die complement of 7, which assumes that groups are numbered from 0 to 6.
- It then switches the active screen to the complementary group using `toscreen()`.

This approach presupposes an understanding of Qtile’s grouping conventions and assumes that your groups are named numerically from 0 to 6.

### Usage

To use this script:

- Ensure it's executable and ideally place it within your Qtile configuration.
- Assign it to a keybinding within your Qtile config file, often found at `~/.config/qtile/config.py`. Example keybinding:

  ```python
  Key([mod], "d", lazy.spawn("python /home/matias/.scripts/bin/qtile_dice_group.py")),
  ```

  This binds `mod + d` to execute the script, swiftly changing between complementary groups.

---

> [!TIP] 
> This script assumes a fixed number of groups (7), which might not align with every Qtile setup. Consider adding error handling for group indices that exceed available groups, or fetching the total number of groups dynamically.