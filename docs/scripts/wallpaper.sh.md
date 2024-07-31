# Random Wallpaper Selector

---

**[wallpaper.sh](wallpaper.sh)**: Automatically change wallpapers from a specified collection.

---

### Dependencies

- `feh`: A lightweight image viewer used for setting the desktop wallpaper.
- `notify-send`: A command-line tool to send desktop notifications.
- `fzfmenu.sh`: (optional) An interactive command-line fuzzy finder for selecting wallpapers.
- `yad`: A GTK+ dialog for shell scripts which provides a GUI interface.

### Description

This script allows users to customize their desktop experience on Arch Linux by selecting and setting wallpapers from a designated folder. By utilizing the `feh` image viewer, it can set wallpaper images in various styles. Users have the option to choose a random wallpaper, select one interactively using a terminal-based fuzzy finder (`fzfmenu.sh`), or use a GUI dialog with `yad` to preview and confirm the wallpaper selection.

The script maintains a log of wallpapers that have been set, stored in `~/.cache/wallpapers.log`, allowing users to return to previously selected wallpapers. It also offers functionality to remove redundant entries in the log.

### Usage

Run the script via command line with the following options:

```bash
# Set a random wallpaper
bash /home/matias/.scripts/wallpaper.sh --random

# Select a wallpaper interactively
bash /home/matias/.scripts/wallpaper.sh --select

# Set the previous wallpaper (optional: specify how many entries back)
bash /home/matias/.scripts/wallpaper.sh --previous [number]

# Open GUI to select wallpaper
bash /home/matias/.scripts/wallpaper.sh --gui

# Set the default wallpaper if no options are provided
bash /home/matias/.scripts/wallpaper.sh
```

---

> [!TIP]  
> The script could benefit from enhanced error handling. As it stands, if any command fails (such as `find` or `yad`), it may cause unexpected behavior. It would be wise to add error checks after critical commands. Moreover, consider implementing a dedicated function for cleaning up the cache to enhance readability and maintainability. This way, the logic for removing duplicates could be isolated, simplifying the flow of the main script.
