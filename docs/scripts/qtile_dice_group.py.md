# Qtile Dice Group Switcher

---

**qtile_dice_group.py**: A script to switch between Qtile groups using a complementary number.

---

### Dependencies

- `libqtile`: This is the primary library for interacting with the Qtile window manager. It allows communication with the Qtile instance and managing window groups.

### Description

This script provides a simple utility for users of the Qtile window manager to switch between groups in a unique way. The concept is based on complementary numbering. In a typical layout with 7 groups, the script will switch the current group (defined by a number from 0 to 6) to its complementary group:

- If the current group is 0, it switches to 7 (which wraps around to 0).
- If the current group is 1, it switches to 6.
- If the current group is 2, it switches to 5.
- If the current group is 3, it switches to 4.

Essentially, this results in toggling between pairs of groups based on their arrangement. The script utilizes the `InteractiveCommandClient` from the `libqtile.command.client` module to perform these actions.

### Usage

To use this script, you need to have it executable and properly configured in your Qtile setup. You can run it manually from a terminal or assign it to a keybinding for quick access. 

1. **Make the script executable**:
   ```bash
   chmod +x /home/matias/.scripts/qtile_dice_group.py
   ```
   
2. **Run the script directly**:
   ```bash
   /home/matias/.scripts/qtile_dice_group.py
   ```

3. **Assign to a keybinding** in your `~/.config/qtile/config.py`:
   ```python
   Key([mod], 'd', lazy.spawn('/home/matias/.scripts/qtile_dice_group.py')),
   ```

This will allow you to switch groups by pressing the defined key combination (e.g., `mod + d`).

---

> [!TIP]  
> This script assumes there are always 7 groups defined. If there are fewer, the complementary logic could lead to errors or unexpected behaviour. Consider adding checks to ensure the current group is within the range of defined groups and providing an error message if it is not.