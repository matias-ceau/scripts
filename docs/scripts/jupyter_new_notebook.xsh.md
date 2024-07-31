# Jupyter Notebook Creator Script

---

**[jupyter_new_notebook.xsh](/jupyter_new_notebook.xsh)**: A script to create and open a new Jupyter notebook in Chromium

---

### Dependencies

- `xonsh`: A shell language that combines Python and Unix commands.
- `jupyter-notebook`: The Jupyter Notebook package that allows the creation and sharing of documents containing live code, equations, visualizations, and narrative text.
- `dmenu`: A dynamic menu for X to select items from a list.

### Description

This script automates the process of creating a new Jupyter notebook within a specified project directory and opens it in the Chromium browser. The script relies on the `dmenu` utility to prompt the user for the notebook's name. It checks if a notebook with the same name already exists in the defined project path (defaulted to `$HOME/projects`). If not, it creates an empty Jupyter notebook file with the specified name, formatted appropriately for Jupyter.

The empty notebook structure is defined by the `empty_nb` variable, which includes the JSON format expected by Jupyter notebooks. After creation, the script launches the new notebook using the `jupyter-notebook` command while pointing to the newly created file.

### Usage

To use the script, simply execute it in a terminal environment where you have `xonsh`, `jupyter-notebook`, and `dmenu` available. Running the script can be done interactively as follows:

```bash
/home/matias/.scripts/jupyter_new_notebook.xsh
```

1. Upon execution, the script will prompt you with `dmenu` to enter the desired notebook name.
2. After typing the name (without the `.ipynb` extension), hit Enter.
3. If the name is valid and does not duplicate an existing notebook in `$HOME/projects`, the notebook will be created and opened in Chromium. Otherwise, appropriate error messages will notify you of the issue.

---

> [!TIP]  
> Consider adding error handling for cases where `jupyter-notebook` fails to start or if the user cancels the `dmenu` prompt without providing a name. Additionally, implementing an option to specify a different project path can enhance script versatility.
