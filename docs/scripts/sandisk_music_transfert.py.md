# Sandisk Music Transfer Script

---

**sandisk_music_transfert.py**: A script to transfer and manage music files to a Sandisk media player

---

### Dependencies

- `os`: Standard library for operating system interfaces.
- `random`: Standard library for generating random selections.
- `subprocess`: To run shell commands from within the script.
- `getpass`: For securely obtaining user passwords (Currently commented out).
- `pandas`: A popular data manipulation library used to handle music file data.
- `beet`: A music library manager used to query not listened album paths.

### Description

The **Sandisk Music Transfer** script automates the process of transferring music albums to a Sandisk media player, ensuring that the total size does not exceed a defined maximum storage space (`30 MB` in this script). It starts by querying Beets (`beet`) for albums marked as "not listened to." It collects the album paths, calculates their sizes, and organizes them in a pandas DataFrame. It then removes any unsupported formats and checks the size constraint, removing random artists' albums if necessary to fit within storage space.

Additionally, the script checks the connected media player for albums already present and removes those not in the current selection list. It ensures that directories for each album are created on the media player and uses `rsync` to synchronize the music files efficiently.

### Usage

To use this script, you need to:
1. Ensure that Beets is configured and you have music that is tagged as "not listened to."
2. Assign execution permissions to the script:
   ```bash
   chmod +x /home/matias/.scripts/bin/sandisk_music_transfert.py
   ```
3. Execute the script from the terminal:
   ```bash
   /home/matias/.scripts/bin/sandisk_music_transfert.py
   ```
4. You might want to run it interactively or assign it to a keybinding in your qtile setup for regular use.

---

> [!CAUTION] 
> - The `sudo` password input is currently disabled in the script (commented). Consider implementing a secure way to handle this if you intend to use it.
> - The script assumes that album paths and formats are correct and existing, and does not handle potential errors such as non-existent paths or missing format files.
> - Consider adding verbosity options or error handling to provide better feedback during script execution.