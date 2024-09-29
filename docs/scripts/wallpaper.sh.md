# Wallpaper Manager

---

**wallpaper.sh**: Pick random wallpaper from wallpaper list

---

### Dependencies

- `feh`: A lightweight image viewer that is used to set the desktop wallpaper.
- `notify-send`: Utility for sending desktop notifications. This script uses it to inform the user when the wallpaper changes.
- `yad`: A fork of Zenity that allows the creation of graphical dialogs from shell scripts. This script uses it to present a GUI for selecting wallpapers.
- `fzfmenu.sh`: A script intended for providing fuzzy searching for selections. This needs to be available to use the select feature in this script.

### Description

The `wallpaper.sh` script is a Bash script designed to manage and set desktop wallpapers on your system. The script offers several functionalities, allowing users to set a random wallpaper, select one interactively through a fuzzy search, or select a previously used wallpaper. It keeps a log of the wallpapers that have been set and removes duplicates to maintain an organized list.

The script begins by defining a default wallpaper and a path to store a log of previously set wallpapers. The main functionality is encapsulated in a `set_wallpaper` function, which utilizes `feh` to change the desktop background and informs the user through a desktop notification.

### Usage

To use the script, execute it in the terminal with one of the following options:

- Change to a random wallpaper:
  ```bash
  ./wallpaper.sh --random
  ```

- Select a wallpaper using a fuzzy search (requires `fzfmenu.sh`):
  ```bash
  ./wallpaper.sh --select
  ```

- Set the previous wallpaper (you can specify how far back):
  ```bash
  ./wallpaper.sh --previous 2
  ```

- Use a graphical interface to select a wallpaper:
  ```bash
  ./wallpaper.sh --gui
  ```

- Set the default wallpaper:
  ```bash
  ./wallpaper.sh
  ```

The script will also log the wallpapers that have been set in the cache file (`/home/matias/.cache/wallpapers.log`) and manages duplicate entries effectively.

---

> [!TIP]  
> Consider implementing error handling for cases when no wallpapers are found or when dependencies aren't met. This would enhance the user experience by providing feedback about potential issues rather than failing silently. Additionally, ensure that `fzfmenu.sh` is properly integrated – currently, its absence may lead to errors when the `--select` option is invoked.