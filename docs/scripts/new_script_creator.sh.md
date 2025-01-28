# new_script_creator.sh - User Script Creator

---

**new_script_creator.sh**: A utility to create or convert scripts with templating for specific extensions (Bash, Python, Xonsh).

---

### Dependencies

The script relies on the following dependencies:
- `bat`: A syntax-highlighting tool for command-line output.
- `rg (ripgrep)`: A high-performance text search tool used to identify file extensions.
- `nvim`: Neovim, a Vim-based text editor, is used to edit generated scripts.
- `utils_update_symlimks.sh`: Custom script (assumed to manage symlinks for user scripts).
  
Additionally, the script assumes that scripts are stored in `$SCRIPTS/bin`.

### Description

This Bash script simplifies script creation and conversion by:
1. Accepting a filename as input to create a new script file or modify an existing file into an executable script.
2. Including a basic templating system that predefines shebang lines based on file extensions (`.sh`, `.py`, `.xsh`).
3. Allowing interactive input for filenames and scripting languages if no arguments are supplied by the user.
4. Ensuring proper executable permissions and automatic symlink updates via `utils_update_symlimks.sh`.

The `ensure_extension` function adds relevant extensions interactively if the supplied filename lacks one. The template for supported extensions is injected into the script via the `templater` function, allowing for quick scaffolding. After creation, the script opens the file in Neovim for editing.

The additional option `--from` enables converting an existing file into a script by moving it to `$SCRIPTS/bin`.

### Usage

This script can be used in multiple ways:

```bash
# Show help message
./new_script_creator.sh -h

# Create a script directly
./new_script_creator.sh my_script.sh

# Create a script and auto-select template based on provided extension
./new_script_creator.sh new_script.py

# Interactive mode for filename and extension selection
./new_script_creator.sh

# Convert an existing file into a user script
./new_script_creator.sh -f existing_file
```

For more direct invocation, it can be set as a keybinding in Qtile, or integrated into your workflow.

---

> [!TIP]
> - The `ensure_extension` logic requires the user to select the language interactively if the filename lacks an extension. This could be optimized by defaulting to Bash or a user-set preference.
> - The script does not validate the input filename string for special or illegal characters, which may cause unintentional errors.
> - `utils_update_symlimks.sh` is called several times but isn't documented within the script; consider integrating its functionality or ensuring documentation exists elsewhere.
> - For improved safety, a warning could be added before overwriting files.
