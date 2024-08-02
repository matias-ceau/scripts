# New Script Creator

---

**new_script_creator.sh**: A simple script to automate the creation of new executable scripts.

---

### Dependencies

- `bash`: The shell environment in which the script is written.
- `nvim`: A text editor for opening the newly created script for editing.
- `bat`: A cat clone with syntax highlighting and Git integration, used here for improved help display.

### Description

The **new_script_creator.sh** is designed to streamline the creation of new user scripts in your Arch Linux environment with the Qtile window manager. This script automates several steps in creating a new script file, making it more efficient for users who frequently write custom scripts.

When invoked, the script performs the following operations:

1. It accepts one argument, which is the name of the script to be created.
2. It constructs the full path for the new script within a specified `SCRIPTS` directory.
3. It creates a new, empty file at this path.
4. It changes the file's permissions to make it executable.
5. It creates a symbolic link to this new script in the `~/.local/bin` directory, allowing direct execution from the command line.
6. Finally, it opens the new script in `nvim` for immediate editing.

### Usage

To use this script, simply call it from the command line, providing the desired name for your new script:

```bash
/home/matias/.scripts/new_script_creator.sh my_new_script
```

This will create a new script named `my_new_script` in the defined `SCRIPTS` directory, set it as executable, link it to your local bin for easy access, and open it in `nvim`.

If no argument is given, the script will display usage instructions:

```bash
/home/matias/.scripts/new_script_creator.sh
```

---

> [!TIP]  
> Consider adding additional functionality, such as pre-defined template insertions for common script formats or error handling for cases where the `SCRIPTS` directory does not exist. You may also want to check if the script name already exists to avoid accidental overwrites.