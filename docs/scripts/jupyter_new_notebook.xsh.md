# Jupyter Notebook Creator

---

**jupyter_new_notebook.xsh**: Script to create a new Jupyter notebook and open it in Chromium on Arch Linux with qtile.

---

### Dependencies

- `xonsh`: A Python-powered, Unix-gazing shell language and command prompt.
- `dmenu`: A dynamic menu for X11, used here to prompt for the notebook's name.
- `jupyter-notebook`: A browser-based computing platform.
- `chromium`: An open-source web browser.
- `notify-send`: A command to send desktop notifications.

### Description

This script facilitates the creation of a new Jupyter notebook file within a specified project directory and opens it immediately in the Chromium web browser. It uses `dmenu` to request a name for the new notebook from the user. The script checks if a notebook with the chosen name already exists in the `PROJECT_PATH`, which is set to `$HOME/projects`. If the name is unique, an empty notebook shell is created in JSON format, registered in the directory, and opened via Jupyter in Chromium. If the input name already exists or is left blank, a notification is sent to inform the user of the error.

### Usage

1. Run the script using `xonsh`:
   ```shell
   ./jupyter_new_notebook.xsh
   ```
   Alternatively, assign it to a keybinding in your qtile configuration for quick access.

2. A prompt will appear via `dmenu` asking for the new notebook's name.

- **Example**:
  - Launch the script and enter `Data_Analysis` when prompted.
  - A new file named `Data_Analysis.ipynb` will be created in `$HOME/projects` and opened in Chromium.
  - If no name is entered or if `Data_Analysis.ipynb` already exists, you will receive a desktop notification.

---

> [!TIP] Currently, the script does not handle invalid characters for filenames or provide an option for setting a different default directory. Consider adding a feature to handle special character input errors or allow the configuration of a custom project path.