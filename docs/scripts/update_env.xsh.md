# Update Environment Variables Script

---

**update_env.xsh**: A script to extract and update API keys in a .env file.

---

### Dependencies

- `xonsh`: A Python-powered shell that is an essential dependency for executing this script. Ensure it's installed and configured on your Arch Linux system.

### Description

The `update_env.xsh` script is designed to streamline the management of API keys by automatically extracting any key-value pairs from your current environment variables that end with `API_KEY` and saving them into a `.env` file located in your home directory. This is particularly useful for developers who frequently need to manage API keys securely and efficiently.

#### How it Works

1. **Environment Extraction**: The script leverages the Xonsh shell's capability to access environment variables. It filters these variables, retaining only those where the key's name concludes with `API_KEY`.
2. **Formatting Keys and Values**: It constructs a formatted string that pairs each key with its corresponding value in the format required for `.env` files, which typically looks like `KEY=VALUE`.
3. **Writing to File**: The script overwrites the existing `.env` file or creates it if it doesn't exist, ensuring that it always contains the most recent API keys.

### Usage

To run the script, simply execute it in your terminal using:

```bash
xonsh /home/matias/.scripts/update_env.xsh
```

You can also set up a keybinding in your qtile configuration to run this script conveniently:

```python
# Example keybinding in qtile's config.py
Key([mod], "u", lazy.spawn("xonsh /home/matias/.scripts/update_env.xsh")),
```

This will allow you to press the mod key plus 'u' to trigger the update.

---

> [!TIP]  
> The current implementation overwrites the `.env` file every time the script runs, which may not be ideal if you want to keep certain keys unchanged. Consider enhancing the script to merge new keys with existing ones instead of overwriting the entire file. Additionally, implement error handling to manage potential file writing issues gracefully, ensuring the script runs reliably in various environments.