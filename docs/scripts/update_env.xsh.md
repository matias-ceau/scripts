
---

A script to update the .env file with API keys.

---

### Table of contents

- [Dependencies](#dependencies)
- [Description](#description)
    - [Overview](#overview)
    - [Usage](#usage)
    - [Examples](#examples)
- [Notes](#notes)

---

<a name="dependencies" />

### Dependencies

- `xonsh`: A shell language and command prompt that builds on Python.
- Access to environment variables containing API keys.

<a name="description" />

### Description

<a name="overview" />

#### Overview

This script, written in `xonsh`, is designed to extract all environment variables that end with `API_KEY` and write them to a `.env` file in the user's home directory. It uses a dictionary comprehension to filter the current environment variables and collect only those that match the specified suffix. The resulting key-value pairs are formatted and saved into a `.env` file, which is commonly used for storing sensitive information such as API keys in a structured format.

The script operates by performing the following actions:

1. **Dictionary Comprehension**: It creates a dictionary that includes only those environment variable entries where the key satisfies the condition of ending with `API_KEY`.
  
2. **String Formatting**: It then formats each key-value pair as `key=value` and combines them into a single string, separated by newlines.
  
3. **File Writing**: Finally, it writes this string to a `.env` file located in the home directory, overwriting any existing content.

---

<a name="usage" />

#### Usage

To use this script, run it directly in the terminal. Ensure that your environment contains the relevant API keys as environment variables. The script processes those variables and updates or creates the `.env` file. You can also bind this script to a keyboard shortcut in the qtile Window Manager for easy access.

You may execute the script as follows:

```bash
xonsh /home/matias/.scripts/update_env.xsh
```

<a name="examples" />

#### Examples

1. To update the `.env` file with your current API keys, simply run:
    ```bash
    xonsh /home/matias/.scripts/update_env.xsh
    ```

2. If you have bound this script to a keyboard shortcut in qtile, just press that shortcut to execute the script.

---

<a name="notes" />

### Notes

- Ensure that your API keys are set in the environment prior to running this script for it to work effectively.
- The script will overwrite the `.env` file, so ensure backup if previous content is needed.

> **Critique**: 
> - The script lacks error handling; if the `.env` file cannot be opened (e.g., due to permissions), it will throw an unhandled exception. Consider adding a try-except block around the file operations to gracefully handle such cases.
> - It could include logging to indicate success or failure of the operation, which would be beneficial for debugging and usage confirmation.