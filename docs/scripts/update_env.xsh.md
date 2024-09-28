# Environment Variables Updater

---

**update_env.xsh**: Extracts and updates environment variables related to API keys into a `.env` file

---

### Dependencies

- `xonsh`: A shell language that combines Python and shell commands for script execution.

### Description

The `update_env.xsh` script is designed to dynamically extract environment variables, specifically those ending in `API_KEY`, and write them into a `.env` file in the user's home directory. 

It makes use of Python's dictionary comprehension to filter out and gather all environment variables terminating with the string `API_KEY`. These key-value pairs are then formatted in the style of `KEY=VALUE` and concatenated into a string with line breaks. Finally, this content is written to a `.env` file located at `$HOME/.env`.

This utility is particularly useful if you handle multiple API keys within your environment and wish to consolidate them for easy access by applications that rely on `.env` files.

### Usage

1. **Run the script**: Execute the script directly from the terminal to update your `.env` file with the current API keys:

   ```bash
   xonsh ~/home/matias/.scripts/update_env.xsh
   ```

2. **Assign a Keybinding**: Given your setup with the `qtile` window manager, you may want to assign this script to a keyboard shortcut for faster execution.

3. **Automate on system startup**: To ensure that the `.env` file is updated with the latest keys upon login, consider adding this script to your system's startup applications.

4. **Interactive Terminal**: The script needs to be executed in an environment where `xonsh` is installed and is generally run without any arguments.

---

> [!TIP]
> Consider enhancing the script by adding error handling. Currently, it assumes that the required environment variables are always present and writable to the `.env` file. Additionally, you may also want to add logging to track when the file was last updated, which could help in debugging or verifying the changes made by the script.