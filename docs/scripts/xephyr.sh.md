# Xephyr Launcher Script

---

**/home/matias/.scripts/dev/xephyr.sh**: Launch a Xephyr instance to run a nested qtile session

---

### Dependencies

- `bash`: The script is written in Bash.
- `python3`: Used to execute python commands and launch qtile.
- `Xephyr`: Required to start a nested X server with the RANDR extension.
- `libqtile`: Specifically, its utility module (`libqtile.utils`) is used to auto-detect the terminal.
- `qtile`: Acts as the window manager running inside Xephyr.

### Description

This script creates a nested X session using Xephyr and initiates a qtile window manager session within it. It does this by:
- Determining the script’s location with `readlink -f`.
- Using environment variables such as `SCREEN_SIZE`, `XDISPLAY`, and `LOG_LEVEL` to configure the Xephyr screen resolution, display number, and logging level respectively.
- Auto-detecting the default terminal emulator using a Python one-liner from `libqtile.utils` if the `APP` variable isn’t set.
- Launching Xephyr in the background on the specified display (default is `:1`).
- Waiting briefly (using `sleep 1`) to ensure Xephyr is up before starting qtile.
- Setting up the nested environment by changing the `DISPLAY` variable and starting qtile with the provided log level and any additional command-line arguments.
- Finally, launching the detected terminal application within the nested display and cleaning up by terminating Xephyr once qtile exits.

The script is particularly useful under Arch Linux with qtile as the window manager, allowing developers or testers to run qtile inside an isolated environment via Xephyr.

### Usage

To run the script manually in a terminal:
  
  $ ~/.scripts/dev/xephyr.sh

You can also pass additional parameters to qtile:

  $ ~/.scripts/dev/xephyr.sh --config ~/.config/qtile/config.py

Furthermore, this script can be assigned as a keybinding in your qtile configuration. Ensure that the executable permission is granted:

  $ chmod +x ~/.scripts/dev/xephyr.sh

When executed, the script opens a nested qtile session on display `:1` with a screen resolution of 800x600 (or your custom setting via the `SCREEN_SIZE` variable).

---

> [!TIP]
> Consider adding error handling to check whether Xephyr, qtile, and the necessary Python modules are installed. Additionally, refining the delay (currently a fixed 1-second sleep) might improve reliability on slower systems. Enhancements like dynamic resolution detection or more robust logging could further improve the script's usability.