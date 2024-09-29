# Setting Up Syncs

---

**setting-up-syncs.sh**: A script to synchronize directories with a MEGA cloud storage backup.

---

### Dependencies

- `mega-sync`: A command-line utility to synchronize files and folders with MEGA.nz cloud storage. Ensure it is installed and properly configured to use this script.

### Description

This script automates the synchronization of important user directories to a specified backup location on your MEGA cloud storage. It identifies the hostname of the machine using `hostnamectl` and creates backup paths accordingly. 

The script starts by syncing the common XDG directories that typically include user data, such as:

- Desktop
- Downloads
- Templates
- Share
- Documents
- Music
- Pictures
- Videos

In addition, it creates a dedicated synchronization for the "PKM" folder, which is likely a personal knowledge management folder.

The script also includes conditional logic based on the hostname. If the hostname is `karhu`, it syncs additional directories such as `UnifiedLibrary`, a media sharing folder, and specific directories tied to the device. Similarly, for the hostname `karjala`, it syncs other significant folders including larger media files and various device access points.

### Usage

To use this script, ensure it has executable permissions and run it in the terminal. Here are the steps to get it running:

1. Make the script executable:
   ```bash
   chmod +x /home/matias/.scripts/setting-up-syncs.sh
   ```

2. Execute the script:
   ```bash
   /home/matias/.scripts/setting-up-syncs.sh
   ```

This script is best run periodically, either through a manual execution or scheduled with a cron job.

---

> [!TIP]  
> The script assumes that the local directories exist. It would be beneficial to add checks to ensure directories are present before attempting to sync, which would prevent possible errors during execution. Additionally, you might consider logging the output of the sync operations for easier troubleshooting.