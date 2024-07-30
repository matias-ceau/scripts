# Wallpaper Script (wallpaper.sh)

---

Pick random wallpaper from wallpaper list or select manually.

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

- feh: for setting the wallpaper.
- notify-send: for desktop notifications.
- fzfmenu.sh: for interactive menu selection (optional, to be implemented).
- yad: for graphical interface selection.

<a name="description" />

### Description

<a name="overview" />

#### Overview

The `wallpaper.sh` script allows users to change their desktop wallpaper easily on Arch Linux using the Qtile window manager. It offers four primary functionalities:
- Set a random wallpaper from a specified directory.
- Select a wallpaper from a list using the fzfmenu or the yad GUI.
- Use a previously set wallpaper from a cache log.
- Set a default wallpaper if no valid options are provided.

The script maintains a cache of previously used wallpapers stored in `~/.cache/wallpapers.log`. This log helps in retrieving and setting wallpapers that have recently been used. 

---

<a name="usage" />

#### Usage

To run the script, use the following command format in the terminal:

```bash
bash wallpaper.sh [option]
```

**Options:**
- `--random`: Picks and sets a random wallpaper from the wallpapers directory.
- `--select`: Prompts the user to select a wallpaper from the list using `fzfmenu.sh`.
- `--previous [n]`: Sets the previously used wallpaper, with an optional `n` to indicate how many entries back to go (default is 1).
- `--gui`: Opens a graphical dialog to select a wallpaper using `yad`.
- No argument: Sets the default wallpaper.

<a name="examples" />

#### Examples

- To set a random wallpaper:
  ```bash
  bash wallpaper.sh --random
  ```

- To select a wallpaper using `fzfmenu`:
  ```bash
  bash wallpaper.sh --select
  ```

- To revert to the previous wallpaper:
  ```bash
  bash wallpaper.sh --previous
  ```

- To use the GUI wallpaper selector:
  ```bash
  bash wallpaper.sh --gui
  ```

---

<a name="notes" />

### Notes

1. Ensure that `~/.wallpapers/` contains your wallpaper files.
2. The script requires read-write permissions to the cache file located at `$CACHE`.
3. The script currently uses `awk` to remove successive duplicate entries from the cache log to keep it clean.

> **Critique**: 
> - The script could benefit from better error handling, especially when working with external commands like `feh`, `notify-send`, and `yad`.
> - If `fzfmenu.sh` is not available, this should be gracefully handled so the user receives an informative message rather than encountering a silent failure.
> - Consider adding a help option, like `-h` or `--help`, to provide users with usage instructions directly from the command line.