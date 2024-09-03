# Update Environment Variables Script

---

**update_env.xsh**: Update the .env file with API keys from the current environment

---

### Dependencies

- `xonsh`: A Python-powered shell that combines the best of bash and Python. This script relies on it to run properly.

### Description

The `update_env.xsh` script is designed to streamline the process of managing API keys by updating a `.env` file within the user's home directory. This file is often used in various applications to store environment variables securely. 

This script defines a function named `update_env` which does the following:

1. **Collect API Keys**: It creates a dictionary `apikeys_dict` containing all items in the current environment whose keys end with 'API_KEY'. This is achieved through a dictionary comprehension that filters the environment's items.

2. **Prepare Content for .env**: It then creates a formatted string `apikeys_content`, where each key-value pair is represented in the format `KEY=VALUE`, separated by newlines, followed by an additional newline.

3. **Write to .env File**: The script opens (or creates) the `.env` file in the home directory and writes the formatted API keys content to it.

---

### Usage

To utilize this script, simply execute it from your terminal while in the xonsh environment:

```bash
xonsh /home/matias/.scripts/update_env.xsh
```

This will trigger the `update_env` function, automatically updating the `.env` file with any API keys you have in your environment.

For convenience, you could set a keybinding in qtile to run this script, allowing for easy updates whenever you need them. For example, you could add the following to your `~/.config/qtile/config.py`:

```python
Key([mod], "u", lazy.spawn('xonsh /home/matias/.scripts/update_env.xsh')),
```

This would bind the update script to the "mod+u" key combination.

---

> [!TIP]  
> Ensure that your environment variables are correctly set prior to running this script. Consider implementing error handling in the script to manage cases where the `.env` file cannot be written or if no API keys are found, enhancing its robustness.