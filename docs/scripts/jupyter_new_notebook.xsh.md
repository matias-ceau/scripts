# Create Jupyter Notebook and Open in Chromium

---

**jupyter_new_notebook.xsh**: Script to create a new Jupyter notebook and open it in Chromium.

---

### Dependencies

- `xonsh`: A Python-powered shell that allows for commands and scripts to be executed easily.
- `dmenu`: A dynamic menu for X11, used for selecting notebook names.
- `jupyter-notebook`: The Jupyter Notebook application used to create and edit notebooks.
- `notify-send`: A command to send desktop notifications.

### Description

This script automates the process of creating a new Jupyter notebook file and opening it in a specified browser (Chromium) for immediate use. The script prompts the user to input a desired name for the notebook using `dmenu`. If the name isn't provided or already exists within the specified project directory, a corresponding notification is displayed. 

The core functionality of the script includes:
1. Defining a predefined JSON structure for an empty notebook.
2. Checking if a notebook with the desired name already exists in the designated `PROJECT_PATH`.
3. Creating the .ipynb file with the necessary structure if valid input is provided.

### Usage

To run the script, execute it from the terminal or bind it to a key in your window manager. For example, to run the script from the terminal, simply enter:
```bash
/home/matias/.scripts/jupyter_new_notebook.xsh
```

Upon execution:
1. A prompt from `dmenu` will appear, asking for the notebook name.
2. If a valid name is given:
    - The script verifies if the file does not already exist.
    - It creates the notebook file in `$HOME/projects`.
    - It opens the newly created notebook in Chromium.
3. If the name is empty or already exists, a desktop notification will alert the user.

---

> [!TIP] 
> Consider adding exception handling, especially around file operations and browser launching, to make the script more robust. Additionally, allow for the choice of browser instead of hardcoding Chromium for greater flexibility.