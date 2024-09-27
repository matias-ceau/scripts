# New Script Creator

---

**new_script_creator.sh**: A script to create user scripts with various templates.

---

### Dependencies

- `bat`: A modern alternative to `cat` with syntax highlighting.
- `rg`: A command-line tool for searching text using regular expressions, often known as ripgrep.
- `nvim`: An extensible text editor, specifically Neovim.
- `utils_update_symlinks.sh`: A custom script assumed to manage symbolic links for your scripts.

### Description

The New Script Creator is a Bash script designed to streamline the creation of user scripts in different programming languages including Bash, Python, and Xonsh. This utility particularly benefits users working within the Arch Linux environment and using the Qtile window manager, as it allows for quick script generation from the command line.

#### Functions:
- **usage**: Displays the help information with the usage of the script.
- **templater**: Determines the script template based on the provided file extension and generates the appropriate shebang line.
- **ensure_extension**: Ensures the provided filename has a valid extension or prompts the user to choose a language type.
- **script_creator**: Handles the actual creation of the script file, makes it executable, and opens it in Neovim for edits.

### Usage

1. **Show help**: 
   ```bash
   ./new_script_creator.sh --help
   ```
2. **Create a new script**: Simply run the script and provide the desired filename.
   ```bash
   ./new_script_creator.sh my_script
   ```
3. **Specify a language**: If you do not provide an extension, it will prompt you to choose a language:
   ```
   [S]hell/[p]ython/[x]onsh? 
   ```
4. **Convert an existing file**:
   ```bash
   ./new_script_creator.sh -f existing_script.sh
   ```

The script ensures that the created script is executable if it has more than 22 characters and updates symbolic links accordingly after its creation.

---

> [!TIP] 
> This script could benefit from adding error handling, especially when dealing with file operations. Consider checking if the `$SCRIPTS` directory exists before creating a script, and improve the user prompts to handle unexpected inputs more gracefully. Additionally, implementing a confirmation step before overwriting existing scripts could prevent accidental data loss.