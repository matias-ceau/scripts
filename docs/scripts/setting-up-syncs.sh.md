# Setting Up Syncs

---

**setting-up-syncs.sh**: Automates syncing specified directories with a cloud service.

---

### Dependencies

- `mega-sync`: This is the command-line client for MEGA, a cloud storage service. Make sure it is installed and configured on your system.

### Description

The `setting-up-syncs.sh` script is designed to facilitate the backup of various user directories to a predefined structure in a MEGA cloud storage account. It dynamically creates backup paths based on the system's hostname, ensuring that backups are organized by device.

The script performs the following actions:

1. **XDG Folders**: It synchronizes common XDG directories such as Desktop, Downloads, Documents, Music, Pictures, and Videos from the user's home directory to the corresponding backup paths on MEGA.
   
2. **Notebooks Folder**: It specifically syncs the `PKM` (Personal Knowledge Management) folder to a designated location in cloud storage.

3. **Host-Specific Syncs**: It includes conditional logic to handle two different hostnames: `karhu` and `karjala`. Depending on the hostname, specific libraries and large folders are synced to ensure the correct files are backed up for each device.

### Usage

To use this script, follow these steps:

1. **Ensure `mega-sync` is installed**: Verify that you can run the command:
   ```bash
   mega-sync --version
   ```

2. **Run the script**: You can execute this script in your terminal:
   ```bash
   bash /home/matias/.scripts/setting-up-syncs.sh
   ```

3. **Auto-sync Setup**: If you run this frequently, consider setting it up to run automatically using a cron job or creating a keybinding in your window manager.

Example of setting up a cron job to run it daily at midnight:
```bash
0 0 * * * /bin/bash /home/matias/.scripts/setting-up-syncs.sh
```

---

> [!TIP] 
> The script could be improved by adding logging to track the sync process and any errors encountered. Additionally, you might want to consider implementing flags that allow for selective syncing of certain directories without modifying the script directly. This could also prevent accidental overwrites during backups.