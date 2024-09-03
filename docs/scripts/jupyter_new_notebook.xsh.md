# Jupyter New Notebook Script

---

**jupyter_new_notebook.xsh**: Create a new Jupyter notebook and open it in Chromium.

---

### Dependencies

- `xonsh`: A shell language that is a superset of Python, allowing both shell commands and Python syntax.
- `dmenu`: A dynamic menu for X which is lightweight and allows for selecting options interactively.
- `jupyter-notebook`: The Jupyter Notebook application that allows you to create and manage notebooks.
- `notify-send`: Command-line tool to send desktop notifications, useful for alerting the user about actions or errors.

### Description

This script is designed to streamline the process of creating a new Jupyter notebook from within a terminal environment using the `xonsh` shell. 

1. It begins by defining the path to the projects directory, which is set to `$HOME/projects`.
2. An empty notebook template is created as a string, following the standard Jupyter notebook structure.
3. The script prompts the user to enter a name for the new notebook via `dmenu`. 
4. It checks if the user has specified a name; if not, it sends a notification indicating the requirement for a name.
5. If a valid name is provided, it checks for existing notebooks in the targeted directory to avoid naming conflicts.
6. If the notebook does not exist, it creates a new `.ipynb` file using the empty notebook structure defined earlier, opens it in Chromium using Jupyter Notebook, and reports success. Otherwise, it notifies the user of the conflict.

### Usage

To use this script:

1. Ensure the required dependencies are installed.
2. Make the script executable:
   ```bash
   chmod +x /home/matias/.scripts/jupyter_new_notebook.xsh
   ```
3. Run the script from the terminal:
   ```bash
   /home/matias/.scripts/jupyter_new_notebook.xsh
   ```

The script will prompt with a `dmenu` interface where you can enter the name of the notebook. If the notebook name already exists in the specified directory, you will receive a notification informing you of the conflict.

---

> [!TIP]  
> Consider incorporating error handling for scenarios where the `jupyter-notebook` command fails to execute. Additionally, ensuring that the user can provide a custom projects path via command-line arguments could enhance flexibility. You might also want to check for the existence of required dependencies and notify the user if any are missing before attempting to run the script.