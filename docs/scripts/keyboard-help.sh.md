# Keyboard Layout Help

---

**keyboard-help.sh**: Launches an xterm to display the current keyboard layout.

---

### Dependencies

- `show_keyboard_layout.py`: A script to retrieve the current keyboard layout.
- `xterm`: A terminal emulator for the X Window System, used to display the output.
- `bat`: A cat clone with syntax highlighting and Git integration, used to enhance the output display.

### Description

The `keyboard-help.sh` script is a simple utility designed for users who need quick access to their current keyboard layout while using the Qtile window manager on Arch Linux. This script utilizes `show_keyboard_layout.py` to fetch the active keyboard layout and displays it in a new xterm window, formatted neatly with `bat`.

Here’s a breakdown of its core functionality:

- The script uses `which` to locate the `show_keyboard_layout.py` script, ensuring that the current script has the correct path to execute it.
- It then runs `setsid` to start a new session, preventing the xterm from being affected by the terminal that launched it.
- The `xterm` command creates a new terminal window with a title "KB_layout_floating", a font size of 20, and executes the keyboard layout retrieval script. 
- The output is piped to `bat`, which provides paging (`--paging=always`) and ensures the output is displayed in a clear and user-friendly format.

### Usage

To use the `keyboard-help.sh` script, simply execute it from your terminal or bind it to a key in your Qtile configuration file. To run it directly in the terminal, use the following command:

```bash
bash /home/matias/.scripts/keyboard-help.sh
```

Alternatively, you can assign it to a Qtile keybinding by adding the following line to your `config.py`:

```python
Key([mod], "h", lazy.spawn("/home/matias/.scripts/keyboard-help.sh")),
```

This binding will allow you to open the keyboard layout display quickly by pressing `mod + h`.

---

> [!TIP]  
> Consider adding error handling in your script to manage cases where `show_keyboard_layout.py` might not exist or return an unexpected result. This will improve usability and provide clearer feedback to the user. Additionally, you may want to allow users to configure the size and title of the xterm through command-line arguments for greater flexibility.