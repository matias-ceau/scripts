# Sandisk Music Transfer Script

---

**sandisk_music_transfert.py**: A script to transfer unlistened music albums to a Sandisk media player.

---

### Dependencies

- `pandas`: A library providing high-performance data manipulation and analysis tools for Python.
- `beet`: Music management software used to retrieve album paths based on defined criteria.
- `rsync`: A utility for efficiently transferring and synchronizing files across directories.
- `subprocess`: Built-in Python module for spawning new processes and connecting to their input/output/error pipes.

### Description

This script automates the transfer of unlistened music albums from the local machine to a Sandisk media player. It utilizes `beet` to list albums that have not been listened to, calculates their sizes, and manages the transfer while respecting the device's storage constraint.

**Key functionality includes:**
- Retrieving paths of unlistened music albums using `beet`.
- Storing information such as paths, sizes, and artists in a pandas DataFrame for easy manipulation.
- Checking if the total size of the albums exceeds the storage limit of the Sandisk device and removing albums randomly if needed, ensuring a fit within the defined `MAX_SPACE`.
- Deleting existing albums on the device that are not present in the upcoming transfer to free space.
- Creating necessary directories for the music albums before transferring the files using `rsync`.

### Usage

To execute the script, ensure that you have the required dependencies installed and run the following command in the terminal:

```bash
python3 /home/matias/.scripts/sandisk_music_transfert.py
```

Before running, substitute `getpass` with your password directly or uncomment the password prompt. The script will then process and transfer your music to the Sandisk media player.

**Example steps:**
1. Ensure you have unlistened albums in the specified music directory: `/home/matias/music/`.
2. Connect your Sandisk media player to your system and verify the `player_path`.
3. Execute the script as shown:

```bash
python3 sandisk_music_transfert.py
```

4. Monitor the output for the albums being synced.

---

> [!TIP]
> The script should improve its handling for potential errors, such as checking if the Sandisk media player is properly mounted before proceeding with the transfer. Additionally, consider implementing logging functionality to record the file manipulation activities for future audits. Using `try` and `except` blocks around subprocess calls can also help in gracefully managing errors encountered during execution.