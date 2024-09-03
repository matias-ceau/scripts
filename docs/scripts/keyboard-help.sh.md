# Keyboard Help Script

---

**keyboard-help.sh**: Launches an xterm window displaying the current keyboard layout.

---

### Dependencies

- `show_keyboard_layout.py`: A user script that fetches the current keyboard layout.
- `bat`: A cat clone with syntax highlighting and file preview features, useful for displaying the output in a more readable format.
- `xterm`: A terminal emulator for the X Window System, required to run the script in a separate terminal session.

### Description

The `keyboard-help.sh` script is designed to provide users with an easy way to view their current keyboard layout in a separate terminal window. When executed, the script performs the following steps:

1. **Identifies the script location**: It uses `which` to find the path of `show_keyboard_layout.py`, which is responsible for retrieving the current keyboard layout.

2. **Opens xterm**: It uses the `setsid` command to start a new session and launch `xterm`. The terminal is titled "floating", has a font size of 20, and runs the command to display the keyboard layout.

3. **Output rendering**: The output from `show_keyboard_layout.py` is piped to `bat`, which enhances the readability with paging and style formatting.

The decision to use `bat` for displaying the layout is particularly useful for verbose layouts, allowing the user to scroll through without clutter.

### Usage

To use the script, simply execute it from your terminal. It can be run interactively or mapped to a keybinding in your window manager (Qtile). 

You can execute the script with the following command:

```bash
bash /home/matias/.scripts/keyboard-help.sh
```

If you'd like to set it in your Qtile configuration for easy access, you can add a keybinding in your `config.py` like this:

```python
Key([mod], "h", lazy.spawn("/home/matias/.scripts/keyboard-help.sh")),
```

When triggered, this will open the xterm window displaying the current keyboard layout.

---

> [!TIP]  
> Consider adding error handling to check if `show_keyboard_layout.py` is available or if `bat` is installed. This could enhance the user experience by providing clear feedback rather than failing silently. Additionally, if the `xterm` window is closed, the layout command should terminate gracefully.