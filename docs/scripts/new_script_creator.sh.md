# New Script Creator

---

**new_script_creator.sh**: A script for creating and modifying user scripts with optional templating

---

### Dependencies

- `bat`: A syntax highlighting command-line tool used for enhanced viewing of files.
- `rg`: Short for ripgrep, used for fast searching of patterns within files.
- `nvim`: Neovim, a vim-based text editor for editing the scripts.
- `utils_update_symlimks.sh`: This script is used to update symbolic links for new scripts.

### Description

The `new_script_creator.sh` script is designed to streamline the process of creating and managing user scripts on your Arch Linux system with qtile. It allows you to either create a new script with an optional template based on the file extension or convert an existing file into a user script. Depending on the file extension (`.sh`, `.py`, `.xsh`), it chooses the appropriate template (bash, python, xonsh) and includes shebang accordingly. The script also ensures file execution permissions are set and updates symbolic links for convenient usage.

### Usage

You can execute the script directly from the terminal with various options:

```bash
# To get prompted for a script name, simply run:
./new_script_creator.sh

# To create a new script with a specified name:
./new_script_creator.sh my_script.sh

# To convert an existing file into a user script:
./new_script_creator.sh -f existing_file.py

# To display help information:
./new_script_creator.sh --help
```

#### Examples

- Create a new bash script:
  ```bash
  ./new_script_creator.sh my_new_script.sh
  ```

- Convert an existing python file to a script:
  ```bash
  ./new_script_creator.sh -f old_script.py
  ```

> [!WARNING]
> One potential issue is the hardcoded paths, such as `$SCRIPTS`, which require proper setup in your environment variables. Additionally, the script relies on the presence of external dependencies and another script (`utils_update_symlimks.sh`). Ensure these are installed and accessible in your system. Also, when checking the file extension, the script assumes the usage of `rg`; replacing it with standard tools like `grep` might increase portability.