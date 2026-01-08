# Random wallpaper picker

---

**random_wallpapers.xsh**: Pick a random wallpaper from `~/.wallpapers` and set it

---

### Dependencies

- `xonsh` — executes this `.xsh` script
- `feh` — sets the wallpaper via `--bg-scale`

### Description

This script selects a wallpaper image from `/home/matias/.wallpapers` and applies it using `feh`.

How it works:

- Reads the wallpaper directory with `os.listdir()`
- Filters files by extension, accepting only names ending in `png` or `jpg` (simple last-3-chars check)
- Picks one entry at random via `random.choice()`
- Calls `feh --bg-scale` to set the selected file as the current wallpaper

There are commented-out lines suggesting an interactive `dmenu` selector (building a newline-separated list and letting you choose), but the current active behavior is always random.

Because it’s written in xonsh, it mixes Python logic with direct shell execution; the final `feh` invocation is executed as a command, with xonsh’s `@(...)` used to splice Python expressions into the argument list.

### Usage

Run manually:

    random_wallpapers.xsh

Typical “tldr” patterns:

- Set a new random wallpaper (e.g. bound to a key in qtile):

    ~/.scripts/bin/random_wallpapers.xsh

- Run on login (qtile autostart):

    # in your autostart.sh or qtile startup hook
    ~/.scripts/bin/random_wallpapers.xsh

---

> [!TIP]
> Improvements to consider:
> - The extension check (`i[-3:]`) misses `jpeg`, uppercase extensions (`.JPG`), and files shorter than 3 chars; use `os.path.splitext(i)[1].lower() in ('.png', '.jpg', '.jpeg')`.
> - If the folder is empty, `random.choice()` will raise an exception—add a guard and a helpful error message.
> - Hardcoding `/home/matias` reduces portability; prefer `os.path.expanduser('~/.wallpapers')`.
> - If you want the original interactive mode, re-enable the `dmenu` selection and add `dmenu` as an explicit dependency.