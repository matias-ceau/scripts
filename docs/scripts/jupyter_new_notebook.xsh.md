# Create Jupyter Notebook (jupyter_new_notebook.xsh)

---

This script creates a new Jupyter notebook and opens it in Chromium.

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

- Xonsh shell
- dmenu
- Jupyter Notebook
- Chromium browser
- notify-send (part of the libnotify package)

<a name="description" />

### Description

<a name="overview" />

#### Overview

The script `jupyter_new_notebook.xsh` automates the process of creating a new Jupyter notebook within a specified project directory. When executed, it prompts the user to enter a name for the new notebook using `dmenu`, a dynamic menu for X. The notebook is initiated with a basic structure defined in the `empty_nb` variable, ensuring it is compatible with Jupyter's expected JSON format (version 4, minor version 2).

Key functionalities include:
- Checking if the notebook name already exists in the specified project directory.
- Creating the new notebook file if it doesn't already exist.
- Opening the created notebook in Chromium browser.
- Sending notifications via `notify-send` for errors such as a duplicate name or if no name was specified.

---

<a name="usage" />

#### Usage

To use the script, run it from the terminal:

```bash
/home/matias/.scripts/jupyter_new_notebook.xsh
```

After invoking the script, a prompt will appear, allowing you to input the desired notebook name. The input should not include the ".ipynb" extension as the script adds it automatically. 

If the notebook name is acceptable and doesn't already exist, the script will create and open the notebook. In case of conflicts or empty input, appropriate notifications will inform you of the issue.

<a name="examples" />

#### Examples

1. **Creating a new notebook:**
   - Run the script, type "my_first_notebook" in the dmenu prompt.
   - The script will create `my_first_notebook.ipynb` in the `~/projects` directory and open it in Chromium.

2. **Handling existing notebooks:**
   - If `my_first_notebook.ipynb` already exists, a notification will appear saying "Named already exists!".

3. **No name specified:**
   - Pressing Enter without input will trigger a notification stating "No name specified for the notebook!".

---

<a name="notes" />

### Notes

- Ensure that the `PROJECT_PATH` is set correctly in the script; it defaults to `~/projects`.
- The script requires the dependencies to be installed and configured.
- The script utilizes `notify-send` for notification purposes. Ensure it is available on your system for notifications to work.

> **Critique**: 
> - The script could benefit from error handling regarding the opening of the Jupyter notebook, in case Chromium fails to open the link or if Jupyter encounters issues.
> - The user input could be further refined by adding validation to restrict certain characters that could be invalid for filenames.
> - Consider adding a feature to select the project directory dynamically rather than hardcoding the path.