# Show Keyboard Layout

---

**show_keyboard_layout.py**: Displays a visual representation of the keyboard layout in terminal.

---

### Dependencies

- `python`: This script is written in Python and requires a compatible Python interpreter to run.

### Description

The `show_keyboard_layout.py` script is a simple Python program designed to output the visual representation of a keyboard layout directly in the terminal. The layout is hardcoded in ASCII art format, showing the arrangement of keys in a clear and structured manner. 

The keyboard layout includes:
- Standard keys such as numbers, letters, function keys, and modifiers.
- Special characters and symbols that are typically found on a keyboard.
- Use of multi-line string (`r""" ... """`) for easy formatting and readability of the layout.

When you run this script, it prints the keyboard layout to your terminal, allowing you to visualize key positions and associated characters.

### Usage

To use the script, make sure you have Python installed. You can run this script directly from the terminal. Here’s how to execute the script:

```bash
python /home/matias/.scripts/show_keyboard_layout.py
```

This command will display the keyboard layout as defined in the script. You can also customize how you want to execute this script by binding it to a key in your window manager or running it as a part of a startup script if you want to have quick access to the keyboard layout.

---

> [!TIP]  
> Consider adding command-line arguments to allow users to select different keyboard layouts. It could enhance the script's usability greatly, especially in multi-language environments. Additionally, error handling can be implemented to manage potential issues when executing the script. For instance, checking if a proper Python interpreter is available before proceeding.