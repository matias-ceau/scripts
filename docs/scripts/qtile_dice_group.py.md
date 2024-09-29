# Qtile Dice Group Switching

---

**qtile_dice_group.py**: Switches to the complementary group in Qtile based on the current group number.

---

### Dependencies

- `libqtile`: This is the main library for the Qtile window manager, allowing for interaction with window groups and other functionalities.

### Description

The `qtile_dice_group.py` script provides a simple way to switch groups in the Qtile window manager. When executed, it retrieves the current window group number, computes the complementary group (assuming a total of 7 groups, labeled 0-6), and switches to that group. This is particularly useful for users who have a set of predefined groups and want to quickly toggle between complementary ones for efficiency.

Here's a breakdown of the main components of the script:

- **InteractiveCommandClient**: The script uses this component from the `libqtile.command.client` module to communicate with the Qtile window manager.
- **Group Info Retrieval**: The current group number is fetched using `c.group.info()`, and its name, which is expected to be an integer, is converted to an integer for calculations.
- **Complementary Group Calculation**: The script computes the complementary group using a simple formula: `7 - current_group`. This assumes there are 7 groups (indexed from 0 to 6).
- **Switching Groups**: Finally, the script invokes `toscreen()` on the calculated complementary group to activate it.

### Usage

To use this script, simply execute it from a terminal within your Qtile environment. Here’s a quick guide:

1. **Make sure the script is executable**:
   ```bash
   chmod +x /home/matias/.scripts/qtile_dice_group.py
   ```

2. **Run the script**:
   ```bash
   /home/matias/.scripts/qtile_dice_group.py
   ```

You could also bind this script to a key combination in your Qtile configuration to allow quick toggling between groups, for example:

```python
Key([mod], "d", lazy.spawn("python3 /home/matias/.scripts/qtile_dice_group.py")),
```

---

> [!TIP]  
> Consider adding error handling for cases where the current group might not be within the expected range, or if there are fewer than 7 groups configured. This could prevent potential runtime errors and improve user experience.