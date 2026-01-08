# SnekAI Jupyter Launcher

---

**snekai.sh**: Launch Jupyter Lab/Notebook/IPython from the `snekai` virtualenv

---

### Dependencies

- `bash`
- `python` + `venv` (your virtual environment at `$HOME/.local/venv/snekai`)
- `jupyterlab` (provides `jupyter-lab`, installed inside the venv)
- `notebook` (provides `jupyter-notebook`, installed inside the venv)
- `ipython` (provides `ipython`, installed inside the venv)

### Description

This script is a small dispatcher to run common Jupyter tooling from a dedicated Python virtual environment (`$SNEKVENV`). It ensures the environment is activated (so imports, kernels, and packages match your “SnekAI” setup), then calls the corresponding binary directly from the venv:

- `lab()`: activates the venv and starts JupyterLab
- `notebook()`: activates the venv and starts the classic Jupyter Notebook UI
- `ipython()`: activates the venv and opens an interactive IPython shell

Because it uses the venv’s absolute binary paths (`$SNEKVENV/bin/...`), you don’t rely on `PATH` ordering—useful on Arch where system packages and pip packages may coexist.

### Usage

Run it from a terminal, or bind it in qtile (recommended for quick launches).

tldr:

- Start JupyterLab  
  `~/.scripts/lib/snekai/snekai.sh lab`

- Start classic Notebook  
  `~/.scripts/lib/snekai/snekai.sh notebook`

- Open IPython in the same env  
  `~/.scripts/lib/snekai/snekai.sh ipython`

Example qtile keybinding idea:

- Launch lab in a terminal:  
  `alacritty -e ~/.scripts/lib/snekai/snekai.sh lab`

---

> [!TIP]
> Consider adding a help message and exit codes: print valid subcommands when unknown, and `exit 1` on error. Also, `source` is redundant if you already call the venv binaries directly; either rely on activation (and run `jupyter-lab` without the full path) or skip activation entirely. Finally, check that `$SNEKVENV` exists before running to avoid confusing “file not found” failures.