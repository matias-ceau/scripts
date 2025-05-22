# Random Wallpaper Chooser

---

**random_wallpapers.xsh**: Script to set a random wallpaper from the `~/.wallpapers` directory.

---

### Dependencies

- `xonsh`: Python-powered shell language; required to interpret this script.
- `feh`: Lightweight image viewer and wallpaper setter.
- `dmenu` (commented-out): Fast, dynamic menu for X, useful for selecting wallpapers interactively ([currently not used in the script]).

### Description

This Xonsh script, intended for use on Arch Linux (with qtile as the Window Manager), selects a random PNG or JPG image from your `~/.wallpapers` directory and sets it as the desktop wallpaper using `feh` with the `--bg-scale` option.

How it works:
- Lists all files in your wallpaper folder.
- Filters for files with `.png` or `.jpg` extensions.
- Randomly picks one.
- Sets it as your wallpaper.
- Includes a commented-out section for using `dmenu` to interactively pick a wallpaper, but this code path is currently disabled.

### Usage

Default usage is to run from your preferred shell or keybinding—no arguments required.

```sh
xonsh /home/matias/.scripts/bin/random_wallpapers.xsh
```

#### As a qtile keybinding

Example (in your `config.py`):

```python
Key([mod], "w", lazy.spawn("xonsh /home/matias/.scripts/bin/random_wallpapers.xsh"), desc="Set random wallpaper"),
```

#### TL;DR

- Place images (`.png`, `.jpg`) in `~/.wallpapers`.
- Run the script:  
  `xonsh /home/matias/.scripts/bin/random_wallpapers.xsh`
- Enjoy a new random desktop background!

---

> [!NOTE]
> **Critique & Suggestions:**  
> - If `~/.wallpapers` contains files with uppercase extensions (`.JPG`, `.PNG`), they will not be recognized. You could use `.lower()` to handle case-insensitive matches.
> - No check for empty wallpaper directory; consider adding a condition to handle this gracefully.
> - For a larger or more dynamic collection of wallpapers (nested folders), a recursive approach using `os.walk()` might be useful.
> - The commented-out `dmenu` functionality could be toggled via a command-line flag for interactive vs. random selecting.  
> - Using `feh --bg-scale ...` works well for most cases but may stretch or compress wallpapers; consider `--bg-fill` or others depending on your preference.