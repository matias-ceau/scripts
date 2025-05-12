# Screenshot Script

---

**screenshot.sh**: A script to take full-screen or region-based screenshots using `grim` and `slurp`.

---

### Dependencies

- `grim`: A lightweight Wayland screen capture utility.
- `slurp`: A utility for selecting screen regions interactively.
- `notify-send`: A tool for sending user notifications (part of `libnotify`).

### Description

This script provides an automated way to take screenshots on a Wayland session. It uses the tools `grim` and `slurp` for capturing the screen or a user-selected region, respectively. All screenshots are saved in the `$HOME/Pictures` directory with a timestamped filename such as `2023-10-11-screenshot-1697069601.png`. Upon capturing, the script also sends a desktop notification using `notify-send` to inform you of the screenshot's success.

Here’s a breakdown of its functionality:
- If executed with the `--select` argument, it allows the user to select a specific region of the screen using `slurp` and only captures that region.
- When run without arguments, it saves a full-screen snapshot.

### Usage

This script can be run directly from the terminal, or it can be mapped to a keybinding in your qtile configuration for fast access.

#### Examples:
- **Capture the full screen**:
  ```bash
  /home/matias/.scripts/bin/screenshot.sh
  ```
  This will save the screenshot of the entire screen.

- **Capture a specific region**:
  ```bash
  /home/matias/.scripts/bin/screenshot.sh --select
  ```
  This allows you to interactively select a screen region.

To integrate with qtile:
- Add a keybinding in `~/.config/qtile/config.py`, for instance:
  ```python
  from libqtile.lazy import lazy
  from libqtile.config import Key
  
  keys = [
      Key([], "Print", lazy.spawn("/home/matias/.scripts/bin/screenshot.sh")),
      Key(["shift"], "Print", lazy.spawn("/home/matias/.scripts/bin/screenshot.sh --select")),
  ]
  ```

---

> [!TIP] 
> - Consider adding checks to verify that `grim`, `slurp`, and `notify-send` are installed before running the main logic, and provide a user-friendly error message if they are missing.
> - The script could benefit from an environment variable for the output directory, allowing users to customize the save location more easily.
> - A feature to copy the image to the clipboard using `wl-copy` could enhance its usability further.
> - There is a minor oversight in the notification message for non-selection mode: it mentions "Selection saved" instead of "Screenshot saved".