# Mechen Music Transfer Script

---

**mechen_music_transfert.py**: Custom script to manage music transfer to the MECHEN device.

---

### Dependencies

- `os`: Standard library for interacting with the operating system.
- `random`: Standard library for generating random numbers.
- `subprocess`: Standard library for running system commands via Python.
- `getpass`: Standard library for securely handling password input.
- `pandas`: Python library used for data manipulation and analysis.
- `beet`: Command-line tool to query the music collection.
- `du`: Unix utility to estimate file space usage.
- `rsync`: Tool for efficiently transferring and synchronizing files.

### Description

This script performs automated management of music albums, ensuring only unplayed albums are transferred to the MECHEN device, without exceeding storage limits. 

The script achieves this through the following steps:
1. **Password Prompt**: Asks for a sudo password to perform operations requiring elevated privileges.
2. **Retrieve Album Data**: Uses `beet` to list albums not listened to (`status:0`), providing their paths, sizes, and artists.
3. **Check and Adjust Size**: Ensures the total size of unplayed music does not exceed 50MB. If it does, it randomly excludes artists until the size is reduced under the limit.
4. **Synchronize with Device**: Compares device content, deletes surplus albums, generates necessary folders, and uses `rsync` to update the MECHEN with chosen music collections, ensuring directories are mirrored accurately.

### Usage

1. Ensure you have all dependencies installed (`pandas`, `beet`, `rsync`).
2. Execute the script in the terminal:
   ```bash
   python3 /home/matias/.scripts/bin/mechen_music_transfert.py
   ```
3. You will be prompted to enter your sudo password to allow folder creation, deletion, and file transfer processes.
4. The script will output the progress to the terminal, including the albums being synced.

---

> [!TIP]
> - Consider handling exceptions for subprocess calls to manage errors gracefully.
> - Instead of removing albums randomly, a user interface to prioritize or select albums could enhance usability.
> - The reliance on `sudo` for every operation can be optimized to reduce multiple `sudo` prompts or vulnerabilities associated with passing the password around in the plaintext.