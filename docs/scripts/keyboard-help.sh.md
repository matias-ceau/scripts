# Keyboard Layout Help Script

---

**keyboard-help.sh**: Launches a floating terminal displaying keyboard layout information

---

### Dependencies

- `show_keyboard_layout.py`: A script that provides keyboard layout information.
- `xterm`: Terminal emulator for the X Window System.
- `bat`: A cat clone with syntax highlighting and Git integration.
- `setsid`: Utility used to run a program in a new session.

### Description

The **keyboard-help.sh** script is designed for users who need to quickly access their keyboard layout configuration. It achieves this by launching a floating XTerm window that executes the `show_keyboard_layout.py` script. The output of this Python script is then piped into `bat` for better readability, featuring paging and a plain style.

- `which show_keyboard_layout.py`: Locates the path to `show_keyboard_layout.py`.
- `setsid`: Ensures that `xterm` runs in a new session.
- `xterm -T KB_layout_floating -fs 20`: Opens xterm with a title "KB_layout_floating" and font size set to 20.
- `bat --paging=always --style=plain`: Displays the output of the keyboard layout script with paging always enabled and style set to plain.

### Usage

To use this script, you can execute it directly from the terminal. It does not require any command-line arguments and can be mapped to a keybinding for ease of access, or run automatically on certain events in your qtile configuration.

```bash
bash ~/home/matias/.scripts/keyboard-help.sh
```

For binding to a key in qtile, you might use a snippet such as:

```python
Key([mod], "k", lazy.spawn("/home/matias/.scripts/keyboard-help.sh")),
```

This would open the keyboard layout helper using the mod+k key combination.

---

> [!TIP]
> The script assumes `show_keyboard_layout.py` is executable and in your PATH. Ensure proper permissions and PATH settings to avoid runtime errors. Additionally, consider adding error handling to check if dependencies are available and handle the absence gracefully to improve the script's robustness.