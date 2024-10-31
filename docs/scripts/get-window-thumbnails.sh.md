# Get Window Thumbnails Script

---

**get-window-thumbnails.sh**: Creates thumbnails of currently open windows on your qtile environment.

---

### Dependencies

- `wmctrl`: Utility for interacting with an EWMH/NetWM compatible X Window Manager.
- `xwininfo`: Provides information about windows on an X server.
- `xdotool`: Simulates keyboard input and manipulate windows.
- `imagemagick` (`import` and `mogrify` tools): Used to capture screenshots and resize images respectively.

### Description

This script captures the thumbnails of all currently open windows in a qtile environment. The script does the following:

1. **Setup the Output Directory:** It creates a directory `window_screenshots` in the user's home directory to store the output images.
   
2. **Enumerate Windows:** The script uses `wmctrl` to fetch a list of window IDs for all open windows.

3. **Processing Each Window:**
   - Fetches the window name using `xwininfo`.
   - Uses `xdotool` to make the window visible on the screen.
   - Delays to ensure the window is properly rendered.
   - Utilizes `imagemagick's` `import` to capture the screenshot of the window.
   - Uses `xdotool` to hide the window.
   - Resizes the captured screenshot to a 200x200 pixels thumbnail using `imagemagick's` `mogrify`.

Windows names are stripped down to alphanumeric, '.' and '_' characters to ensure valid filenames are created. The resulting thumbnails are stored in `$HOME/window_screenshots`.

### Usage

To utilize this script, you can run it directly from a terminal. Ensure it has execute permission:

```bash
chmod +x /home/matias/.scripts/dev/get-window-thumbnails.sh
/home/matias/.scripts/dev/get-window-thumbnails.sh
```

Once executed, the thumbnails will appear in your `window_screenshots` directory. This script is suitable to be run as a cron job or attached to a hotkey within qtile, depending on how frequently you need window thumbnails.

---

> [!TIP] 
> Due to the use of `xdotool` for hiding and showing windows, the script may cause a slight flicker on the screen. Additionally, the script does not handle potential errors when `import` or `mogrify` fail, which could be improved with error checking. Lastly, adding an option to define the output directory or thumbnail size through command line arguments could make the script more flexible.