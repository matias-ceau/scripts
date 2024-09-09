# Get Window Thumbnails

---

**get-window-thumbnails.sh**: Capture window thumbnails from currently open windows and save them.

---

### Dependencies

- `wmctrl`: A command-line tool to interact with an X window manager.
- `xwininfo`: Displays information about windows.
- `xdotool`: A utility to simulate keyboard input and mouse activity, and to manipulate windows.
- `imagemagick`: A suite of tools to create, edit, and compose bitmap images.

### Description

The `get-window-thumbnails.sh` script automates the process of capturing thumbnails of currently open windows on a Linux machine using the X Window System. This is particularly useful for users who want quick visual references of their active applications.

The script follows these steps:
1. Creates a directory to store screenshots if it doesn't already exist.
2. Retrieves the IDs of all open windows using `wmctrl`.
3. Iterates over each window ID:
   - Maps the window to make it visible.
   - Implements a slight delay to ensure the window is visible and rendered properly.
   - Takes a screenshot of the window with `import` from the ImageMagick suite.
   - Unmaps the window to hide it again.
   - Resizes the resulting screenshot to a uniform size of 200x200 pixels using `mogrify`.

This process results in a neatly organized set of window thumbnails that can be viewed in the specified output directory.

### Usage

To execute the script, simply run it from a terminal:

```bash
bash /home/matias/.scripts/dev/get-window-thumbnails.sh
```

You may want to bind this script to a qtile keybinding for convenience. You can add a binding in your `~/.config/qtile/config.py`, for example:

```python
from libqtile import key

keys = [
    key.Key(["mod4"], "t", lazy.spawn("bash /home/matias/.scripts/dev/get-window-thumbnails.sh")),
]
```

---

> [!TIP] 
> Consider adding error handling to the script, especially when dealing with window manipulations and image processing. For instance, checking if `import` successfully captures an image, or if `xdotool` can map/unmap windows, would enhance the reliability of the script. Additionally, logging the process could help troubleshoot any issues encountered during execution.