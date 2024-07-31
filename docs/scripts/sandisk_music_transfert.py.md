# Sandisk Music Transfer Script (sandisk_music_transfert.py)

---

Transfer music from the local library to a Sandisk media player.

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
- `subprocess` module (built-in)
- `pandas` library
- Beet (for music library management)
- Rsync (for file transfer)
- Access to a Sandisk media player mounted on `/run/media/matias/EC95-4FBB`

<a name="description" />

### Description

<a name="overview" />

#### Overview

This Python script automates the transfer of music albums to a Sandisk media player, ensuring that only those albums which have not been listened to are included. It leverages the Beet music library management system to identify unlistened music albums and checks both album size and supported formats before transferring files. The script also handles album removal on the device depending on availability.

Key functionalities include:
- Querying not listened to albums using Beet
- Checking available space on the Sandisk player (limited to 30MB)
- Handling file formats (supports 'aac', 'm4a', 'flac', 'mp3', 'wav', 'wma')
- Removing albums from the device that are not in the local library
- Creating required directory structures on the Sandisk player
- Utilizing `rsync` to copy over the files.

---

<a name="usage" />

#### Usage

1. Ensure that your Sandisk media player is connected and recognized at `/run/media/matias/EC95-4FBB`.
2. Have your music collection organized and accessible under `/home/matias/music`.
3. Run the script in a terminal:

   ```bash
   python3 /home/matias/.scripts/sandisk_music_transfert.py
   ```

4. Input your sudo password when prompted for the script to delete unused albums on the Sandisk media player.

<a name="examples" />

#### Examples

- Run the script to initiate music transfer:

   ```bash
   python3 /home/matias/.scripts/sandisk_music_transfert.py
   ```

---

<a name="notes" />

### Notes

- Ensure that your local music directory and the Sandisk device path are correctly set before execution.
- The script currently requires sudo access to remove files on the Sandisk device, which might entail security implications if used carelessly.

> **Critique:** 
> 1. The script assumes that all commands will succeed without error handling, which could lead to issues if, for example, insufficient permissions, non-existent directories, or connectivity problems arise.
> 2. The hardcoded maximum space (30MB) may need to be adjusted based on user requirements.
> 3. The random removal of an artist to fit within space constraints could result in unexpected losses of music; a more systematic or user-controlled approach might be warranted.
> 4. Consider modularizing the code by breaking it into functions to enhance readability and maintainability. 

These improvements can help create a more robust and user-friendly experience.