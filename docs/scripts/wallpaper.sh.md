# Wallpaper Setter (wallpaper.sh)

---

Pick random wallpaper or select from a list and set it as the desktop wallpaper.

---

### Table of contents

- [Dependencies](#dependencies)
- [Description](#description)
    - [Overview](#overview)
    - [Usage](#usage)
    - [Examples](#examples)
- [Notes](#notes)

---

<a name="dependencies" />

### Dependencies

- `feh` - For setting the wallpaper.
- `notify-send` - For displaying notifications.
- `fzfmenu.sh` - For fuzzy searching wallpapers (optional).
- `yad` - For a graphical selection and preview of wallpapers.

<a name="description" />

### Description

<a name="overview" />

#### Overview

The `wallpaper.sh` script allows users to set their desktop wallpaper from a predefined directory of images. It features multiple methods for selecting the wallpaper: randomly, by selection through a fuzzy finder, previous wallpapers from a log, or using a graphical interface with `yad`. 

The default wallpaper is set to a specific image defined in `DEFAULT_WALLPAPER`. Successful changes are logged in a cache file located at the path specified by `CACHE`. 

The script defines a main function `set_wallpaper` that uses `feh` to scale the chosen wallpaper to fill the screen and sends a notification confirming the selection.

---

<a name="usage" />

#### Usage

This script can be used directly in the terminal or can be bound to a shortcut key in your window manager (qtile). You can pass the following command line arguments:

- `--random`: Selects a random wallpaper from the `~/.wallpapers/` directory.
- `--select`: Prompts the user to select a wallpaper using `fzfmenu.sh` (if available).
- `--previous [N]`: Sets the previous N-th wallpaper from the log. Defaults to 1.
- `--gui`: Opens a graphical dialog to select and preview wallpapers using `yad`.
- No arguments: Sets the wallpaper to the default specified in the script.

Example command:
```bash
bash ~/scripts/wallpaper.sh --random
```

<a name="examples" />

#### Examples

- Set a random wallpaper:  
  `bash ~/scripts/wallpaper.sh --random`
  
- Select a wallpaper interactively:  
  `bash ~/scripts/wallpaper.sh --select`
  
- Set the previous wallpaper:  
  `bash ~/scripts/wallpaper.sh --previous`
  
- Open a graphical interface to select a wallpaper:  
  `bash ~/scripts/wallpaper.sh --gui`

---

<a name="notes" />

### Notes

- Make sure you have the necessary dependencies installed for the script to function correctly.
- Ensure that your wallpaper directory (`~/.wallpapers`) contains image files (JPG, PNG, etc.).

> **Critique:** 
> - The script lacks error handling for cases where the wallpaper directory might be empty or the required dependencies may not be installed.
> - The `fzfmenu.sh` script dependency is mentioned but not included or clearly documented, which could lead to confusion for users unfamiliar with it.
> - Implementing a dedicated function to verify that the image set as wallpaper is valid could prevent errors when using `feh`.