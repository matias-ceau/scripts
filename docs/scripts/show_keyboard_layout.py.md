# Display Keyboard Layout Script

---

**show_keyboard_layout.py**: A script to display a visual representation of a keyboard layout in the terminal.

---

### Dependencies

None.

### Description

The script `show_keyboard_layout.py` is a simple Python script designed to display a representation of a keyboard layout directly in the terminal. The layout is hardcoded into the script as an ASCII art diagram, illustrating the positions of various characters and symbols on a typical keyboard. This can be particularly useful for users who frequently switch between keyboard layouts and need a quick visual reference for key positions.

The implementation utilizes multi-line string literals in Python, denoted by triple quotes (`"""`). It then prints this layout directly to the terminal using Python's built-in `print()` function. 

### Usage

To run the script, you can execute it directly from a terminal. No special permissions are required, and it can be run in a terminal emulator. Here's how to use it:

```bash
python /home/matias/.scripts/show_keyboard_layout.py
```

This command will output the keyboard layout to your terminal window. This script could also be mapped to a key combination within your qtile configuration for quick access, using a command like the following in your qtile keybindings:

```python
Key([mod], "k", lazy.spawn("python /home/matias/.scripts/show_keyboard_layout.py")),
```

---

> [!IMPORTANT]
> This script could be enhanced by dynamically determining the current keyboard layout using utilities such as `xkblayout-state` to show the currently active layout. Additionally, wrapping the layout in a function would make future expansions or modular inclusion into other scripts much easier.