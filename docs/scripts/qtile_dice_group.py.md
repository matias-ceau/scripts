# Qtile Dice Group Script

---

**qtile_dice_group.py**: Switches to the complementary group in Qtile dynamically.

---

### Dependencies

- `libqtile`: This is the core library used for configuring and interacting with the Qtile window manager. Make sure it is installed to use this script.

### Description

This script is designed to work with the Qtile window manager, providing a quick way to switch between complementary groups. The concept of groups in Qtile allows users to organize their windows based on type or purpose, and with this script, you can easily toggle between two groups based on their numerical indices.

Here's how the script works:

1. It initializes an `InteractiveCommandClient`, which allows for communication with the Qtile's command interface.
2. It retrieves the current group's index as an integer from the group information.
3. It calculates the complementary group index by subtracting the current group index from 7 (assuming you have groups indexed from 0 to 6).
4. Finally, it switches focus to the complementary group using the `toscreen()` method.

### Usage

To use this script:
1. Ensure it's executable:  
   ```bash
   chmod +x /home/matias/.scripts/qtile_dice_group.py
   ```

2. Bind it to a key in your `~/.config/qtile/config.py` file:
   ```python
   Key([mod], "d", lazy.spawn("/home/matias/.scripts/qtile_dice_group.py")),
   ```

3. Alternatively, run it directly in a terminal:
   ```bash
   /home/matias/.scripts/qtile_dice_group.py
   ```

This will switch your current focus to the complementary group when invoked.

---

> [!TIP]  
> Consider adding error handling for scenarios where the current group is not between 0 and 6, which could lead to an `IndexError` when trying to access `c.group[str(complementary)]`. A simple check or exception handling could enhance the robustness of your script.