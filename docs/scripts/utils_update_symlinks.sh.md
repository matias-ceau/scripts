# Symlink Manager

---

**utils_update_symlinks.sh**: Automates symlink updates, logs activity, manages potential conflicts.

---

### Dependencies

- `fd`: A program to find files in the directory tree efficiently.
- `bat`: A command-line tool to display file content with syntax highlighting.
- `glow`: Command-line tool to render markdown files.

### Description

The **utils_update_symlinks.sh** script is designed to manage the creation and maintenance of symbolic links for user scripts stored in a defined directory on an Arch Linux system using qtile as the window manager. It performs several tasks:

1. **Initialization**: Sets up and updates a CSV file used for tracking the original files and their respective symlinks. It retains historical data for reference.
   
2. **Error and Info Logging**: Provides logging functionality by capturing all logged information and errors with timestamps, directing them to a specified log file.

3. **Broken Symlink Removal**: Identifies and removes broken symlinks in the designated target directory to maintain a clean environment.

4. **Symlink Creation**: Efficiently generates symlinks for executable files present in the source directory. The script handles potential conflicts by identifying existing, conflicting symlinks and logging errors.

5. **CSV Entry Addition**: After successfully creating or updating symlinks, it logs the details into a CSV file, allowing users to have an organized inventory of the symlinks.

The process is broken down into functions for maintainability and clarity, utilizing tools like `fd` for file discovery and `bat` for improved CSV visualization.

### Usage

To use this script, ensure all dependencies are installed:

```bash
sudo pacman -S fd bat glow
```

Place your scripts in the directory referenced by the `$SCRIPTS` environment variable. Execute the script as follows:

```bash
bash ~/scripts/meta/utils_update_symlinks.sh
```

- The script runs non-interactively and can be linked to a qtile keybinding for quick execution.
- Applies changes automatically with a logging mechanism for review and audit purposes.

---

> [!TIP] 
> Consider checking the existence and correctness of the `$SCRIPTS` environment variable before running the script to avoid unexpected behavior. Also, ensure that color commands like `glow` and ANSI color codes are supported in your terminal environment for improved output clarity.