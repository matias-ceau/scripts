# Update Env Script (update_env.xsh)

---

Updates the `.env` file with API keys stored in the current environment.

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

- Xonsh shell must be installed and in use.

<a name="description" />

### Description

<a name="overview" />

#### Overview

The `update_env.xsh` script is designed to extract API keys from the current environment variables and write them to a `.env` file located in the user's home directory. This is particularly useful for managing sensitive data separately from your codebase, making it easier to handle environment-specific configurations.

The script works by defining a function, `update_env()`, which:
1. Uses dictionary comprehension to filter out environment variables that end with `API_KEY`.
2. Constructs a string containing key-value pairs formatted as `KEY=VALUE`.
3. Opens (or creates if it doesn't exist) the `.env` file in write mode and writes the formatted string into this file.

This approach ensures that only relevant API keys are recorded, keeping the `.env` file clean and concise.

---

<a name="usage" />

#### Usage

To use this script:
1. Save it as `update_env.xsh` in your scripts directory.
2. Execute the script in a terminal using the Xonsh shell:
   ```bash
   xonsh /home/matias/.scripts/update_env.xsh
   ```

Alternatively, you can set a keybinding in your window manager to trigger this script for quick access, or automate it by including a call to it in your shell initialization files.

<a name="examples" />

#### Examples

- **Run the script directly:**

```bash
xonsh /home/matias/.scripts/update_env.xsh
```

- **Output in `.env`:**
  If your environment has:
  ```
  DATABASE_API_KEY='12345abcdef'
  ANOTHER_API_KEY='67890ghijkl'
  ```
  The resulting `.env` file will contain:
  ```
  DATABASE_API_KEY=12345abcdef
  ANOTHER_API_KEY=67890ghijkl
  ```

---

<a name="notes" />

### Notes

- Ensure that your environment variable names are consistently suffixed with `API_KEY` for them to be captured by the script.
- The script will overwrite the existing `.env` file, so use caution to avoid losing important data.

> **Critique:** 
> The script lacks error handling, which can lead to issues if the file cannot be opened for writing or if there are no API keys found in the environment. It could also be improved by allowing for user-specified output filenames for cases where a standard `.env` file is not desired. Implementing logging to provide feedback during execution would also enhance its usability.