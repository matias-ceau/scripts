# Mechen Music Transfer Script

---

**mechen_music_transfert.py**: Automates syncing of unlistened music albums to a music player device.

---

### Dependencies

- `python3`
- `beet`: A music library manager for querying and managing music files.
- `pandas`: Data manipulation library used for handling album data in DataFrames.
- `rsync`: Utility for synchronizing files between directories.
- `subprocess`, `os`, `random`, `getpass`: Standard Python libraries for system commands, environment interaction, randomness, and password input.

### Description

This script is designed to transfer music albums from your Arch Linux machine to a connected device named "Mechen". Specifically, it only transfers albums that haven't been listened to, as determined by a Beets query (`beet ls -ap status:0`).

1. **Password Input**: It securely prompts for a sudo password to execute subsequent commands with elevated privileges.
2. **Space Calculation**: The script assumes a maximum space limit for the music player set at 50 MiB (`MAX_SPACE`), and calculates the total space needed for the unlistened albums.
3. **Data Management**: Utilizes `pandas` to store and handle album information, ensuring that only the necessary music is copied over.
4. **Folder Management**: Cleans up unnecessary albums and directories on the device, creates necessary directory structures using `mkdir`.
5. **Data Transfer**: Transfers the albums with `rsync`, ensuring careful updating and deleting of files to keep the player content synchronized with the unlistened albums.

### Usage

To run this script, make sure your device "Mechen" is mounted at `/home/matias/MECHEN`, and your music library is located at `/home/matias/music/`. Simply execute the script in a terminal:

```bash
python /home/matias/.scripts/mechen_music_transfert.py
```

You will be prompted to enter your sudo password for authentication purposes.

This script can be run interactively in the terminal. It's well-suited to being executed as needed when you wish to sync your music.

---

> [!TIP]
> The script assumes the sudo password will be the same throughout its execution, which can be risky if any error occurs or if multiple password prompts are required. It might be improved by using a more secure way of handling privileged commands to avoid storing the password in plaintext or re-prompting securely as needed.
> Additionally, the space calculation is quite rudimentary and does not account for variations in file sizes or potential space on the device, which might lead to issues when the hard limit is reached. A more dynamic checking mechanism could be beneficial.