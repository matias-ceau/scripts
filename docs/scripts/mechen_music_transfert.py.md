# Mechen Music Transfer (mechen_music_transfert.py)

---

Custom script to copy music to Mechen

---

### Table of contents

- [Dependencies](#dependencies)
- [Description](#description)
    - [Overview](#overview)
    - [Usage](#usage)
    - [Examples](#examples)
- [Notes](#notes)

---

<a name="dependencies" />

### Dependencies

- Python 3
- Pandas library (`pip install pandas`)
- Beet (for managing music libraries)
- Rsync (for efficient file copying)

<a name="description" />

### Description

<a name="overview" />

#### Overview

The `mechen_music_transfert.py` script automates the process of transferring music albums that have not yet been listened to from a local music directory to a specified music player (named 'Mechen'). It checks available disk space, identifies the unchecked albums, and manages the transfer accordingly. The script utilizes several utilities such as `subprocess` to run system commands and `pandas` for efficient data handling. 

Key functionalities include:
- Gathering not listened to albums using Beet.
- Calculating total sizes of these albums to ensure they fit within the device’s constraints (50 MB).
- Randomly dropping albums if the total size exceeds the limit.
- Creating necessary directories on the Mechen device.
- Using `rsync` to perform the actual file transfer securely.

---

<a name="usage" />

#### Usage

To use this script, run it in a terminal:

```bash
python3 /home/matias/.scripts/mechen_music_transfert.py
```

You will be prompted for a password to grant necessary permissions for file operations. Make sure that the correct paths are set for your music directories and player.

You can also automate this script by binding it to a key in your window manager, allowing you to initiate music transfers quickly.

<a name="examples" />

#### Examples

1. **Run the script**:
   ```bash
   python3 /home/matias/.scripts/mechen_music_transfert.py
   ```

2. **Check output**:
   ```text
   3 not listened to
   Total size equal to 0.5 GB
   Creating folders...
   Rsyncing Artist/Album (1/3)
   ```

---

<a name="notes" />

### Notes

- Ensure that the output paths in the script correctly reflect your music library structure to avoid errors.
- The script will permanently remove albums from the device if they are no longer present in the source directory, so use with caution.
- This script requires `sudo` permissions because it performs file operations that typically require elevated privileges.

> **Critique**: 
> The script currently uses a synchronous approach that relies on subprocess calls for every command. This can make the script slow, especially with a large number of albums. Consider utilizing multi-threading to handle the file transfers and deletions more efficiently. Additionally, the use of plain text passwords poses security risks; you might look into more secure methods of handling passwords.