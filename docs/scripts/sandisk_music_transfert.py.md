# Sandisk Music Transfer (sandisk_music_transfert.py)

---

This script transfers music albums to a Sandisk media player efficiently.

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
- `pandas` library
- Access to the Beet music library
- `rsync` utility
- `du` command

<a name="description" />

### Description

<a name="overview" />

#### Overview

The Sandisk Music Transfer script is designed to help users manage their music collection efficiently on a Sandisk media player. It utilizes music libraries managed by Beet to transfer only the albums that haven't been listened to yet and fits within the designated storage limits of the media player.

The script begins by defining a maximum space of 30MB for the music transfer. It queries the Beet library for albums marked as not listened to, computes their sizes, and forms a DataFrame using `pandas`. This DataFrame allows various operations such as filtering out unsupported audio formats and ensuring the total size of the selected albums does not exceed the media player’s storage limit.

If the combined size of the albums exceeds the limit, the script randomly drops an artist’s albums until it fits. It further checks which albums are already on the device and removes those that are not in the current selection to manage space efficiently.

Finally, the script creates the necessary folder structure on the Sandisk player and uses `rsync` to transfer the selected albums.

---

<a name="usage" />

#### Usage

To run this script, execute it in a terminal by simply calling:

```bash
python3 /home/matias/.scripts/sandisk_music_transfert.py
```

Ensure you have the relevant dependencies installed and Beet configured to track your music library. The script may prompt for a password to delete albums from the device if necessary.

<a name="examples" />

#### Examples

- Execute the script:
    ```bash
    python3 /home/matias/.scripts/sandisk_music_transfert.py
    ```
- Adjust the `MAX_SPACE` variable to change transfer size limits.

---

<a name="notes" />

### Notes

- The script currently deletes music albums from the Sandisk device that are not in the selection before transferring new music. This may lead to data loss if not managed carefully.
- Be cautious with the `sudo` command used for removing files since it requires a password and has broader implications for system security.

> **Critique:**  
> The script hardcodes paths and the maximum size limit which could be parameterized for better flexibility. The password is currently commented out; it may be a good idea to implement a secure way to handle this, ensuring no sensitive information is exposed in the code. Additionally, there's a typo in the `print` statements, which could lead to runtime errors.