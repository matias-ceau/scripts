# Wallpaper Selector Script

---

**wallpaper.sh**: Script to manage and change wallpapers from a list

---

### Dependencies

- `feh`: An image viewer utilized here for setting wallpapers.
- `notify-send`: Sends desktop notifications after changing wallpapers.
- `shuf`: Used to randomly select a wallpaper.
- `yad`: Provides a GUI for selecting wallpapers.
- `awk`: Utility to process the cache file and remove duplicates.
- `fzfmenu.sh` (optional): Script for interactive command-line fuzzing (part of plan to enhance the GUI).

### Description

This script is designed to enhance your Arch Linux system with dynamic wallpaper management. It offers several functionalities:

- **Set Default Wallpaper**: If no options are provided, it sets a pre-configured default wallpaper.
- **Random Wallpaper**: The `--random` flag picks a random wallpaper from the `~/.wallpapers/` directory.
- **Select Wallpaper**: The `--select` flag allows manual selection using `fzfmenu.sh` (please ensure this script is installed and working correctly).
- **Previous Wallpaper**: Use `--previous` followed by a number (e.g., `--previous 2`) to revert back to a previously set wallpaper.
- **Graphical User Interface (GUI)**: The `--gui` flag opens a visual selection menu using `yad`, enabling you to view and choose wallpapers with previews.

The script also maintains a cache of previously set wallpapers in `~/.cache/wallpapers.log`, aiding the `--previous` functionality.

### Usage

To effectively use this script, insert it into your startup commands or link it to keybindings in your window manager. Below are command examples:

```bash
# Set a random wallpaper
bash ~/scripts/bin/wallpaper.sh --random

# Select a wallpaper interactively
bash ~/scripts/bin/wallpaper.sh --select

# Revert to the previous wallpaper
bash ~/scripts/bin/wallpaper.sh --previous

# Launch the GUI for wallpaper selection
bash ~/scripts/bin/wallpaper.sh --gui

# Use default wallpaper
bash ~/scripts/bin/wallpaper.sh
```
---

> [!TIP]
> Consider integrating `fzfmenu.sh` directly within the script to ensure seamless execution and enhance maintainability. Additionally, improving error handling, especially for missing dependencies or invalid directories, will fortify the script's reliability. If some binned wallpapers have large file sizes, consider displaying only filenames in the terminal selections to speed up execution.