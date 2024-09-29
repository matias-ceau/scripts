# New Script Creator

---

**new_script_creator.sh**: A script to create and manage user scripts effortlessly.

---

### Dependencies

- `bat`: A modern alternative to `cat` that supports syntax highlighting.
- `rg`: The Rust text search tool used for regex matching.
- `nvim`: A text editor that opens the created script for editing.
- `utils_update_symlimks.sh`: A user-defined utility for updating symlinks (assuming it exists in the script's context).

### Description

The `new_script_creator.sh` is designed to facilitate the creation of user scripts across different programming languages (Bash, Python, Xonsh) with minimal hassle. The script provides several functionalities:

- **Usage Documentation**: The `usage` function displays how to invoke the script and explains the options available to the user.
- **Template Generation**: The `templater` function creates a basic template for the specified language. The generated template includes a shebang line to specify the interpreter.
- **File Extension Check**: The `ensure_extension` function ensures that the script file has the correct extension. If no extension is provided, it prompts the user to choose between Shell, Python, or Xonsh scripts.
- **Script Creation and Opening**: The `script_creator` function creates the script at a defined path, opens it in `nvim`, and assigns execution permissions if the script is long enough.

### Usage

You can use the script in several ways:

1. **Create a new script interactively**:
   ```bash
   ./new_script_creator.sh
   ```
   This will prompt you for a filename and script type.

2. **Specify a filename directly**:
   ```bash
   ./new_script_creator.sh my_script.py
   ```
   This command creates a new Python script named `my_script.py`.

3. **Convert an existing file into a user script**:
   ```bash
   ./new_script_creator.sh -f existing_script.sh
   ```
   Use this command to change an existing file into a user script and open it in `nvim`.

4. **Display help**:
   ```bash
   ./new_script_creator.sh -h
   ```
   This shows the usage options for the script.

---

> [!TIP]  
> The script depends on external utilities like `bat`, `rg`, and `nvim`, which may not be installed on all systems. Consider incorporating user checks to ensure these tools are available before execution. Additionally, error handling could be improved for robustness, especially when dealing with file operations.