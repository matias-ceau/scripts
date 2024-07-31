# Sandisk Music Transfer Script

---

**[sandisk_music_transfert.py](/sandisk_music_transfert.py)**: Python script to transfer music to a Sandisk media player from a local library.

---

### Dependencies

- `pandas`: A powerful data manipulation library in Python, used for creating and handling data frames.
- `beet`: A command-line tool for managing music collections, here it retrieves albums' data.
- `rsync`: Utility for efficiently transferring and synchronizing files across computer systems.
  
### Description

This Python script automates the process of transferring music files from a local directory to a Sandisk media player, ensuring that the total size of the transferred albums does not exceed the player's maximum storage capacity. It integrates with `beet` to retrieve albums that have not been listened to, and employs `pandas` to manage and filter these albums based on their formats and sizes.

The script starts by defining constants like the maximum storage space for the Sandisk player and the target path where music will be transferred. It fetches a list of albums not listened to and their respective sizes using the `beet` tool.

The logic includes several crucial steps:
1. **Filtering and Data Preparation**: It constructs a data frame containing album paths, artists, formats, and sizes. Unsupported formats are filtered out.
2. **Size Management**: A function checks if the total size exceeds the defined limit. If it does, albums from random artists are dropped until the total size is permissible.
3. **Transfer Logic**: Before transferring, the script checks for existing albums on the Sandisk device, removes unnecessary ones, and cleans up empty directories.
4. **Final Transfer**: It creates the necessary folder structure on the device and uses `rsync` to perform the transfer, providing feedback on progress.

### Usage

Run the script from the terminal. Here’s a sample command:

```bash
python3 /home/matias/.scripts/sandisk_music_transfert.py
```

Ensure you have the required dependencies installed (use `pip install pandas` for pandas and make sure `beet` and `rsync` are available in your system). The script will prompt for a password if it needs to run commands requiring elevated privileges.

---

> [!TIP] 
> Consider adding error handling for subprocess calls to improve robustness. For example, checks can be implemented to ensure that the `rsync` command was successful, and feedback can be given to the user in case of failure. Additionally, you might want to clear up the commented part where a password is fetched; it can be useful to implement secure password handling practices to enhance security.
