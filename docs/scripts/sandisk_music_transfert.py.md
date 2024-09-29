# Sandisk Music Transfer Script

---

**sandisk_music_transfert.py**: A script to transfer music albums to a Sandisk media player.

---

### Dependencies

- `pandas`: A data manipulation library used for handling album data and sizes.
- `subprocess`: A standard library for spawning new processes, used for shell commands.
- `random`: A module used for random selections in the script.
- `getpass`: A module for securely handling input of passwords.

### Description

This Python script automates the process of transferring music albums from a local music directory to a Sandisk media player. It checks for albums that have not been listened to using the `beet` music tagging tool and manages the transfer based on the capacity of the Sandisk device.

Key functionalities include:

1. **Album Query**: It gathers a list of albums marked as unwatched using `beet`, capturing their paths for further processing.
2. **Size Calculation**: The script assesses the sizes of the albums to ensure that the total does not exceed the maximum capacity of the Sandisk player (set to 30MB in this case).
3. **DataFrame Management**: Utilizing `pandas`, the script maintains a DataFrame that organizes album paths, artists, formats, and sizes while filtering out unsupported audio formats.
4. **Artist Dropping Logic**: To manage space, a random artist is dropped if the total size exceeds the maximum limit.
5. **Device Clean Up**: It checks and deletes any unnecessary albums from the Sandisk device.
6. **Folder Creation**: It generates artist and album folders in the Sandisk device's music directory.
7. **File Synchronization**: Finally, it uses `rsync` to transfer the selected albums to the Sandisk player.

### Usage

To run the script, simply execute it from the terminal:

```bash
python3 /home/matias/.scripts/sandisk_music_transfert.py
```

Before executing, ensure you have the following:

1. Your bulk music collection is located in `/home/matias/music/`.
2. The Sandisk device is mounted at `/run/media/matias/EC95-4FBB/`.
3. Update the `password` input line (commented out) for any required permission for deletions if necessary.
4. The necessary libraries (`pandas`, etc.) are installed.

The script can be linked to a keybinding in your window manager (qtile) for ease of use.

---

> [!TIP] 
> The script could be further improved by handling potential exceptions from subprocess calls (e.g., if folders do not exist or `rsync` fails), logging actions to help debug issues, and modifying the method of acquiring the password to improve security while avoiding plain text usage. Also, consider enhancing the temperature management logic for dynamic storage needs.