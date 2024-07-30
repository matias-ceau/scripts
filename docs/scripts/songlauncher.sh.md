
---

Play a song with cmus using dmenu

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

- `cmus` - A small and fast console audio player.
- `dmenu` - A dynamic menu for X.

<a name="description" />

### Description

<a name="overview" />

#### Overview

The `songlauncher.sh` script is a simple shell script designed for Arch Linux users utilizing the Qtile window manager. It leverages `cmus`, a lightweight audio player, and `dmenu`, a dynamic menu, to facilitate the selection and playback of songs from a specified directory (in this case, a `music` folder). The script uses the `find` command to retrieve a list of all music files and then pipes this list into `dmenu` for user selection.

The command used to find music files is:

```sh
find -L music -type f
```

This finds all files in the `music` directory and its subdirectories and `-L` ensures that symbolic links are followed.

Once a user selects a song from the dmenu interface, the script uses `cmus-remote` to play the selected file through cmus.

---

<a name="usage" />

#### Usage

To use this script, ensure it is executable and run it from the terminal or bind it to a key within your Qtile configuration. You can make the script executable with:

```sh
chmod +x /home/matias/.scripts/songlauncher.sh
```

Then execute it by running:

```sh
/home/matias/.scripts/songlauncher.sh
```

Alternatively, you can bind it to a key in your Qtile configuration, allowing for quick access to play your favorite songs.

<a name="examples" />

#### Examples

1. **Run the script directly:**
   ```sh
   ~/path/to/script/songlauncher.sh
   ```

2. **Keybinding in Qtile (example for mod + p):**

   In your `~/.config/qtile/config.py`, you can add:

   ```python
   Key([mod], "p", lazy.spawn("bash /home/matias/.scripts/songlauncher.sh")),
   ```

---

<a name="notes" />

### Notes

- Ensure that your music directory (`music`) is properly structured, otherwise the script may not find any files to play.
- The script does not handle cases where no music files are found. If the `find` command returns no results, cmus will not be able to play anything.

> **Critique:** 
> While the script is effective for its purpose, it could benefit from error handling. For example, a check could be added to notify the user if no music files were found in the specified directory. Additionally, adding options for the user to specify different directories or filtering types (like file extensions) would enhance usability.