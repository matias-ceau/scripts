# Jupyter New Notebook Launcher

---

**jupyter_new_notebook.xsh**: Quickly create and open a blank Jupyter notebook in Chromium via dmenu.

---

### Dependencies

- `xonsh`: Python-powered shell, required to run `.xsh` scripts.
- `jupyter-notebook`: Launches and serves Jupyter notebooks.
- `chromium`: Browser used to open the notebook.
- `dmenu`: Dynamic menu for interactive notebook naming.
- `notify-send`: Sends system notifications (for errors and prompts).
- `ls`, `echo`: Standard UNIX utilities.

---

### Description

This script streamlines the creation of new Jupyter notebooks within your `~/projects` directory:

- Prompts for a notebook name via `dmenu`.
- Appends ".ipynb" to the chosen name.
- Checks if a notebook with that name already exists in `~/projects`.
    - If not, it creates an empty notebook file (with standard Jupyter JSON boilerplate) and opens it in Chromium via Jupyter Notebook.
    - If the file exists, or no name is provided, an error notification is shown.

The script is ideal for rapidly spawning new notebook workspaces and integrating them into your qtile workflow, especially when paired with a custom keybinding for fast access.

---

### Usage

Simple, interactive usage:

```bash
jupyter_new_notebook.xsh
```

**Typical workflow:**
1. Run the script (bind to a key in qtile for maximum efficiency).
2. A `dmenu` prompt appears—type a name for your new notebook.
3. If the name is unique, a blank notebook is created and automatically opened in Chromium.
4. If it already exists or no name is entered, a desktop notification displays the error.

**Example (terminal):**
```bash
~/.scripts/bin/jupyter_new_notebook.xsh
```

**Example (qtile config):**
```python
Key([mod], "n", lazy.spawn("~/.scripts/bin/jupyter_new_notebook.xsh"), desc="New Jupyter Notebook")
```

---

> [!TIP]
> - The script does not sanitize input thoroughly; entering file-unfriendly characters in `dmenu` (such as slashes or other specials) may create unusable files.
> - Error checking on the `PROJECT_PATH` directory is absent; ensure it exists, or the script will fail.
> - Consider adding further validation for notebook names and improving messaging (e.g., support for spaces, automatic trimming, or handling `.ipynb` suffixes).
> - Optionally, allow creation within subfolders or expose more notebook metadata (like kernel selection), for more flexibility.
> - The script always opens the notebook in Chromium; you might want to make the browser configurable.
