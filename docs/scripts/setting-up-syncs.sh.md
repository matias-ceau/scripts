# Automated Mega Sync Setup

---

**setting-up-syncs.sh**: Automates syncing of various directories to a Mega backup location based on the hostname.

---

### Dependencies

- `mega-sync`: This script relies on the `mega-sync` command, which is presumably used to synchronize local directories with a Mega cloud storage account. Ensure `mega-sync` is installed and properly configured on your system.

### Description

This script is designed to facilitate automated syncing of user directories to specific backup locations on a Mega cloud storage service. It intelligently determines the backup paths based on the machine's hostname using `hostnamectl`. 

The script categorizes the directories into:
- Standard XDG directories such as Desktop, Downloads, and more.
- A specific "Notes" directory located at `$HOME/PKM`.
- Additional directories are conditionally synced depending on whether the hostname is `karhu` or `karjala`. For instance, `karhu` synchronizes the `UnifiedLibrary`, while `karjala` handles larger media files.

This enables seamless and automated backup configurations tailored to machine-specific setups.

### Usage

Ensure this script has execution permissions. Run the script from the terminal using the following command:
```bash
bash /home/matias/.scripts/setting-up-syncs.sh
```

To run the script automatically, consider adding it to your startup applications in qtile or setting up a cron job.

Example cron job, run every night at 2am:
```cron
0 2 * * * /home/matias/.scripts/setting-up-syncs.sh
```

This script can also be triggered by keybindings in qtile if interactive manual execution is required.

---

> [!TIP]
> 
> - Make sure `mega-sync` is properly configured with authenticated access to your Mega account. 
> - It’s recommended to handle errors or logs in the script to diagnose any synchronization issues easily. Currently, it executes `mega-sync` commands without verifying their success or failure.
> - Consider implementing checksum or timestamp logic before syncing to avoid unnecessary data transfer, which could potentially optimize the synchronization process.
> - Plan for the uncommented `TODO` items to ensure they do not impede the backup process inadvertently.