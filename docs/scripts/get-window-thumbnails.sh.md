# Get Window Thumbnails Script

---

**get-window-thumbnails.sh**: Captures and resizes screenshots of open windows on your desktop.

---

### Dependencies

- `wmctrl`: Used to list window IDs.
- `xwininfo`: Used to gather window information, specifically the window names.
- `xdotool`: Used to map and unmap windows, making them visible for screenshots.
- `import`: A utility from ImageMagick suite, used for capturing window screenshots.
- `mogrify`: Also from ImageMagick, used for resizing the screenshots to thumbnails.

### Description

The **get-window-thumbnails.sh** script automates the process of capturing and resizing thumbnails of every window currently open in your desktop environment (Qtile on Arch Linux). The script first creates a directory called `window_screenshots` in your home directory to store these images. It uses `wmctrl` to retrieve the IDs of all open windows and iterates over each to perform the following sequences:

1. Retrieves the window name using `xwininfo` and formats it to ensure it is a valid filename.
2. Ensures the window is visible using `xdotool windowmap`.
3. Takes a screenshot of the window with the `import` command.
4. Then, hides the window again using `xdotool windowunmap`.
5. Finally, resizes the screenshot to 200x200 pixels and saves it in the specified directory using `mogrify`.

### Usage

You can run this script interactively from a terminal to capture and create thumbnails of the windows:

```bash
bash /home/matias/.scripts/dev/get-window-thumbnails.sh
```

To make this script even more convenient, consider assigning it to a keybinding in Qtile or setting it to run periodically using a cron job.

---

> [!TIP]
> Be aware that the script could potentially reveal contents of minimized windows which might contain sensitive information. Using sleep durations could be adjusted if certain windows do not render correctly before screenshot capture. Furthermore, localizing dependencies like `import` and `mogrify` requires ImageMagick, so make sure it's installed on your system. Additionally, consider error handling for cases where windows may be unresponsive or the external commands are unavailable.