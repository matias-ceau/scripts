# Keyboard Layout Helper

---

**keyboard-help.sh**: Launches a terminal to display current keyboard layout using `bat`.

---

### Dependencies

- `show_keyboard_layout.py`: A Python script that outputs the current keyboard layout. Make sure it is executable and accessible in your `PATH`.
- `bat`: A clone of `cat` that provides syntax highlighting and Git integration to improve terminal output appearance. Install it using your package manager.

### Description

The `keyboard-help.sh` script serves as a helper tool to quickly display the current keyboard layout in a terminal window. It executes the `show_keyboard_layout.py` script and pipes its output to `bat`, which formats the output nicely for better readability.

Upon execution, the script opens a new terminal window (using `xterm`) with the title "KB_layout_floating" and a font size of 20. The layout information is continuously displayed with paging capability enabled, allowing the user to scroll through the output easily.

The main components of the script include:

- `which show_keyboard_layout.py`: Locates the absolute path of the `show_keyboard_layout.py` script.
- `setsid xterm ...`: Starts `xterm` in a new session to prevent it from being affected by the current shell’s job control.
- `bash -c "$keyboard_script | bat --paging=always --style=plain"`: Executes the keyboard layout script and pipes its output to `bat` for enhanced presentation.

### Usage

To use the script, simply execute it from the terminal:

```bash
bash /home/matias/.scripts/keyboard-help.sh
```

Alternatively, you could bind it to a keyboard shortcut in your Window Manager (like qtile) for quick access. 

For example, in your `~/.config/qtile/config.py`, you can add a key binding like:

```python
Key([mod], "k", lazy.spawn("/home/matias/.scripts/keyboard-help.sh")),
```

This will allow you to press `mod + k` to bring up the keyboard layout display.

---

> [!TIP]  
> Consider enhancing the script by allowing the user to specify the terminal type or size through command-line arguments. This would make it more flexible and user-friendly. Additionally, you may want to handle cases where `show_keyboard_layout.py` fails to execute, providing users with an error message.