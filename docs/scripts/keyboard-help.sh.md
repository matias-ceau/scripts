# Keyboard Layout Helper

---

**keyboard-help.sh**: Displays keyboard layout using a Python script in a floating terminal

---

### Dependencies

- `show_keyboard_layout.py`: A Python script to display the keyboard layout.
- `xterm`: A terminal emulator for the X Window System.
- `bat`: A cat clone with syntax highlighting and Git integration.
- `setsid`: Utility to run a program in a new session.

### Description

This script is designed for Arch Linux users utilizing the qtile window manager to help display their current keyboard layout. It uses a previously defined Python script `show_keyboard_layout.py` which is supposed to generate the layout information. The script opens this information in a floating `xterm` window with the title `KB_layout_floating` and a font size of 20. The `bat` command is used to provide nice syntax highlighting and paging. The whole command is wrapped in a `setsid` call to ensure it runs in a separate process, detaching it from the current terminal.

### Usage

This script can be run directly from the terminal or bound to a keybinding in qtile for quick access. Here’s an example of how you might use it:

```bash
~/.scripts/bin/keyboard-help.sh
```

To bind it to a key in qtile, include a similar keybinding in your qtile configuration:

```python
Key([mod], "k", lazy.spawn("~/.scripts/bin/keyboard-help.sh")),
```

This binds the Mod key and 'k' to running the script.

---

> [!TIP]
> Ensure that the `show_keyboard_layout.py` script is executable and correctly returns the desired keyboard layout. Additionally, consider whether `bat` is necessary if paging output isn't required; using plain `cat` may simplify the script. If `xterm` customization is extensive, you could directly specify any needed xterm configurations in the script rather than relying only on command line options.