# New Script Creator

---

**new_script_creator.sh**: A utility for creating new scripts with predefined templates.

---

### Dependencies

- `bat`: A command-line tool for syntax highlighting and displaying file contents.
- `nvim`: Neovim, an editor to modify the created scripts.
- `rg`: Ripgrep, a line-oriented search tool to match patterns.
- `utils_update_symlimks.sh`: This is a custom script presumed to handle symbolic link updates.

### Description

The `new_script_creator.sh` script automates the creation of new shell, python, or xonsh scripts based on user input. It offers functionalities to:

- Create a new script, prompting for a name if none provided.
- Change an existing file into a user script.
- Build templates for different scripting languages based on the file extension.

**Functions Breakdown**:

1. **usage()**: Displays help information and usage instructions.
2. **templater()**: Generates a template header based on the file extension. It supports `bash`, `python`, and `xonsh`.
3. **ensure_extension()**: Ensures that the filename provided has the correct extension; prompts the user if not.
4. **script_creator()**: Handles the creation, editing, and permission assignment for the new script file. It also updates symbolic links after creation.

### Usage

To use the script, simply execute it from the terminal. Below are some usage examples:

- To create a new script, just run:
  ```
  ./new_script_creator.sh
  ```
  You will be prompted for the script filename.

- To create a specific script, provide the filename:
  ```
  ./new_script_creator.sh my_script.py
  ```

- If you wish to transform an existing file into a user script:
  ```
  ./new_script_creator.sh -f existing_script.sh
  ```

- For help, you can run:
  ```
  ./new_script_creator.sh -h
  ```

---

> [!TIP] 
> The script relies on several external tools (`bat`, `nvim`, `rg`) being installed on your system. Make sure to have them installed, or the script may not function as intended. Additionally, consider adding error handling for editing and file operations to improve robustness, such as checking if the file creation or moving was successful.