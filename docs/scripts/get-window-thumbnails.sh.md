# Get Window Thumbnails

---

**get-window-thumbnails.sh**: Script to capture and resize screenshots of all open windows.

---

### Dependencies

- `wmctrl`: A command line tool to interact with an X Window Manager.
- `xdotool`: Tool for simulating keyboard input and mouse activity, and for window management.
- `ImageMagick`: A software suite to create, edit, and compose bitmap images, here used for resizing.

### Description

This script automates the process of capturing thumbnails of all open windows on an Arch Linux system running the Qtile window manager. It does so by using a combination of tools that interact with the X Window System to display, capture, and manipulate window content.

1. **Directory Creation**: It starts by creating a directory (`$HOME/window_screenshots`) to store the screenshots.
2. **Window Enumeration**: Retrieves all window IDs using `wmctrl`, which lists windows controlled by the window manager.
3. **Window Management**:
    - The script iterates over the list of window IDs.
    - For each window:
        - It unmapped (brings to the foreground) the window using `xdotool` to ensure it is visible on the screen.
        - A brief pause (`sleep 0.2`) is introduced to allow the window to render completely before taking a screenshot.
        - The `import` command from ImageMagick captures the window as a PNG and stores it in the previously created directory, appending the window name and ID to the filename.
        - Finally, it remaps the window back to its original state (hides it).
4. **Thumbnail Creation**: The captured images are then resized to 200x200 pixels using `mogrify` to create smaller thumbnails for quick access.

### Usage

To run the script, simply execute it in a terminal:

```bash
bash /home/matias/.scripts/dev/get-window-thumbnails.sh
```

You can also bind this script to a key in your Qtile configuration file to quickly take screenshots whenever needed.

---

> [!TIP] 
Consider adding error handling in the script. For instance, checking if the dependencies are installed before execution, or verifying if the screenshot was captured successfully. This will improve the robustness of your script and help you troubleshoot issues effectively.