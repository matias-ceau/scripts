# Random Wallpaper Selector

---

**random_wallpapers.xsh**: Selects and sets a random wallpaper from a specified directory.

---

### Dependencies

- `xonsh`: A Python-powered, Unix-gazing shell language and command prompt.
- `os`: A standard Python library module for interacting with the operating system.
- `random`: A Python module providing functions to perform random operations.
- `feh`: An image viewer and cataloguer often used for setting wallpapers.
- `dmenu` *(commented out)*: A dynamic menu for X which may have been intended for user selection from a list.

### Description

This script picks a random image file with extensions `.png` or `.jpg` from the user's wallpaper directory (`/home/matias/.wallpapers`) and sets it as the desktop background using `feh`. The script originally included a commented-out section that utilized `dmenu` to allow for manual selection of a wallpaper from a list, but this functionality is currently bypassed to randomize the selection automatically.

The function `os.listdir(folder)` is used to list all the files in the specified `folder`. A list comprehension filters this list to include only files with `.png` or `.jpg` extensions. The script then uses `random.choice(wallpapers)` to select one file at random. This file is set as the wallpaper using `feh` with the `--bg-scale` option, providing scaled background fitting.

### Usage

The script is a simple command line application without any arguments. To use it, simply run the script in a terminal or set it as a task to be triggered (e.g., through a keybinding in `qtile` or a scheduled task). Here's how you can execute it from the terminal:

```bash
$ xonsh /home/matias/.scripts/bin/random_wallpapers.xsh
```

Alternatively, it can be invoked automatically by integrating it with a keybinding within `qtile`'s configuration or using a cron job for periodic changes.

Example keybinding in `qtile` might be:

```python
Key([mod], "r", lazy.spawn("xonsh /home/matias/.scripts/bin/random_wallpapers.xsh")),
```

---

> [!TIP]
> Consider uncommenting and using `dmenu` to allow for user interaction if preferred over random selection. Additionally, you might want to include support for other image formats or enhance error handling to cover cases where no suitable image is found.