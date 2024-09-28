# Random Wallpaper Selector

---

**random_wallpapers.xsh**: Selects and sets a random wallpaper from a specified folder for use with `feh`.

---

### Dependencies

- `xonsh`: A Python-powered, cross-platform, Unix-gazing shell language and command prompt.
- `feh`: A fast and light utility to set background images.
- `dmenu` (commented out): A dynamic menu for X, which was presumably intended for manual selection but is not actively used in this script.

### Description

This script is designed to randomly select a wallpaper from a specified directory (`/home/matias/.wallpapers`) and set it as the desktop background using the `feh` utility. The script supports image formats with extensions `.png` and `.jpg`. Initially, there is a commented-out section intended to allow for manual selection via `dmenu`, though it defaults to automatically picking a random image.

The process works as follows:
1. It lists all files in the designated folder ending with `.png` or `.jpg`.
2. Chooses one file at random, automatically selecting it.
3. Utilizes `feh --bg-scale` to apply the chosen image as the wallpaper, ensuring it scales correctly on varying monitor sizes.

### Usage

To execute the script, ensure you have xonsh and feh installed and run it in a terminal as follows:

```bash
xonsh /home/matias/.scripts/random_wallpapers.xsh
```

If desired, automate the execution through qtile by binding it to a keybinding or running it during startup. 

```python
# Example keybinding for Qtile
Key([mod, "shift"], "w", lazy.spawn("xonsh /home/matias/.scripts/random_wallpapers.xsh"))
```

Ensure the folder `/home/matias/.wallpapers` contains valid `.png` and `.jpg` files.

---

> [!NOTE]
> The commented-out `dmenu` line in the script indicates a previous or intended feature for manual selection of wallpapers. If interactive selection is desired, consider uncommenting and fixing any issues with `dmenu` to integrate this functionality. Also, checking if the wallpapers list is not empty before choosing a wallpaper can prevent potential errors when the folder is empty.