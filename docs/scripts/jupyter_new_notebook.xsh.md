# jupyter_new_notebook.xsh

---

Create a Jupyter notebook and open it in Chromium.

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

- `xonsh`: For running the script in the xonsh shell.
- `dmenu`: For interactive selection of the notebook name.
- `jupyter-notebook`: Required to run the notebook server.
- `notify-send`: For notifications on the desktop.

<a name="description" />

### Description

<a name="overview" />

#### Overview

The `jupyter_new_notebook.xsh` script facilitates creating a new Jupyter Notebook in a specified project directory and opens it in the Chromium web browser. By using `dmenu`, users are prompted to enter a name for their new notebook. If the name is valid and doesn't already exist in the project path, a new .ipynb file is created with default empty notebook content.

The script implements error handling that notifies users if the entered name is empty or conflicts with existing notebooks. This is particularly useful for streamlining the process of starting new projects or experiments in Jupyter without manual file creation.

---

<a name="usage" />

#### Usage

To use this script, simply execute it from a terminal running xonsh:

```bash
./jupyter_new_notebook.xsh
```

You will be prompted with a `dmenu` interface to input the notebook name. This can be assigned to a keybinding in your window manager (Qtile) for quick access.

1. Run the script.
2. Enter a name for your notebook when prompted.
3. If valid, the notebook will be created and opened in your Chromium browser.

<a name="examples" />

#### Examples

- Execute: `./jupyter_new_notebook.xsh`
- Prompt: A `dmenu` window appears to enter the name, for example, `my_first_notebook`.
- Result: Creates `my_first_notebook.ipynb` in the `~/projects` directory and opens it in Chromium.

---

<a name="notes" />

### Notes

- Ensure that the `PROJECT_PATH` is correctly set to your preferred Jupyter notebook directory.
- The script requires Jupyter to be installed and accessible in your shell environment.

> **Critique:** The script currently utilizes `ls` to check for existing notebooks, which may not be efficient for large directories. It could be improved by checking the existence of the file using a more direct method, such as using Python's `os.path.exists`. Further, consider implementing user feedback for successful creation or more detailed error handling for various edge cases. Additionally, using a more library-driven approach (like `json` for generating the notebook content) could improve maintainability.