# Show Keyboard Layout

---

**show_keyboard_layout.py**: Simple script to display a custom keyboard layout design

---

### Dependencies

This script does not require any external dependencies. It simply uses Python's built-in `print` function to display a predefined keyboard layout in the terminal.

### Description

The `show_keyboard_layout.py` script is designed to visually represent a custom keyboard layout when executed. It uses a multi-line string to store an ASCII art representation of a keyboard, including a variety of symbols and accentuated characters. This layout is printed to the terminal when the script runs, allowing the user to quickly view the layout design.

The script highlights several characters and symbols, indicating their positions on the keyboard, possibly reflecting a personalized setup. This might be useful for those working with different languages or custom layouts that standard keyboards don't adequately support.

### Usage

To use the script, simply run it from a terminal. It does not accept any command-line arguments and operates independently:

```bash
python /home/matias/.scripts/bin/show_keyboard_layout.py
```

You can assign this script to a keybinding using your window manager configuration (Qtile in your case) for quick access. This can be useful if you need frequent reminders of your custom keyboard layout.

```bash
# Example keybinding in Qtile configuration for running the script:
Key([mod], "k", lazy.spawn("python /home/matias/.scripts/bin/show_keyboard_layout.py")),
```

---

> [!TIP]
> The script is straightforward but could be extended with features such as dynamically showing the layout based on system settings or user preferences. Additionally, consider adding command-line options for different layouts or better integration into your workflow.