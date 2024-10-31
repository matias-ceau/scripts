# Mechen Music Transfer Script

---

**mechen_music_transfert.py**: Custom script to copy music to Mechen

---

### Dependencies

- `python3`: Python version 3 is required to execute the script.
- `beet`: Used to query unlistened albums from a collection managed by Beets.
- `sudo`: Executes commands with root privileges.
- `rsync`: Synchronizes files between the local directory and the player path.
- `pandas`: Used for data manipulation and analysis in Python.
- `getpass`: Safely handles password input without echoing.

### Description

This script efficiently transfers music albums from a local music library to a connected music player device (Mechen) located at `/home/matias/MECHEN`. It selects albums that haven't been listened to, based on a Beets query, and ensures that the total size of these albums does not exceed a specified limit (`MAX_SPACE` of 50 MB). Albums already on the device that are not included in this transfer set are removed to make space for the new selections. 

The script performs the following tasks:

- Queries unlistened albums using `beet ls -ap status:0`.
- Removes albums from the selection until their total size fits within the storage limit.
- Deletes non-required albums from the device.
- Ensures empty folders are removed from the device.
- Creates the necessary directories for new albums.
- Utilizes `rsync` to transfer and synchronize the selected albums to the player, with the `--delete` option ensuring directory contents are accurately mirrored.

### Usage

Run the script in a terminal. It requires root privileges for file operations, so you might want to run it using `sudo`:

```bash
sudo python3 /home/matias/.scripts/bin/mechen_music_transfert.py
```

**Note:** The script is interactive; it will prompt you to enter your password, which is critical for executing privileged commands.

---

> [!IMPORTANT] 
> - The script can be further optimized by parallelizing rsync operations to expedite the transfer process.
> - Consider implementing a logging mechanism to better understand the script's actions and any encountered errors.
> - Be cautious when using `sudo` with `Popen`; ensure password handling and command inputs do not expose sensitive information.