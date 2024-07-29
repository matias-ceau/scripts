# wallpaper.sh

**Script Description**

This is a Bash script designed to manage wallpapers on a Linux system. The script, named `set_wallpaper.sh`, allows users to pick a random wallpaper from a list, select a specific wallpaper, or recall the previously set wallpaper.

**Functionality**

The script has several modes of operation:

1. **Random Wallpaper**: When run with the `--random` option, it selects a random wallpaper from the specified directory (`~/.wallpapers/`) and sets it as the desktop background.
2. **Select Wallpaper**: With the `--select` option, it allows users to select a specific wallpaper using either the built-in `fzfmenu.sh` script or a graphical interface (via `yad`).
3. **Previous Wallpaper**: The `--previous` option recalls the previously set wallpaper and sets it as the new background.
4. **Default Wallpaper**: If no options are provided, it sets the default wallpaper specified in the script (`$DEFAULT_WALLPAPER`).

**Additional Features**

The script also includes the following features:

* Notifies the user when a new wallpaper is set using `notify-send`.
* Caches recently set wallpapers in a log file (`~/.cache/wallpapers.log`) to facilitate recalling previous wallpapers.
* Removes duplicate entries from the cache by running an `awk` command on the cached logs.

**Notes**

The script relies on external dependencies, such as:

* `feh` for setting the desktop background
* `fzfmenu.sh` for selecting wallpapers using a text-based interface (optional)
* `yad` for creating graphical interfaces (optional)

Overall, this script provides an efficient way to manage wallpapers on Linux systems, making it easy to switch between different backgrounds while maintaining a history of previously set wallpapers.