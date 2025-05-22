# screenshot.sh – Screenshot Utility Script

---

**screenshot.sh**: Simple utility for taking fullscreen or user-selected screenshots using `grim`.

---

### Dependencies

- `grim`  
  Wayland screenshot utility used to capture the screen or region.

- `slurp`  
  Region selector for Wayland; used to draw a selection box.

- `notify-send`  
  Desktop notification tool to show messages after saving screenshots.

### Description

This script streamlines taking screenshots under a Wayland environment (such as Sway or river). Screenshots are saved in your `$HOME/Pictures` folder with a timestamped filename for easy organization.

**Functionality:**
- **Fullscreen screenshot:**  
  By default (`no arguments`), the entire display is captured.
- **Area selection screenshot:**  
  When called with `--select`, allows interactive selection of a screen region.  
  Uses `slurp` to let you define a region with the mouse, then captures it via `grim`.

**Notifications:**  
Every time a screenshot is taken, the script sends a desktop notification showing the saved filename using `notify-send`.

### Usage

The script can be run directly in the terminal, bound to a keybinding in `qtile`, or called from a script/shortcut.

Examples:

```sh
# Fullscreen screenshot
~/.scripts/bin/screenshot.sh

# Interactive area selection
~/.scripts/bin/screenshot.sh --select
```

You can set this up as a keybinding in your `qtile` config. Example:

```python
Key([mod], "Print", lazy.spawn("~/.scripts/bin/screenshot.sh")),
Key([mod, "shift"], "Print", lazy.spawn("~/.scripts/bin/screenshot.sh --select")),
```

**Output:**  
- All screenshots are saved to `~/Pictures` with a format like `2024-06-30-screenshot-1719758632.png`.

---

> [!TIP]
>
> - If `$HOME/Pictures` does not exist, the script will fail to save the screenshot. Consider adding a check to create the directory if missing (`mkdir -p "$_OUTPUT_DIR"`).
> - There’s no error handling: if `grim`, `slurp`, or `notify-send` are missing or fail, you won’t get any warning.
> - The notification message is always "Selection saved as ..." even for fullscreen shots—consider customizing the message for clarity.
> - Minor: Script could use `local` for variables to restrict scope, though in this context it's not critical.
> - For further flexibility, you might want to allow custom output directory or filename prefix via command-line arguments.