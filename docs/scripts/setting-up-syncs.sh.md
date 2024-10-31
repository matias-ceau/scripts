# Mega Sync Setup Script

---

**setting-up-syncs.sh**: Automate the setup of folder syncs with Mega based on hostname

---

### Dependencies

- `mega-sync`: This script relies on the `mega-sync` command-line utility, which should be installed and configured on your system. It is used to synchronize local folders with Mega.nz cloud storage.

### Description

This Bash script automates the synchronization of several common user directories with corresponding backup locations on Mega.nz cloud storage. It determines the hostname of the machine using `hostnamectl` and sets up sync locations according to the specific hostname.

The script handles two specific hostnames, **karhu** and **karjala**, and sets up additional synchronization for these machines beyond standard directories like `Desktop`, `Documents`, and `Music`. These hosts have unique folders that are synchronized, such as `UnifiedLibrary` and `AUDIOVISUAL`.

For the `karhu` hostname, additional sync points include specific shares like `xiaomi_mega` and a backup location for `karjala`. For `karjala`, it includes media files and access to other hosts within the `/mnt/HDD2/devices` directory. There are TODO comments suggesting further functionality for syncing huge data folders labeled `ARCHIVES`, `DATA`, and `LIMBO`.

### Usage

To use the script, simply run it from a terminal. It doesn't require any command-line arguments or options:

```sh
bash /home/matias/.scripts/bin/setting-up-syncs.sh
```

You may choose to run this script manually when you want to update syncs or automate it using Cron or as part of a startup script in your Arch Linux configured with the `qtile` window manager.

---

> [!NOTE]
> The script assumes the `mega-sync` command is installed and configured correctly, but does not check for its presence or any errors that may occur during synchronization, which could cause the script to fail silently. Additionally, commenting TODOs suggest areas of further development that could be implemented, such as syncing additional large data folders. For robustness, consider adding error handling and environment checks.