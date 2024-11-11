# New Script Creator

---

**new_script_creator.sh**: A utility to create new user scripts with optional templating

---

### Dependencies

- `bat`: Used for displaying usage instructions with syntax highlighting.
- `rg` (`ripgrep`): Utilized for pattern matching in the script to determine file templates.
- `nvim`: The script opens new or existing scripts in `neovim` for editing.
- `utils_update_symlimks.sh`: A user script required for updating symlinks, presumably related to user's local script setup.

### Description

This is a versatile script creator tool designed to streamline the creation and management of user scripts on a Linux system, particularly for users on a `qtile` window manager setup. The script offers several functionalities:

- **Script Creation**: Automatically adds a shebang line based on the file extension (`.sh`, `.py`, `.xsh`) or prompts for language preference if none is provided.
- **File Conversion**: Converts existing files into user scripts by marking them executable and moving them to a specified directory.
- **Interactive Use**: Allows users to either directly provide filenames or interactively input them when arguments are missing.
- **Editor Integration**: Opens the newly created or modified script in `nvim` for immediate editing.

### Usage

To effectively use the script, execute it in the terminal with one of the following options:

```bash
new_script_creator.sh            # Prompts for a script name and creates it
new_script_creator.sh script.sh  # Creates a new script named script.sh
new_script_creator.sh -f path/to/file  # Converts an existing file to a user script
new_script_creator.sh -h         # Displays the help message
```

- Just run the script without arguments to get prompted for a filename.
- Use the `-f` or `--from` option to move an existing file into the user's script directory, make it executable, and edit it.

---

> [!NOTE]
> Potential improvements could include directly handling scenarios where the `utils_update_symlimks.sh` script is not present or fails to execute, possibly with a defined error handling routine. Additionally, expanding on interactive prompts for templating beyond just script extensions could further enhance its usability.