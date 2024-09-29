# Mechen Music Transfer Script

---

**mechen_music_transfert.py**: Custom script to copy music to Mechen

---

### Dependencies

- `pandas`: A data manipulation library to handle data frames conveniently.
- `beet`: This script uses Beets to query music libraries (ensure Beets is installed and configured).
- `rsync`: A fast and versatile file copying tool, used for syncing files with remote destinations or directories.

### Description

This Python script automates the process of transferring music albums from a local directory to a specified music player device (the Mechen). It calculates which albums haven't been listened to, determines their sizes, and ensures the total size does not exceed the player's maximum storage limit.

Key functionalities include:

- **Password Protection**: The script prompts for a password prior to executing operations that require superuser access.
- **Folder Management**: It creates the necessary directory structure on the Mechen for each album being transferred.
- **Space Management**: If the total size of albums exceeds the maximum storage space, it randomly drops albums until the size fit within the limit.
- **Cleaning Up**: The script removes albums from the Mechen that are not in the source music directory and also cleans up empty artist folders.

### Usage

To execute this script, run it from the terminal after ensuring all dependencies are installed:

```bash
python3 /home/matias/.scripts/mechen_music_transfert.py
```

You will be prompted to enter your password before the script proceeds with copying the music. 

**Important Points:**
- The script utilizes `sudo` for removing files and creating directories, so ensure your user has sudo privileges.
- Modify the `MAX_SPACE` variable if your Mechen device's available space is different from the predefined 50 MB.

When executed, the script will provide output indicating the number of albums not listened to, their total size, and the progress of the rsync operation.

---

> [!TIP] 
> Consider adding error handling for subprocess calls to gracefully manage any potential failures (e.g., if a directory cannot be created or if an album cannot be transferred). Also, logging the results instead of just printing them can help track long-term use and issues.