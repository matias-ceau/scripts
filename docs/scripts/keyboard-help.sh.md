# Keyboard Help Script

---

**keyboard-help.sh**: Launches a terminal displaying the current keyboard layout.

---

### Dependencies

- `show_keyboard_layout.py`: A script that outputs the current keyboard layout. Make sure it's located in your PATH.
- `bat`: A cat clone with syntax highlighting and Git integration. It enhances the output formatting in the terminal.
- `xterm`: A terminal emulator for the X Window System, necessary to launch the script in a window.

### Description

The `keyboard-help.sh` script serves as a convenient utility for Arch Linux users utilizing the Qtile window manager to quickly reference the current keyboard layout. This is particularly useful when switching between multiple layouts or languages. 

When executed, the script performs the following actions:
1. It uses the `which` command to locate the `show_keyboard_layout.py` script, ensuring that the script exists and is executable.
2. It uses `setsid` to start a new session and launch `xterm`. Inside this terminal, it runs the keyboard layout script and pipes the output to `bat`, which formats it aesthetically for better readability.

Here’s how the key command works:
```bash
"$keyboard_script | bat --paging=always --style=plain"
```
The `bat` command displays the output from `show_keyboard_layout.py` with paging support, making it easier for you to read through long outputs.

### Usage

To use the `keyboard-help.sh` script:
1. Ensure that both `show_keyboard_layout.py` and `bat` are installed on your system.
2. Make the script executable:
   ```bash
   chmod +x /home/matias/.scripts/keyboard-help.sh
   ```

3. Run the script from a terminal or bind it to a key in your Qtile configuration. For example, you can start it from a terminal by executing:
   ```bash
   /home/matias/.scripts/keyboard-help.sh
   ```

Alternatively, add a keybinding in your `config.py` for Qtile to run this script quickly.

---

> [!TIP]  
> Consider adding error handling in your script to check if the dependencies are installed before attempting to execute the commands. For instance, you could check if `show_keyboard_layout.py` and `bat` exist and provide user-friendly messages if they do not.