# New Script Creator

---

**new_script_creator.sh**: Automates script creation with templating based on file extension

---

### Dependencies

- `bat`: A `cat` clone with syntax highlighting
- `rg` (ripgrep): A line-oriented search tool that recursively searches directories for a regex pattern
- `nvim`: Neovim, an extensible Vim-based text editor
- `utils_update_symlimks.sh`: A user-defined script to update symbolic links

### Description

The **new_script_creator.sh** script automates the creation of new scripts tailored to specific programming languages based on file extensions. It supports `.sh` for Bash, `.py` for Python, and `.xsh` for Xonsh, adding appropriate shebang lines. When executed, it prompts the user for a script name and uses `templater` to decide on the script's template based on its extension.

The script handles file extensions with `ensure_extension`, suggesting `.sh`, `.py`, or `.xsh` based on user input. It supports converting existing files into user scripts with the `-f` or `--from` flag.

The core function `script_creator` creates the script in a predefined `$SCRIPTS` directory, opens it in `nvim` for editing, and if the file size is larger than 22 characters, makes it executable and updates symlinks using `utils_update_symlimks.sh`.

### Usage

```bash
# Display help
new_script_creator.sh -h

# Create a new script with a specific name
new_script_creator.sh my_script.sh

# Convert an existing file into a user script
new_script_creator.sh -f /path/to/existing_file.sh

# Run without arguments to be prompted for a filename
new_script_creator.sh
```

Plugin the script into your Arch Linux environment, preferably assigning a keybinding in qtile for quick access.

---

> [!TIP] Consider improving error handling within the script. Currently, the script assumes the presence of required tools like `bat`, `rg`, and `nvim`, which might not be available or configured correctly on every system. Incorporating checks would enhance robustness. Additionally, the symlink update script `utils_update_symlimks.sh` should be explicitly verified for existence and functionality. Connecting it to a version-controlled repository would provide version tracking and enable collaborative improvements.