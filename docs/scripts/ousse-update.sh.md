# Ousse Update Script

---

**ousse-update.sh**: A script for maintaining and updating various databases of system paths.

---

### Dependencies

- `updatedb`: A command for updating the locatedb file.
- `fd`: A simple, fast, and user-friendly alternative to `find` for searching files.
- `rg`: A fast command-line search tool that recursively searches your current directory.
- `realpath`: Used for resolving the absolute pathname.

### Description

The `ousse-update.sh` script is designed to create and update several databases that index specific folders on your Arch Linux system. It facilitates quick access to file and directory locations by leveraging the `updatedb` command.

The script organizes the updates into distinct functions based on the type of data being indexed:

- **_home**: Updates a database with paths under the user's home directory.
- **_dots**: Updates a database of dotfiles while ignoring certain paths and names.
- **_data**: Updates a database for user data, specifically focusing on `/mnt`.
- **_root**: Updates a comprehensive database rooted at `/`, excluding several critical system paths.
- **_mega**: Updates a database focusing on the UnifiedLibrary directory defined by the user.
- **_devices**: Focuses on directories named "devices" across the system.
- **_limbo**: Updates a database based on a directory named "LIMBO".
- **_hdd2**: Updates a database for paths in the `/mnt/HDD2` directory.

The script allows users to selectively update specific databases by passing keywords as arguments.

### Usage

The script can be executed from the terminal, and you can choose which portion of the database to update by using specific keywords:

```bash
bash /home/matias/.scripts/sys/ousse-update.sh all    # Update all databases
bash /home/matias/.scripts/sys/ousse-update.sh home   # Update the home database
bash /home/matias/.scripts/sys/ousse-update.sh dots   # Update the dotfiles database
bash /home/matias/.scripts/sys/ousse-update.sh data   # Update the data database
bash /home/matias/.scripts/sys/ousse-update.sh root   # Update the root database
bash /home/matias/.scripts/sys/ousse-update.sh mega   # Update the mega database
bash /home/matias/.scripts/sys/ousse-update.sh devices # Update the devices database
bash /home/matias/.scripts/sys/ousse-update.sh limbo   # Update the limbo database
bash /home/matias/.scripts/sys/ousse-update.sh hdd2    # Update the hdd2 database
```

---

> [!TIP]  
> The script has a couple of issues that could be addressed:
> - The function `_custom_updatedb` checks for arguments but never implements the logic to update the databases. Consider refining or removing it.
> - There is a potential syntax error in `-o "$DBDIR/home.db"` if any directory does not exist or `updatedb` fails for any reason. Proper error handling should be added.
> - The script lacks a help option or documentation command-line argument for ease of use.