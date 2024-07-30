# llama-all-scripts-describer.py

---

Generates GitHub documentation for user scripts using Llama 3.1 model.

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

- Python 3.x
- `colorama` library for colored output
- `ollama` for Llama 3.1 model
- Bash utilities: `fd`, `rg`
- (Optional) A CSV file of script symlink data

<a name="description" />

### Description

<a name="overview" />

#### Overview

`llama-all-scripts-describer.py` is a Python script designed to automate the generation of documentation for scripts within a specified directory. By utilizing the Llama 3.1 AI model, this script can intelligently describe scripts based on their content. It checks for existing documentation, identifies orphaned files, and updates documentation indices accordingly.

The main functionalities include:
- Running a symlink update script, if specified by the user.
- Collecting script files from the designated directory configured via the `SCRIPTS` environment variable.
- Identifying orphaned documentation files that no longer have matching scripts.
- Reading script files and generating descriptions for them using Llama.
- Writing markdown documentation files to a structured directory.

---

<a name="usage" />

#### Usage

To run the script, execute it from the command line. You can specify a path to a CSV file as an argument; if none is provided, it defaults to `$SCRIPTS/data/symlink_data.csv`.

```bash
./llama-all-scripts-describer.py [path_to_csv]
```

When prompted, confirm whether you'd like to run the `utils_update_symlinks.sh` script.

Make sure to set the `SCRIPTS` environment variable to point to your scripts' directory:

```bash
export SCRIPTS="/path/to/your/scripts"
```

<a name="examples" />

#### Examples

- Running the script with the default CSV path:

```bash
./llama-all-scripts-describer.py
```

- Specifying a custom CSV file:

```bash
./llama-all-scripts-describer.py /path/to/custom.csv
```

---

<a name="notes" />

### Notes

- Make sure that all dependencies are installed, especially `colorama` and `ollama`.
- The script checks for the presence of a `docs/scripts` directory and creates it if it does not exist.
- If a script is deemed binary, the script attempts to find a corresponding source file.

> **Critique:** 
> - The script could benefit from more robust error handling, such as verifying that all commands (like `fd` and `rg`) are available before proceeding. 
> - Consider modularizing some functions further for improved maintainability and testing. 
> - Adding unit tests would enhance reliability, especially for the script generation functionalities.