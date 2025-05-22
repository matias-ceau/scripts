# Sandisk Music Transfer Tool

---

**sandisk_music_transfert.py**: Transfers unplayed albums from your music library to your Sandisk media player, automatically fitting them to available space.

---

### Dependencies

- `python >= 3`
- `pandas`: For DataFrame operations.
- `os`, `subprocess`, `random`: Python standard libraries.
- `rsync` *(system command)*: Efficient file transfer.
- `beets` (`beet` command): Music library manager, used here to query album statuses.
- `du`, `rm`, `mkdir`, `sudo`: Shell utilities for disk usage checking and file operations.

*Optionally*: 
- `getpass` (commented; for password requests during `sudo` operations).

---

### Description

This script automates the process of syncing not-yet-listened music albums from your local beets music library to a Sandisk media player's mounted storage (presumed automounted at `/run/media/matias/EC95-4FBB/Music`).  
It performs the following actions:

- Queries your beets library for albums marked as unplayed (`status:0`).
- Calculates their disk usage.
- Randomly drops artists from the transfer list until the sum of albums fits within your defined device space limit (`MAX_SPACE`).
- Removes old albums from the device that are no longer in the transfer list.
- Cleans up empty folders on the device.
- Creates any necessary folder structure for new albums.
- Uses `rsync` to efficiently sync albums over to the device, ensuring that only new/updated files are transferred.

It is primarily useful for workflow automation (such as from a terminal or invoked in a `qtile` keybinding), targeting creative control over your portable music collection while not exceeding device capacity.

---

### Usage

- Ensure the device is mounted at the path configured in `player_path`.
- Ensure your beets library is up to date, and that `beet` CLI works.
- Run the script directly:

```
python ~/.scripts/bin/sandisk_music_transfert.py
```

- For regular usage, consider a keybinding in your `qtile` config:

```python
Key([], "F10", lazy.spawn("python ~/.scripts/bin/sandisk_music_transfert.py"))
```

_Note: If you uncomment `getpass`, you may be prompted for your sudo password when deleting old files on the device._

---

> [!WARNING]
> **Critique:**  
> - The script references `password` in `proc.communicate(password.encode())` but this variable is commented out, so the script will crash if deletions are necessary—uncomment and assign `password` before use.
> - The construction of DataFrames using `pd.DataFrame` has a faulty syntax (`'path' : album_paths` dict keys must be in curly braces, not lambda form). This will cause runtime errors.
> - Usage of `os.path.isdir(i)` in the context `i in os.listdir(player_path)` is incorrect; `i` should be an absolute path.
> - Error handling is minimal; if `rsync` or `mkdir` fails mid-process, script does not recover gracefully.
> - The script assumes all music folders strictly follow a consistent naming pattern and directory structure.
> - Some string interpolations/f-strings use a wrong syntax (`f"len(album_paths)}..."`).
> - Filtering out the 'cover.jpg' file in 'format' list comprehension is done incorrectly.
> - Hardcoding file paths and device ID reduces portability. Consider moving configurations to the script’s header or to a config file for easier edits.
> - Consider running dry-runs first when developing automation that deletes data.  
> **Recommended:** Refactor, add argument parsing for flexibility, robust error handling, and test with smaller directories first.