# Environment API Key Updater

---

**update_env.xsh**: Updates the `.env` file for storing API keys from environment variables

---

### Dependencies

- `xonsh`: A Python-powered, shell language that is used to run this script. Ensure it's installed on your Arch Linux system, as this script requires it to be executed.

### Description

The `update_env.xsh` script is designed to automatically update your `.env` file with all the environment variables that are API keys. It filters out environment variables ending with `API_KEY` and writes them to a file called `.env` in your home directory.

- It uses a dictionary comprehension to iterate over all current environment variables (`${...}`) and selects those whose names end with `API_KEY`.
- It then constructs a string (`apikeys_content`) where each line is formatted as `KEY=VALUE`.
- Finally, it writes this string into the `.env` file located in your home directory, overwriting any existing content.

This script is useful for managing API keys simply and ensures that your keys are encapsulated in a single file, making it easy to manage secrets for development and deployment.

### Usage

To use this script, simply run it directly from your terminal as it doesn't take any command-line arguments. Make sure to have execute permissions set for the file:

```bash
chmod +x /home/matias/.scripts/bin/update_env.xsh
/home/matias/.scripts/bin/update_env.xsh
```

For more convenience, you can also add this script to your `.xonshrc` file to run automatically when starting a new shell session or bind it to a keystroke in your qtile setup if frequent updates are common in your workflow.

---

> [!WARNING]
> While this script facilitates storing API keys, ensure the `.env` file's permissions are appropriately set to prevent unauthorized access. Consider supplementing this script with security measures such as encryption or using a secrets manager for sensitive information. Also, hardcoding the `.env` path can limit the flexibility of using the script across different environments or users—passing this as an argument could be a beneficial enhancement.