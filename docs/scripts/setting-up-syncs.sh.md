# Setting Up Syncs

---

**setting-up-syncs.sh**: Automates syncing of user directories to a backup location.

---

### Dependencies

- `mega-sync`: This is the command-line tool for the Mega.nz cloud storage that allows you to sync files and directories.

### Description

The `setting-up-syncs.sh` script is a bash script designed to facilitate the backup of important user directories to a specified location on a cloud service using `mega-sync`. The script utilizes the hostname of the machine to create structured folders within the `/BACKUPS` directory, ensuring that backed up files are organized by hostnames.

The directories that are being backed up include:
- Desktop
- Downloads
- Templates
- Share
- Documents
- Music
- Pictures
- Videos

For each of these directories, the script runs a separate `mega-sync` command to synchronize the contents from the local user's home directory to the corresponding backup directory on Mega.nz. By isolating each directory sync command, the script allows for independent transfers, which can reduce overall sync conflicts and improve error detection if syncing fails.

### Usage

To use this script, it needs to be executed in a terminal. Make sure that `mega-sync` is installed and configured properly for your user account before running the script.

Run the script with the following command:

```bash
bash /home/matias/.scripts/setting-up-syncs.sh
```

You can also make the script executable and run it directly:

```bash
chmod +x /home/matias/.scripts/setting-up-syncs.sh
/home/matias/.scripts/setting-up-syncs.sh
```

For regular backups, you might want to set this script to run automatically using a cron job or bind it to a key in your window manager (Qtile).

---

> [!TIP]
> Consider adding error checking after each `mega-sync` command to ensure that each sync operation completes successfully. You might also want to include logging functionality to record the outcome of each operation for troubleshooting purposes. This would help to identify any failures in the synchronization process.