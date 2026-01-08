# Jupyter New Notebook (dmenu)

---

**jupyter_new_notebook.xsh**: Create an empty Jupyter notebook in ~/projects and open it in Chromium

---

### Dependencies

- `xonsh` — script runtime
- `dmenu` — prompts for the notebook name
- `jupyter-notebook` — opens the notebook
- `chromium` — forced browser via `--browser=chromium`
- `notify-send` — desktop notifications (usually from `libnotify`)
- `ls`, `echo` — basic shell utilities

### Description

This Xonsh script creates a minimal, empty `.ipynb` file inside `~/projects` and immediately opens it with Jupyter Notebook in Chromium.

Workflow:

1. Defines `PROJECT_PATH` as `$HOME/projects`.
2. Builds a minimal notebook JSON payload (`empty_nb`) with no cells and notebook format v4.
3. Prompts for a name via `dmenu` (reads one line from stdin).
4. If a name was entered:
   - Appends `.ipynb`.
   - Lists current entries in `PROJECT_PATH` and checks for a collision.
   - If the name is unique, writes the empty notebook to disk and launches:
     - `jupyter-notebook --browser=chromium <path>`
   - If the name already exists, sends a critical notification.
5. If no name is provided, sends a critical notification.

This is well-suited to a qtile keybinding to quickly spawn scratch notebooks without opening a terminal.

### Usage

Run from anywhere (creates the notebook in `~/projects`):

    jupyter_new_notebook.xsh

Typical “tldr”:

- Create a new notebook:
  
      jupyter_new_notebook.xsh
      # type "my_experiment" in dmenu → creates ~/projects/my_experiment.ipynb and opens it

- Cancel / submit empty name:
  
      # just press Enter in dmenu → notification: "No named specified for the notebook!"

Suggested qtile binding (conceptually):

- Bind a key to execute `~/.scripts/bin/jupyter_new_notebook.xsh`.

---

> [!TIP]
> Consider using a dedicated notebook directory (e.g. `~/projects/notebooks`) and ensure it exists before listing/writing. The current collision check uses `ls` and compares raw strings; it may misbehave with spaces/newlines and also mixes files and directories. Prefer Python/Xonsh-native checks (`os.listdir`, `pathlib.Path.exists()`). Also, “Named already exists!” / “No named…” messages contain typos; improving wording helps. Finally, `jupyter-notebook` may block the script; launching it detached (or using `jupyter lab`) can make the UX smoother for keybindings.