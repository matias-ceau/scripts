# Update Environment Variables Script

---

**[update_env.xsh](/update_env.xsh)**: update_env.xsh - Update .env file with API keys from xonsh environment

---

### Dependencies

- `xonsh`: An expressive shell language that combines Python and shell scripting. This script is designed to be run in a xonsh shell environment.

### Description

The `update_env.xsh` script is designed to compile API keys stored in the xonsh environment into a standardized `.env` file format. The script identifies environment variables ending with `API_KEY` and writes them to a file named `.env` located in the user's home directory. 

The main function, `update_env`, works as follows:
1. It constructs a dictionary, `apikeys_dict`, by filtering through all environment variables, selecting only those whose keys terminates with `API_KEY`.
2. It then creates a string, `apikeys_content`, that formats these keys and their corresponding values in the form `KEY=VALUE`, each on a new line.
3. Finally, it opens (or creates) the `.env` file and writes the formatted content into it.

### Usage

To use this script, follow these steps:

1. Ensure that your shell is running xonsh.
2. Place the script in an accessible directory and make it executable:

   ```bash
   chmod +x /home/matias/.scripts/update_env.xsh
   ```

3. Run the script directly in the terminal:

   ```bash
   /home/matias/.scripts/update_env.xsh
   ```

After execution, your `.env` file will be populated with the API keys from your environment.

You can also bind this script to a keyboard shortcut or run it automatically at certain intervals based on your workflow preferences.

---

> [!TIP]  
> Consider adding error handling to the script, particularly when opening the `.env` file for writing. It would help manage situations where the file might be unwritable due to permissions or other issues. Additionally, consider whether you want to overwrite the existing file unconditionally or provide an incremental update feature.
