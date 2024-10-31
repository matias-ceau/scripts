# Sandisk Music Transfer Script

---

**sandisk_music_transfert.py**: Script to transfer and manage music files on a Sandisk media player

---

### Dependencies

- `python3`: The script is written in Python and requires Python 3.x.
- `subprocess`: A standard Python module used for executing shell commands.
- `pandas`: A Python data manipulation library. Install via `pip install pandas`.
- `random`: A Python module used to make random selections.
- `getpass`: Used to handle password inputs securely.
- `beet`: Expected to be part of `beets`, a music library manager, for querying songs. Install via `pip install beets`.

### Description

This script automates the process of transferring music files from your computer to a Sandisk media player. The script is designed to work on a typical Arch Linux setup with the qtile window manager. It identifies albums marked as "not listened to" using `beets`, calculates their sizes, filters albums based on supported music formats (AAC, M4A, FLAC, MP3, WAV, and WMA), and ensures that the total size does not exceed the predefined space limit on the media player.

The script employs several key techniques:
- **Shell Command Execution**: Using the `subprocess` module, shell commands are executed to query and handle files and directories.
- **DataFrame Management**: `pandas` module manages data for albums and music files.
- **Filesystem Operations**: Handles directories and files on the media player.
- **Random Sampling**: Randomly chooses artists to drop when space exceeds the limit.

### Usage

1. **Ensure all dependencies are installed.**
2. **Run the script in a terminal:**
   ```bash
   python /home/matias/.scripts/bin/sandisk_music_transfert.py
   ```
3. **Enter your password if prompted.** The script uses `sudo` for managing media player files and directories.
4. **The albums will be transferred using `rsync` to ensure efficient copying.**

The script assumes `/run/media/matias/EC95-4FBB/Music` is the mount point of your Sandisk device.

---

> [!NOTE]
> The script contains some areas that could be improved:
> - Hard-coded paths (`/run/media/matias/EC95-4FBB/Music` and `/home/matias/music`) should be parameterized for flexibility.
> - Error handling could be added for subprocess executions to capture and manage exceptions or errors.
> - Inline comments suggest password handling through the `getpass` library, yet commented out. Ensure security credentials management per your needs.
