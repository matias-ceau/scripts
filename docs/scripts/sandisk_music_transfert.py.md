# Music Transfer to Sandisk Media Player

---

**sandisk_music_transfert.py**: Transfers music files to a Sandisk media player while managing storage capacity and file formats.

---

### Dependencies

- `python3`: Script requires Python 3 to run.
- `subprocess`: Utilizes system-level scripts and commands.
- `pandas`: For managing dataframes of music files - install with `pip install pandas`.
- `random`: Used to randomly select artists to drop if the transfer exceeds capacity.
- `getpass`: Allows secure password prompts for elevated operations.
- `beet`: Needs `beets` music library manager to query unplayed albums.

### Description

This script automates transferring music files from your computer to a Sandisk media player, ensuring that the files fit within a specified storage capacity and utilizing `rsync` for efficient file syncing. It works within the Arch Linux environment, specifically suited to the user's setup with `qtile`.

**Key Features:**
- **Capacity Management:** Transfers are prioritized within the `MAX_SPACE` constraint (30 GB by default).
- **Format Selection:** Supports common audio formats like `aac`, `m4a`, `flac`, `mp3`, `wav`, and `wma`.
- **Dynamic Reductions:** Random album drops are performed if the transferred data exceeds the player’s allotted space.
- **Device Cleanup:** It also cleans up the media player by removing unnecessary albums and empty directories.

### Usage

Before running the script, ensure that your Sandisk player is correctly mounted, and the music library is managed using `beet`. Then, execute the following command:

```bash
python3 /home/matias/.scripts/sandisk_music_transfert.py
```

This will:
1. Identify unplayed albums in your music library.
2. Calculate their sizes and format them using a `pandas` DataFrame.
3. Prune albums by randomly selecting artists if necessary for space constraints.
4. Remove non-listed albums from the player.
5. Transfer the required albums using `rsync`.

The script may require `sudo` privileges to delete or create directories, which calls for a password input using the commented-out `getpass` method.

---

> [!TIP] Consider catching exception blocks, particularly around subprocess calls, to manage failures and inform the user effectively. Also, refactoring the commented password input feature could enhance script security and usability. Additionally, paths and configurations could be parameterized to improve flexibility and portability of the script.