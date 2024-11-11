# Jupyter Notebook Creator

---

**jupyter_new_notebook.xsh**: Script to create and open a new Jupyter Notebook in Chromium

---

### Dependencies

- `xonsh`: A Python-powered shell.
- `dmenu`: A dynamic menu for X.
- `jupyter-notebook`: To create and serve Jupyter Notebooks.
- `chromium`: Utilized as the web browser to open the notebook.
- `notify-send`: For sending desktop notifications for errors or confirmations.

### Description

This script automates the creation of a new Jupyter Notebook and opens it in the Chromium browser. It does this by first reading the project directory located in the user's home path (`$HOME/projects`) where it expects to manage the Jupyter Notebooks. It uses `dmenu` to prompt the user for a notebook name. If the specified name doesn't already exist in the directory, the script creates a new notebook with the basic Jupyter format and opens it directly. If the name already exists or no name is provided, the script issues a critical desktop notification to inform the user.

### Usage

To run this script:

- Ensure all dependencies are installed.
- Execute the script in a terminal:

  ```bash
  xonsh /home/matias/.scripts/bin/jupyter_new_notebook.xsh
  ```

- A `dmenu` prompt will appear. Enter the desired name for your notebook.
- Upon successful creation, the new notebook will open in Chromium automatically.
  
> TL;DR:
> ```bash
> xonsh /home/matias/.scripts/bin/jupyter_new_notebook.xsh
> ```
> - When prompted, enter a unique name for the Jupyter Notebook.

---

> [!NOTE]
> - Consider adding more robust error checking to handle edge cases, such as invalid characters for filenames.
> - It may be beneficial to allow for customization of the `PROJECT_PATH` and default browser in a configuration file or to make them command-line arguments.
> - Currently, it only notifies the user when there is no name or the name is a duplicate; more detailed user feedback might enhance usability.