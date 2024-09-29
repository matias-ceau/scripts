# Random Wallpaper Picker

---

**random_wallpapers.xsh**: Pick random wallpaper from a predefined list of wallpapers.

---

### Dependencies

- `feh`: A lightweight image viewer that allows setting wallpapers.
- `xonsh`: A Python-powered shell that is required to run this script.

### Description

This script randomly selects a wallpaper from a specified directory and sets it as the desktop background using `feh`. The wallpapers are filtered to include only those with `.png` or `.jpg` extensions, ensuring that only valid image files are considered.

### Usage

To execute this script, simply run the following command in your terminal:

```bash
./random_wallpapers.xsh
```

Make sure that the script is executable. If it's not, you can change its permissions with:

```bash
chmod +x ~/home/matias/.scripts/random_wallpapers.xsh
```

You can also assign it to a keybinding in your window manager, such as Qtile, by adding a keybinding in your `~/.config/qtile/config.py` file:

```python
Key([mod], "w", lazy.spawn('path_to_your_script/random_wallpapers.xsh'))
```

This would allow you to change the wallpaper at the press of a key.

---

> [!TIP] 
> Consider enhancing the script by using a GUI tool like `dmenu` to allow interactive selection of the wallpaper, rather than just a random choice each time. This will provide users with more control over their wallpaper selection. Additionally, you can implement error handling to manage scenarios where the specified wallpaper directory is empty or inaccessible.