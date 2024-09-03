# Qtile Dice Group

---

**qtile_dice_group.py**: Switches to a complementary group in Qtile.

---

### Dependencies

- `libqtile`: The core library for managing and interacting with the Qtile window manager. This library must be properly installed for the script to function.

### Description

The `qtile_dice_group.py` script provides an easy way to switch between groups in the Qtile window manager. It leverages the `libqtile.command.client` module to interact with the Qtile environment.

When executed, the script performs the following actions:

1. It creates an instance of `InteractiveCommandClient`, which allows sending commands to the running instance of Qtile.
2. It retrieves the current group being displayed by querying its information.
3. The script assumes that the user has a total of 7 groups (numbered from 0 to 6).
4. It calculates the complementary group by subtracting the current group number from 7.
5. Finally, it switches to the complementary group using `toscreen()` method.

This can be particularly useful for users who wish to toggle between two sets of workspaces efficiently.

### Usage

To use the script, you must ensure it's executable and invoke it from the terminal or assign it to a key binding within your Qtile configuration.

1. **Make the script executable**:
   ```bash
   chmod +x /home/matias/.scripts/qtile_dice_group.py
   ```

2. **Run the script directly**:
   ```bash
   /home/matias/.scripts/qtile_dice_group.py
   ```
   
3. **Assign to a key binding** in your `config.py` for Qtile:
   ```python
   Key([mod], "d", lazy.spawn("/home/matias/.scripts/qtile_dice_group.py")),
   ```
   
This configuration allows you to press `mod + d` to quickly switch to the complementary group.

---

> [!TIP]  
> This script assumes that the total number of groups is set to 7. If your configuration has a different number of groups, such as 8 or 6, you'll want to modify the calculation for `complementary` to reflect that. Consider enhancing this script to make the number of groups configurable. Also, adding error handling would improve robustness, especially when querying the current group.
