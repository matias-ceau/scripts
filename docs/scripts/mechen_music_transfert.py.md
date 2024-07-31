# Mechen Music Transfer Script (mechen_music_transfert.py)

---

Custom script to copy music to the Mechen device.

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
- `beet` (beets music library manager)
- `pandas` (Python data analysis library)
- `rsync` (file transfer tool)
- `du` (disk usage utility)

<a name="description" />

### Description

<a name="overview" />

#### Overview

This script serves as a custom utility for transferring unlistened music albums from a local directory to a device referred to as "Mechen." The script identifies unlistened albums, checks their total size against a predefined maximum space limit, and manages file transfers accordingly.

Key functionalities include:
- Retrieving a list of unlistened albums using the `beet` command.
- Calculating and filtering albums based on their size.
- Performing cleanup of existing albums on the Mechen device as needed.
- Creating necessary folders and synchronizing files using `rsync`.

<a name="usage" />

#### Usage

To run this script, execute it from terminal:

```bash
python3 /home/matias/.scripts/mechen_music_transfert.py
```

You will be prompted to enter a password for sudo access. The script will automatically handle the copying and cleanup processes based on the defined logic.

The music directory is assumed to be `/home/matias/music`, while the destination is set to `/home/matias/MECHEN`. Ensure these paths are correctly set in your environment.

<a name="examples" />

#### Examples

1. **Basic Execution:**
   To start transferring music to the Mechen, simply run:
   ```bash
   python3 /home/matias/.scripts/mechen_music_transfert.py
   ```

2. **Result:**
   You should see output indicating the number of unlistened albums found and the progress of the rsync operation.

---

<a name="notes" />

### Notes

- Ensure that `sudo` privileges are available since the script requires permission to delete files and create directories.
- If the total album size exceeds the defined `MAX_SPACE` (50 MB in this case), the script will randomly drop albums by artist until the size fits within the limit.

> **Critique:** 
> 
> - The script uses `sudo` for the `mkdir` and `rsync` commands, which may create security concerns. Consider implementing user-level operations or confirming necessary permissions beforehand.
> - Error handling for subprocess calls is minimal; it might be beneficial to add checks for the success of each operation and provide more informative error messages where applicable.
> - Consider allowing configuration options for the music directory and destination path rather than hardcoding them. This would increase flexibility for different user environments.