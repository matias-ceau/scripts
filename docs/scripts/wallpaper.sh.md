# Wallpaper Changer Script

---

**wallpaper.sh**: Script to set and manage desktop wallpapers randomly or manually on Arch Linux with qtile WM.

---

### Dependencies

- `feh`: A lightweight image viewer used here to set the wallpaper.
- `notify-send`: Utilized for desktop notifications.
- `fzfmenu.sh`: A fuzzy finder to select wallpapers manually (from the junegunn repository).
- `yad`: Yet Another Dialog for GUI selections and previews.

### Description

This script facilitates changing desktop wallpapers by selecting random images from a specified directory or manually choosing one through a CLI or GUI interface. A cache log of previously used wallpapers is maintained. It offers several modes of operation:

- **Random Selection**: Automatically pick a random wallpaper.
- **Manual Selection**: Use a fuzzy finder (`fzf`) for CLI selection or a graphical dialog (`yad`) for GUI selection.
- **Revert to Previous**: Set a previously used wallpaper.
- **Set Default**: If no arguments are provided, revert to a default wallpaper.

The script uses `feh` to set the wallpaper and `notify-send` for notifications. Additionally, the script prevents duplicate entries in the cache log.

### Usage

Run the script with the desired option:

```bash
./wallpaper.sh --random
```

Changes the wallpaper to a random image from the configured directory.

```bash
./wallpaper.sh --select
```

Gives an interactive CLI selection menu using `fzf`.

```bash
./wallpaper.sh --previous [n]
```

Reverts to the previously set wallpaper, or `n` wallpapers ago.

```bash
./wallpaper.sh --gui
```

Opens a GUI dialog to select a wallpaper with a preview option.

Without any arguments, it sets the default wallpaper provided in the script.

---

> [!NOTE]
> This script cleverly combines CLI and GUI methods for user interaction, accommodating different preferences. However, the `fzfmenu.sh` script is expected to be available, as it is a custom dependency not provided directly by common package managers. If the `yad` dialog is slow to load with many images, consider optimizing the file selection or preview logic. The `DEFAULT_WALLPAPER` path should be validated at runtime to avoid errors from non-existing paths, and consider using `$XDG_CACHE_HOME` instead of hardcoding the cache path for a more robust setup.