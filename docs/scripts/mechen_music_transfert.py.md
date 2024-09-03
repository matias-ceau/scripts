# Mechen Music Transfer Script

---

**mechen_music_transfert.py**: Custom script to copy music to Mechen

---

### Dependencies

- `pandas`: A powerful data manipulation library used to create and manage the album data as a DataFrame.
- `beet`: A command-line tool for managing music collections which is used here to retrieve album information.
- `sudo`: Used for executing commands that require elevated permissions. Ensure your user can execute sudo without needing a password.

### Description

This script is designed to facilitate the transfer of music albums to a Mechen mp3 player. It leverages various Python libraries and command-line tools to streamline the entire process. 

Upon execution, the script retrieves the list of unlistened albums from a personal music library using the `beet` command. It calculates the size of these albums and checks against the device's maximum storage capacity. Using a data frame (via `pandas`), it identifies albums on the device to determine which albums can be safely removed in order to make space for new music.

Key functionalities include:

- **Album Size Calculation**: Calculates the total size of unlistened albums to determine storage requirements.
- **Random Album Drop**: If the total size exceeds defined limits, random albums by different artists are dropped until the size is within the limit.
- **File Management**: Ensures that only relevant albums remain on the device; removes unnecessary ones and cleans up empty folders.
- **Directory Creation**: Automatically creates the artist and album directories on the device.
- **Music Transfer**: Utilizes `rsync` for efficiently transferring the music files to the specified path on the Mechen player.

### Usage

To run the script, execute the following command in your terminal:

```bash
python3 /home/matias/.scripts/mechen_music_transfert.py
```

During the execution, you will be prompted to enter your password for sudo permissions. The script will provide feedback on its progress, including how many albums are processed. 

Example interaction:

```
Password pliz: ********
3 not listened to
Total size equal to 1.23 GB
Creating folders...
Rsyncing artist/album (1/3)
Rsyncing artist/album (2/3)
Rsyncing artist/album (3/3)
```

---

> [!TIP] 
This script could be improved by adding error handling for subprocess calls to capture and display error messages, especially for file operations. This will help in debugging issues like permission errors or if the `beet` command does not return expected results.