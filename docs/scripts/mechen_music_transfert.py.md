# Mechen Music Transfer Script

---

**[mechen_music_transfert.py](mechen_music_transfert.py)**: Custom script to copy music to Mechen

---

### Dependencies

- `pandas`: A powerful data manipulation and analysis library for Python.
- `beet`: The MusicBrainz Picard application that manages music libraries.
- `du` command: Used to estimate file space usage (installed by default on Linux).
- Python environment: This script requires Python 3.

### Description

The `mechen_music_transfert.py` script is designed for music enthusiasts using the Mechen MP3 player. Its primary function is to efficiently transfer music files to the device while managing storage constraints. 

The script starts by prompting the user for their password to allow for necessary file operations that require superuser privileges. It defines a maximum space limit (`MAX_SPACE`) of 50MB. Using the `subprocess` module, it retrieves a list of albums that have not been listened to from the local music directory using `beet`.

The script calculates the sizes of these albums and constructs a DataFrame with pertinent information, including the path, artist name, and album size. It ensures that the total size of the selected albums does not exceed the defined limit by utilizing functions that randomly drop albums by artist.

The script also identifies albums that already exist on the Mechen device, removes albums that are no longer needed, and cleans empty folders. After creating the necessary artist and album directories on the device, it uses `rsync` to transfer the new files, preserving the file structure.

### Usage

To use the script, execute the following command in the terminal:

```bash
python3 /home/matias/.scripts/mechen_music_transfert.py
```

- During execution, you will be prompted to enter your password.
- The script will output the number of albums identified and their total sizes.
- It will report on which albums are being synced and provide feedback throughout the process.

For best results, ensure that:
- You have sufficient permissions for file operations.
- The `pandas` library and the `beet` music client are installed on your Arch Linux system.

---

> [!TIP] 
> This script assumes a specific directory layout for the music files. It may not handle cases where the directory structure differs. Consider adding error handling to manage unexpected scenarios, like missing directories or files. Moreover, using `os.path` methods for path manipulations may improve cross-platform compatibility (if needed in the future).
