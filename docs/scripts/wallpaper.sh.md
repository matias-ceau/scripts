# Wallpaper Selector Script

---

**wallpaper.sh**: A script to pick random wallpapers from a specified list.

---

### Dependencies

- `feh`: A lightweight image viewer for setting wallpapers.
- `notify-send`: A command-line tool to send desktop notifications.
- `fzfmenu.sh`: An external fuzzy finder script (recommended for interactive selections).
- `yad`: A GUI dialog tool for displaying graphical dialogs.

### Description

This script provides a convenient way to change your desktop wallpaper on Arch Linux using Bash. It allows you to select a wallpaper either randomly from a specified directory or through a GUI, ensuring a personalized desktop experience every time you use it.

The script primarily utilizes `feh`, which is crucial for setting the wallpaper. It keeps a cache of wallpapers that have been used recently, allowing users to revert to previous selections. 

The core functionality of the script can be summarized as follows:
- **Random Wallpaper**: If the `--random` argument is provided, it randomly selects a wallpaper from the `~/.wallpapers/` directory.
- **Select Wallpaper**: Using the `--select` option, users can choose a wallpaper interactively with `fzfmenu.sh`.
- **Previous Wallpaper**: The `--previous` option allows reverting to previously used wallpapers. You can specify how many steps back you want to go.
- **GUI Selection**: The `--gui` option launches a graphical interface using `yad` to preview and select wallpapers.

### Usage

To use the script, invoke it from the terminal or assign a keybinding in your window manager. Here are some examples of how to execute it:

```bash
# Set wallpaper randomly
bash /home/matias/.scripts/wallpaper.sh --random

# Choose a wallpaper interactively
bash /home/matias/.scripts/wallpaper.sh --select

# Set the previous wallpaper (1 step back)
bash /home/matias/.scripts/wallpaper.sh --previous [n]

# Open the GUI for selecting a wallpaper
bash /home/matias/.scripts/wallpaper.sh --gui
```

If no arguments are provided, the script defaults to a predefined wallpaper located at `~/.wallpapers/_toitssuze.jpg`.

---

> [!TIP] 
> This script may benefit from improved error handling. For instance, it currently lacks checks to ensure that the wallpaper directory exists or that `feh` and `yad` are installed before executing commands. Adding such validation would enhance user experience and robustness. Additionally, consider expanding GUI options to make it more seamless, potentially integrating `fzf` directly into the script for a more comprehensive selection experience.