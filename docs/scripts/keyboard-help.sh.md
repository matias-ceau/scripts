# Keyboard Layout Helper

---

**keyboard-help.sh**: Displays keyboard layout help in a floating terminal with syntax highlighting

---

### Dependencies

- `show_keyboard_layout.py` — Script providing a list or visual of the system's keyboard layout(s).
- `xterm` — Terminal emulator used to display the output.
- `setsid` — Utility to run a command in a new session.
- `bat` — A `cat` clone with syntax highlighting and paging, improves readability.
- `bash` — The shell used to execute the command.

---

### Description

This script is designed to quickly display your keyboard layout documentation in a floating terminal window—making it useful for reference or learning custom keybindings. Here’s how it works step by step:

1. **Finds the Keyboard Script:**  
   It locates `show_keyboard_layout.py` with `which` to ensure it picks the correct script file.

2. **Floating Terminal**:  
   It then runs the script in `xterm`, forcing a custom title (`KB_layout_floating`) and a large 20-point font for clarity.  
   The `setsid` command ensures the terminal is launched as an independent session (preventing it from being closed if the calling session closes).

3. **Syntax Highlighting with `bat`:**  
   Output from your keyboard layout script is piped into `bat`, turning the terminal window into a scrollable, well-formatted display.

---

### Usage

You can run this script directly from the command line or map it to a keybinding in qtile for quick access.

**Command-line:**
```
~/.scripts/bin/keyboard-help.sh
```

**Qtile keybinding example (in your `config.py`):**
```python
Key([mod], "F1", lazy.spawn("~/.scripts/bin/keyboard-help.sh"))
```
> Replace `[mod]` with your mod key (e.g., "mod4" for the Super/Windows key).

**What you'll see:**  
A floating `xterm` window titled `KB_layout_floating` that displays your current keyboard layout in a readable, scrollable format.  
Use arrow keys to scroll, `q` to quit (`bat`'s navigation).

---

> [!TIP]
> 
> *Potential improvements and critique*:
> - The script assumes `show_keyboard_layout.py` is in your `$PATH` and executable; you may wish to check this explicitly and print a friendly error if missing.
> - If `bat` or `xterm` are not installed, the script will fail silently. Adding dependency checks and error messages can make debugging easier.
> - Consider supporting other terminal emulators (like `alacritty` or `urxvt`) if you swap away from `xterm` in the future.
> - The terminal is not forced to float; if your qtile rules don’t float windows with the given title/class, you may wish to set up a rule or call `wmctrl`/Qtile hooks to do so.
> - If you frequently need this, consider caching the keyboard layout if generation is slow.
