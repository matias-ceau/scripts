# New Script Creator

---

**new_script_creator.sh**: A simple bash script to create new scripts quickly.

---

### Dependencies

- `bat`: A modern alternative to `cat` with syntax highlighting and Git integration, used for displaying the contents of scripts. 
- `nvim`: Neovim, a text editor based on Vim, used to create and edit scripts.

### Description

The `new_script_creator.sh` script facilitates the creation of new scripts by providing a straightforward interface via the command line. It begins by defining a usage function that outlines the correct command format for the user. The main functionality is encapsulated in the `script_creator` function.

Upon invoking the script with a script name as an argument, the following processes take place:

1. The path for the new script is determined by concatenating the environment variable `SCRIPTS` with the provided script name.
2. The script opens in `nvim` for editing.
3. After editing, it checks if the script is not empty (size > 0):
   - If it contains code, it grants execute permissions.
   - It then creates a symbolic link to the script in the `~/.local/bin` directory, allowing for easy execution from anywhere in the terminal.
   - Finally, it displays the contents of the created script using `bat`.
4. If the script is created without any contents, it alerts the user and does not create the symbolic link.

### Usage

To create a new script, simply run the following command:

```bash
./new_script_creator.sh <script_name>
```

For example, to create a script named `example_script.sh`, run:

```bash
./new_script_creator.sh example_script.sh
```

If no argument is provided, the script displays usage instructions:

```bash
Usage:
    new_script_creator.sh [script]
```

---

> [!TIP]  
> Consider adding templating functionality as noted in the TODO comment within the script. This would enhance the usability of the script creator by allowing users to start with a predefined structure or boilerplate code for their scripts, making it easier for them to start coding. Additionally, consider implementing error handling to ensure the `SCRIPTS` environment variable is set and valid before attempting to create a new script.