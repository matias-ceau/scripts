# wallpaper.sh

# Wallpaper Changer Script

## Description

The Wallpaper Changer script is designed to randomly select and set a wallpaper from a predefined list of wallpapers. It includes several functionalities that allow users to either set a random wallpaper, select one from a list, revert to previous selections, or use a GUI for the selection process.

## Features

- **Set a Random Wallpaper:**
  Selects and sets a random wallpaper from the wallpapers directory.
- **Select a Wallpaper:**
  Allows manual selection of a wallpaper using a menu.
- **Revert to a Previous Wallpaper:**
  Reverts to a previously used wallpaper based on a history log.
- **GUI Selection:**
  Provides a graphical interface for selecting and previewing wallpapers.
- **Default Wallpaper:**
  Sets a default wallpaper if no arguments are provided or if an error occurs.

## Usage

```bash
#!/usr/bin/bash

# Default wallpaper
DEFAULT_WALLPAPER="$HOME/.wallpapers/_toitssuze.jpg"
CACHE="/home/matias/.cache/wallpapers.log"

# Function to set wallpaper
set_wallpaper() {
    feh --bg-scale "$1" && notify-send -t 3000 -r 1212 "Script" "Changed wallpaper!\n<b>$(basename "$1")</b>"
    echo "$1" >> "$CACHE"
}

# Parse arguments
case "$1" in
    --random)
        wallpaper=$(find ~/.wallpapers/ -type f | shuf -n 1)
        set_wallpaper "$wallpaper"
        ;;
    --select)
        wallpaper=$(find ~/.wallpapers/ -type f | fzfmenu.sh)
# -i -l 10)
        [ -n "$wallpaper" ] && set_wallpaper "$wallpaper"
        ;;
    --previous)
        n=${2:-1}
        n=$((n + 1))
        wallpaper=$(tail -n "$n" ~/.cache/wallpapers.log | head -n 1)
        sed -i "$(($(wc -l < $CACHE) - $n + 1)),\$d" "$CACHE"
        [ -n "$wallpaper" ] && set_wallpaper "$wallpaper"
        ;;
    --gui)
        wallpaper=$(find ~/.wallpapers/ -type f \( -name "*.jpg" -o -name "*.png" -o -name "*.jpeg" \) -printf "%f\n%p\n" | \
            yad --list \
                --title="Select a wallpaper" \
                --width=400 --height=500 \
                --column="Filename" \
                --column="Path":HD \
                --hide-column=2 \
                --print-column=2 \
                --no-headers)
        if [ -n "$wallpaper" ]; then
            yad --image="$wallpaper" \
                --title="Preview" \
                --width=800 --height=600 \
                --button="Set as wallpaper:0" \
                --button="Cancel:1"
            if [ $? -eq 0 ]; then
                set_wallpaper "$wallpaper"
            fi
        fi
        ;;
   *)
       set_wallpaper "$DEFAULT_WALLPAPER"
       ;;
esac

# Remove successive duplicate entries
awk '!seen[$0]++' "$CACHE" > "$CACHE.tmp" && mv "$CACHE.tmp" "$CACHE"
```

### Options

- `--random`: Set a random wallpaper from the wallpapers directory.
- `--select`: Select a wallpaper manually from a menu.
- `--previous [n]`: Revert to the previous wallpaper. Defaults to the last wallpaper if `n` is not specified.
- `--gui`: Use a graphical interface for selecting and previewing wallpapers.
- No argument: Sets the default wallpaper defined as `DEFAULT_WALLPAPER`.

### TODO

- Make GUI work properly, probably integrate with the `fzfmenu.sh` script from `junegunn`.

### Requirements

- `feh` for setting wallpapers
- `notify-send` for sending notifications
- `yad` for graphical interface (optional for `--gui` option)
- `fzfmenu.sh` script (optional for `--select` option)

## License

This script is released under the MIT License. See `LICENSE` file for more details.

---

**Note:** Make sure to replace the paths and filenames appropriately to match your environment.