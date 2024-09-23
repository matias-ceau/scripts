# Setting Up Syncs

---

**setting-up-syncs.sh**: Syncs user folders to a mega backup directory structure.

---

### Dependencies

- `mega-sync`: A command-line utility provided by MEGA.nz for synchronizing folders with MEGA cloud storage. Make sure it is installed and configured for your user.

### Description

The `setting-up-syncs.sh` script is designed to simplify the process of backing up user directories to a designated MEGA cloud storage structure. It dynamically creates backup paths based on the hostname of the system, ensuring that individual configurations don’t conflict. This makes it suitable for users who may have multiple systems or need specific organization within their cloud backups.

Here's what the script does:

1. **Hostname Retrieval**: It fetches the hostname using `hostnamectl`, which ensures the path for backups is unique per device.
2. **Systematic Syncing**: It synchronizes multiple user directories such as `Desktop`, `Downloads`, `Templates`, `Share`, `Documents`, `Music`, `Pictures`, and `Videos` with corresponding paths in the MEGA backup structure located under `/BACKUPS/[hostname]/`.
3. **Conditional Syncing**: If the hostname is "karhu", it additionally syncs specific directories (`PKM`, `UnifiedLibrary`, and some mounted directories) unique to that system.

### Usage

To use the script, simply execute it via the terminal:

```bash
bash /home/matias/.scripts/setting-up-syncs.sh
```

Make sure to review the script if you need to modify the directories or paths being synced.

---

> [!TIP]  
> Consider adding error handling to the script to manage failures during sync operations, such as network issues or invalid paths. Additionally, you may want to log the output of each sync operation to help monitor the success of backups or troubleshoot any issues that arise.