# Random Wallpapers (random_wallpapers.xsh)

---

Pick random wallpaper from a predefined list using Xonsh.

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

- Xonsh
- Feh (for setting wallpapers)

<a name="description" />

### Description

<a name="overview" />

#### Overview

This script, written in Xonsh, is designed to randomly select a wallpaper from a specified folder containing image files (PNG and JPG). The folder path is hardcoded to `/home/matias/wallpapers`, and the script employs the `os` and `random` libraries to manage file listing and selection.

The script filters the contents of the wallpaper directory to ensure only files with the relevant image extensions are considered. It can be modified to include additional image formats if needed. The selected wallpaper is then set as the desktop background using the `feh` command, which provides an efficient way to manage wallpapers in a Linux environment.

---

<a name="usage" />

#### Usage

To use the script, simply execute it in a terminal or create a keybinding in your window manager (Qtile). The script takes no command-line arguments and uses the internal folder path to fetch and set a random wallpaper.

Make sure to adjust permissions to ensure the script is executable:

```bash
chmod +x /home/matias/.scripts/random_wallpapers.xsh
```

You can run the script as follows:

```bash
/home/matias/.scripts/random_wallpapers.xsh
```

---

<a name="examples" />

#### Examples

1. Run the script directly in a terminal:

```bash
/home/matias/.scripts/random_wallpapers.xsh
```

2. Bind the script to a key combination in Qtile config:

```python
Key([mod], "w", lazy.spawn("/home/matias/.scripts/random_wallpapers.xsh")),
```

This binding would allow you to quickly change your wallpaper with the press of a key.

---

<a name="notes" />

### Notes

- Ensure that the specified folder contains wallpaper images in PNG or JPG format.
- You can personalize the folder path by modifying the variable `folder` in the script.
- For better usability, consider implementing a user prompt to select wallpapers interactively, rather than selecting randomly every time.

> **Critique:** 
> The script functions correctly for its purpose. However, it lacks error handling. For instance, if the specified wallpaper directory is empty or doesn't exist, the script will raise an error. Adding checks to confirm that the `wallpapers` list is not empty before attempting to select a random wallpaper could enhance reliability. Furthermore, providing feedback to the user, such as printing the selected wallpaper or an error message, would improve the user experience.