
# Random Wallpaper Selector

---

**random_wallpapers.xsh**: Selects a random wallpaper from a specified directory of images

---

### Dependencies

- `xonsh`: A Python-powered shell that executes the script.
- `feh`: A lightweight and versatile image viewer used here to set the desktop wallpaper.
- Images should be in `.jpg` or `.png` format, stored in the specified folder.

### Description

This script chooses a random image from a predefined directory and sets it as the desktop wallpaper. The directory is specified within the script as `/home/matias/.wallpapers`. Images with `.png` or `.jpg` extensions are considered for selection. `feh` is then used to apply the chosen image as the wallpaper with the `--bg-scale` option, ensuring it scales appropriately to fit the screen.

The script initially had a commented-out section using `dmenu`, a dynamic menu that fluently manages and selects screen elements. This suggests potential functionality for user interaction, although the current implementation does not include this feature.

### Usage

The script is executed in a `xonsh` shell. Since it doesn’t take arguments, you can run it directly to change the wallpaper randomly. Here is how to use the script:

```bash
xonsh /home/matias/.scripts/bin/random_wallpapers.xsh
```

For seamless wallpaper changing, you might consider setting a keybinding in `qtile` to run this script without opening a terminal:

```python
Key([mod], "w", lazy.spawn("xonsh /home/matias/.scripts/bin/random_wallpapers.xsh"))
```

Moreover, you can incorporate this into `qtile` autostart for an automatic random wallpaper each login or explore cron jobs or other scheduling methods.

---

> [!NOTE] 
> The script currently relies on `feh` to set the wallpaper, which may not be available in all environments. Consider checking alternatives like `nitrogen` or `hsetroot`. Additionally, if many images are in the directory, pre-filtering files or improving the random selection mechanism for better randomness or performance might be beneficial. Including options or arguments for the user to select different folders or image types could enhance usability.