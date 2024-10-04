# Ousse Database Update Script

---

**ousse-update.sh**: A script to update various databases stored in a specified directory.

---

### Dependencies

- `updatedb`: This utility is part of the `mlocate` package and is used to create a database of files for quick searching.
- `fd`: A simple, fast, and user-friendly alternative to `find`. Used for path list generation.
- `rg` (ripgrep): A line-oriented search tool that recursively searches your current directory for a regex pattern.
- `realpath`: A command-line utility that helps resolve file names to their canonical form.

### Description

The `ousse-update` script is designed to update a series of databases that track different areas of your file system. By utilizing `updatedb`, the script creates up-to-date databases for various categories such as home, dotfiles, data, root, and other custom paths. 

Each category has its own function, which calls `updatedb` with custom parameters to prune certain paths and names to enhance the relevance of the database content. This custom approach allows you to manage and store databases effectively while ignoring unnecessary paths, such as temporary directories.

The main functions of the script handle:

- **Home (`_home`)**: Updates a database of the user's home directory, excluding temporary paths.
- **Dots (`_dots`)**: Focuses on dotfiles in the home directory, intentionally ignoring any paths with leading dots.
- **Data (`_data`)**: Targets mounted data directories, excluding specific directories.
- **Root (`_root`)**: Updates a database for the root directory, excluding common system paths.
- **Mega (`_mega`)**: Focuses on a specific directory (`UnifiedLibrary`).
- **Devices (`_devices`)**: Gathers information about devices, filtering paths to user directories.
- **Limbo (`_limbo`)**: Captures a database of 'LIMBO' paths in specified locations.
- **HDD2 (`_hdd2`)**: Updates a database for a secondary HDD mount point.

### Usage

To run the script, simply invoke it from the terminal with an optional argument. The following are examples of how to use the script:

```bash
# Update the home database
bash /home/matias/.scripts/sys/ousse-update.sh home

# Update the dots database
bash /home/matias/.scripts/sys/ousse-update.sh dots

# Update all databases
bash /home/matias/.scripts/sys/ousse-update.sh all
```

You can also create keybindings in your window manager (like qtile) to quickly run the script with predefined arguments.

---

> [!TIP]  
> There are potential improvements for this script, such as handling errors more gracefully (e.g., checking if `updatedb` or `fd` are installed before proceeding) and refining the argument handling to give the user feedback if an invalid input is provided. Consider adding logging features to track the success or failure of each database update for better maintainability.