# Wallpaper Selection Script

---

**wallpaper.sh**: Script to pick and set wallpapers randomly, by selection, or by GUI.

---

### Dependencies

- `feh`: A lightweight image viewer to set wallpapers.
- `notify-send`: To display notifications when wallpaper changes.
- `fzfmenu.sh`: A script for fuzzy finding and selection.
- `yad`: Graphical dialog tool for a GUI selection interface.

### Description

This script manages wallpaper changes by selecting random, previous, or user-selected wallpapers using a terminal or GUI interface. With options for random selection, manual selection via `fzf`, browsing history, or using a GUI, it adapts to different user workflows. By default, it uses a predefined wallpaper. The script uses a log to track wallpaper changes, ensuring you can revert to previous images easily.

Functions utilized:

- `set_wallpaper`: Uses `feh` to change the wallpaper and logs this change. Sends notifications for every change.
- The script handles input arguments for different selection methods and cleans the log by removing duplicate entries.

### Usage

Run the script with the following options:

```bash
# Set a random wallpaper
./wallpaper.sh --random

# Use a fuzzy finder to select wallpaper
./wallpaper.sh --select

# Revert to a previous wallpaper; option --previous with an argument allows specifying how many wallpapers to go back
./wallpaper.sh --previous 2

# Use a GUI to select wallpaper
./wallpaper.sh --gui

# Set the default wallpaper in the absence of arguments
./wallpaper.sh
```

To integrate this with your qtile setup, consider assigning keybindings for these commands in your qtile configuration.

---

> [!CAUTION]
> The `--gui` functionality might not execute perfectly due to a commented-out line with `fzfmenu.sh` and may need further fine-tuning. Ensure `yad` and `fzfmenu.sh` are properly installed and working. The default paths might need updating to match your specific directory structure. Improving the GUI could enhance the script's usability, potentially replacing `yad` with a more suitable tool if issues persist.