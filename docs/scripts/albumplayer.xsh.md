# Album Player Script

---

**albumplayer.xsh**: Play an album using cmus

---

### Dependencies

- `cmus`: A lightweight and versatile audio player for the terminal.
- `dmenu`: A dynamic menu for X, useful for user selection.

### Description

The `albumplayer.xsh` script is crafted to enhance your music listening experience by allowing users to randomly play an album using `cmus`, a terminal-based audio player. It extracts available albums from a specified library file and presents them in a user-friendly manner using `dmenu`, enabling quick selection. 

The script begins by defining a temporary path for a playlist file within the `cmus` configuration directory:

```python
temp_path = os.path.expanduser('~/.config/cmus/.temp.m3u')
```

It collects album paths from the `lib.pl` file, eliminating duplicates and isolating album names. A dictionary (`fancy_dict`) is created for formatting, where album paths are mapped to display names, providing a nice output format with alignment and separators.

Once the user selects an album via `dmenu`, the script constructs a playlist that includes the chosen album and random tracks from different albums. Finally, it writes this playlist to the temporary file and sends commands to `cmus` for execution:

```bash
cmus-remote -U
cmus-remote -C "view 4"
cmus-remote -C clear
cmus-remote -Q
cmus-remote -q @(temp_path)
cmus-remote -p
cmus-remote -n
```

### Usage

To use the `albumplayer.xsh` script, simply run it from your terminal:

```bash
~/path/to/albumplayer.xsh
```

Make sure you have `cmus` running before you execute the script. The script will utilize `dmenu` to allow you to select your desired album easily.

---

> [!TIP]  
> The script could be improved by adding error handling in case the album paths aren't found or if `cmus` isn't running. Additionally, providing user feedback on what is happening when the script is executed would enhance usability, especially for those unfamiliar with the terminal environment.