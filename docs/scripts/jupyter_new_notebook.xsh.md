# Jupyter Notebook Creation Script

---

**jupyter_new_notebook.xsh**: Script to create and open a Jupyter notebook in Chromium

---

### Dependencies

- `xonsh`: A Python-powered, cross-platform, Unix-gazing shell language and command prompt.
- `dmenu`: A dynamic menu for X, used for input.
- `notify-send`: A program to send desktop notifications.
- `jupyter-notebook`: Used to initialize and run Jupyter notebooks.
- `chromium`: The open-source web browser, used to open the newly created notebook.

### Description

This script streamlines the process of creating and opening a new Jupyter notebook on your Arch Linux system running the qtile window manager. It utilizes the `dmenu` tool to prompt the user for a notebook name, then checks the existence of such a notebook within the specified `projects` directory. If the name is unique, a new Jupyter notebook file is created with a basic empty template and subsequently opened in the Chromium browser. The use of `notify-send` allows for immediate feedback on the success or failure of the operation, providing quick notifications on the desktop.

### Usage

To use this script, run it from your terminal or integrate it with a keybinding or application launcher.

```sh
xonsh /home/matias/.scripts/bin/jupyter_new_notebook.xsh
```

- You will be prompted via `dmenu` to enter a name for the new notebook.
- If the notebook name is unique within your `projects` directory, it will be created and opened in Chromium.
- If the notebook name exists or no name is provided, a notification will indicate the error.

#### Keybinding example for qtile (in `config.py`):

```python
Key([mod], "n", lazy.spawn("xonsh /home/matias/.scripts/bin/jupyter_new_notebook.xsh")),
```

---

> [!NOTE]
> Consider enhancing error handling by ensuring that the script checks for the existence of required software dependencies and advises the user accordingly if any are missing. Additionally, you may want to refine the user interface experience by considering an alternative to `dmenu` if needed for better integration with your current setup.