# Update Environment File Script

---

**update_env.xsh**: Updates the environment file to store API keys automatically

---

### Dependencies

- `xonsh`: This script is written in the xonsh shell scripting language, you need to have xonsh installed to execute it.

### Description

This script, `update_env.xsh`, is designed to automate the process of updating your local `.env` file with API keys that are currently stored in environment variables. The script iterates over all environment variables available in the shell session and filters out only those whose names end with `API_KEY`. These are assumed to be API keys. 

The extracted API keys are then written into a file located at `$HOME/.env` with the format: `KEY_NAME=key_value`, each on a new line. This approach keeps your `.env` file up-to-date with the necessary API keys without the need for manual editing.

### Usage

To use the script, run it inside a terminal that supports xonsh. Ensure that the necessary API keys are set as environment variables in your session. Here's a quick way to use the script:

```bash
xonsh /home/matias/.scripts/bin/update_env.xsh
```

You can also automate the script to run at startup or bind it to a key in your qtile configuration using a keybinding, depending on how frequently you update your API keys.

---

> [!TIP]
> - The script currently overwrites the `.env` file every time it is run. Consider adding a feature to append new API keys or confirm overwrites.
> - For enhanced security, ensure that your `.env` file permissions restrict access to unauthorized users, especially if it contains sensitive API keys.
> - Including error handling could make the script more robust, for instance checks for file write permissions or handling cases where no API keys are present.