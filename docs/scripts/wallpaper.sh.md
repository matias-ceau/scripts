# Random Wallpaper Picker

---

**wallpaper.sh**: Sets a random, previously selected, or GUI-chosen wallpaper from your collection

---

### Dependencies

- `feh`: Utility for setting wallpapers
- `notify-send`: Displays notifications on your desktop
- `yad`: A tool to create graphical dialogs from shell scripts
- `shuf`: Generates random permutations
- `awk`: For text processing
- `fzfmenu.sh`: Might be a custom or user-provided script for file selection with fzf

### Description

The `wallpaper.sh` script allows you to manage your desktop wallpapers by setting random wallpapers or selecting specific ones. Primarily designed for your Arch Linux setup with Qtile, it offers flexibility to change wallpapers via command-line arguments or a graphical interface.

- **Default Wallpaper**: If no arguments are given, it defaults to the wallpaper located at `$HOME/.wallpapers/_toitssuze.jpg`.
- **Wallpaper cache**: Keeps a log of all the wallpapers used in `~/.cache/wallpapers.log` to allow returning to a previous wallpaper.

This script integrates different functionalities through a set of options:

1. **Random Selection**: Chooses a random wallpaper from `~/.wallpapers` using the `--random` flag.
2. **Selection with fzf**: Enables choosing a wallpaper from a list using the `--select` flag and relies on the `fzfmenu.sh` script.
3. **Return to Previous**: With the `--previous` flag, you can opt to return to a prior wallpaper logged in the cache.
4. **Graphical Mode**: Utilizes the `--gui` flag for a GUI interface to select and preview wallpapers using `yad`.

### Usage

```bash
# Set a random wallpaper
./wallpaper.sh --random

# Select a wallpaper interactively with fzf
./wallpaper.sh --select

# Revert to a previous wallpaper
./wallpaper.sh --previous [n]

# Use a graphical interface to select a wallpaper
./wallpaper.sh --gui

# Set the default wallpaper
./wallpaper.sh
```

---

> [!NOTE]
> The function `fzfmenu.sh` used in the `--select` case might not work if `fzfmenu.sh` isn't present. Additionally, if `yad` is not installed, the `--gui` option will fail. You might want to set checks and install instructions for these dependencies. Also, consider using absolute paths or environment variables to handle multi-user execution more gracefully.