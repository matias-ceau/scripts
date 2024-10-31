# Album Player Script

---

**albumplayer.xsh**: Play an album using cmus and dmenu integration

---

### Dependencies

- `cmus`: A small, fast and powerful console music player.
- `dmenu`: A dynamic menu for X, typically used as a quick application launcher and selection tool.
- `xonsh`: A Python-powered shell, script is written specifically for this environment.

### Description

This script allows you to play a selected album using the `cmus` music player. It starts by reading a library file located at `~/.config/cmus/lib.pl`, which is expected to contain a list of music file paths. It extracts album names from these paths and presents them through `dmenu` for selection.

Once an album is selected, the script generates a playlist file at `~/.config/cmus/.temp.m3u` containing songs from the selected album, as well as a random selection of songs from other albums. This playlist is loaded and played in `cmus`.

Key script operations include:
- Reading and parsing the music library file.
- Using set and dictionary operations to deduplicate and format album names for display.
- Incorporating `dmenu` for album selection.
- Managing playlist creation and cleanup of `cmus` state, using several `cmus-remote` commands for interaction.

### Usage

To use this script:

1. Ensure you have Xonsh, CMUS, and Dmenu installed on your Arch Linux system.
2. Optionally bind this script to a key combination in your qtile configuration. Here's an example in Python for qtile:

    ```python
    from libqtile.lazy import lazy
    from libqtile.config import Key

    keys = [
        Key(["mod1"], "p", lazy.spawn("xonsh /home/matias/.scripts/bin/albumplayer.xsh")),
    ]
    ```

3. Run the script from your terminal by executing `xonsh /home/matias/.scripts/bin/albumplayer.xsh`.
4. Select an album from the `dmenu` list that appears, and enjoy your music session.

---

> [!NOTE] 
> The script assumes the existence of a properly formatted `~/.config/cmus/lib.pl` file. 
> Consider adding error handling for scenarios where files do not exist to improve robustness. The selection from `dmenu` could be enhanced to handle cases where selection is cancelled or invalid inputs are provided. Additionally, it would be beneficial to document how the `.temp.m3u` file affects `cmus` behavior if it is used by other scripts or processes.