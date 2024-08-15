# Random Wallpaper Picker

---

**random_wallpapers.xsh**: Pick a random wallpaper from a specified folder.

---

### Dependencies

- `feh`: A lightweight image viewer that is used to set the desktop background. Ensure it's installed to use this script.
- `xonsh`: An enhanced shell that allows for Python-like syntax. This is required to run the script.

### Description

This script is designed to select a random wallpaper from a predefined folder containing image files (PNG or JPG). It utilizes the `os` and `random` modules from Python to facilitate file handling and selection.

Here's how it works:
1. **Folder Definition**: The path to the wallpaper directory is defined (`/home/matias/.wallpapers`).
2. **Wallpaper List Creation**: The script lists all files in the specified folder, filtering for those that end with `.png` or `.jpg`.
3. **Random Selection**: It then randomly selects one of the available wallpapers.
4. **Background Setting**: Finally, the script uses `feh` to set the selected wallpaper as the desktop background with a scale fit.

Notably, there's a commented-out section that suggests an alternative method for selecting a wallpaper using `dmenu`. This could be used for interactive selection if desired.

### Usage

To use the script, ensure all dependencies are installed and execute it in a terminal or assign it to a keybinding in your window manager. An example command to run the script is:

```bash
~/path/to/random_wallpapers.xsh
```

#### Keybinding Example for Qtile

You can easily add a keybinding in your `qtile` config to run this script. For example:

```python
from libqtile.config import Key
from libqtile.lazy import lazy

keys = [
    Key([mod], "r", lazy.spawn("~/path/to/random_wallpapers.xsh")),
]
```

---

> [!TIP]
> This script works well but could benefit from a few improvements:
> - The ability to support a broader range of image formats (e.g., `.jpeg`, `.gif`).
> - Implement error handling in case the specified directory contains no images or if `feh` fails to execute.
> - Consider enabling user selection through `dmenu` or another utility to improve interactivity.
> - Make the wallpaper folder configurable through a command-line argument to enhance usability across different setups.