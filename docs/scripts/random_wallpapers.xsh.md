
---

Pick random wallpaper from a predefined list.

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

- Xonsh: A Python-powered shell that provides a flexible command line interface.
- feh: An application for fast image viewing and background setting.
- dmenu (optional): A dynamic menu for X, useful for selecting wallpapers interactively.

<a name="description" />

### Description

<a name="overview" />

#### Overview

This script is designed to randomly select a wallpaper from a predefined directory and set it as the desktop background using the `feh` utility. The script scans a specified folder for image files, particularly those with the extensions `.png` and `.jpg`. It employs the `random` module from Python's standard library to ensure a truly random selection from the available images.

The commented-out code allows for additional functionality using `dmenu`, which can be used for interactive wallpaper selection. However, the script defaults to selecting a random wallpaper if no selection is made from the menu.

The flow of the script is as follows:

1. Import the required libraries.
2. Define the wallpaper directory.
3. Gather a list of wallpapers in the folder.
4. Choose a random wallpaper.
5. Set the chosen wallpaper as the desktop background using `feh`.

---

<a name="usage" />

#### Usage

To run this script, execute it via the command line or bind it to a key combination in your window manager (Qtile). Make sure to give the script executable permissions with the command:

```bash
chmod +x /home/matias/.scripts/random_wallpapers.xsh
```

You can then run the script directly:

```bash
/home/matias/.scripts/random_wallpapers.xsh
```

You may also configure the script to automatically change wallpapers at regular intervals by calling it via a cron job or a similar scheduler.

<a name="examples" />

#### Examples

- Run the script directly from the terminal:

```bash
/home/matias/.scripts/random_wallpapers.xsh
```

- Set a keyboard shortcut in Qtile to run this script, for example,:

```python
Key([mod], 'r', lazy.spawn('/home/matias/.scripts/random_wallpapers.xsh'))
```

---

<a name="notes" />

### Notes

Make sure to replace the `folder` variable with the actual path to your wallpaper directory if it differs. Customize the script further by uncommenting the `dmenu` line if you prefer to select your wallpaper interactively.

> **Critique:** 
> - The script could handle cases where the wallpapers directory is empty by adding a check before choosing a random wallpaper.
> - Error handling can be improved in cases where `feh` fails to set the wallpaper or if the specified folder does not exist.
> - The use of `dmenu` is commented out; consider giving users a choice at runtime to use either random or manual selection.