# Show Keyboard Layout

---

**show_keyboard_layout.py**: A simple script displaying a text representation of a keyboard layout.

---

### Dependencies

This script does not have any external dependencies. It relies solely on Python's standard library.

### Description

The `show_keyboard_layout.py` script is designed to present a visual representation of a keyboard layout in a terminal. The layout is defined using a multiline raw string, which maintains the formatting of the characters in a grid-like structure.

The keyboard layout includes various keys with accompanying symbols, showcasing the diverse characters available on a standard keyboard. The layout is represented as ASCII art, ensuring that it is displayed cleanly in most terminal environments.

The script uses `print()` to output the keyboard layout directly to the console when executed. It serves as a convenient reference for users who may want to visualize their keyboard layout at any time.

### Usage

To use the script, simply run it from a terminal. Ensure that you have Python installed on your system. You can execute the script using the following command:

```bash
python /home/matias/.scripts/show_keyboard_layout.py
```

This will immediately print the keyboard layout in the terminal for your reference.

You may also bind this script to a key combination using a window manager like Qtile to easily visualize the keyboard layout at any time.

---

> [!TIP]  
> Consider extending the script to support multiple keyboard layouts. This can enhance its usability by providing users with the ability to view different layouts on the fly, which would be particularly useful for those who switch between layouts frequently. Additionally, you might include command-line arguments to specify which layout to print.