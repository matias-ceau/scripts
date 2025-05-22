# snekai: Jupyter and IPython Environment Launcher

---

**snekai.sh**: Utility for launching Jupyter Lab, Jupyter Notebook, or IPython from a dedicated Python virtual environment

---

### Dependencies

- `bash` — Required to run the script.
- `jupyter-lab` — Must be installed in the SNEKVENV (`~/.local/venv/snekai`).
- `jupyter-notebook` — Should be present in the SNEKVENV for notebook support.
- `ipython` — Needs to be available in the same virtual environment.
- Python virtual environment at `~/.local/venv/snekai` (`python -m venv ~/.local/venv/snekai`)
- _Optional_: Your own `/home/matias/.scripts/lib/snekai/` path organization

---

### Description

This script provides a simplified CLI wrapper for launching:
- **Jupyter Lab**
- **Jupyter Notebook**
- **IPython shell**

All tools are run from a Python virtual environment located at `~/.local/venv/snekai`, ensuring clean separation from your system Python or other environments.

**Functions:**
- `lab()`: Activates the venv and runs Jupyter Lab.
- `notebook()`: Activates the venv and runs Jupyter Notebook.
- `ipython()`: Activates the venv and launches an IPython shell.

Each function ensures the environment is sourced so that dependencies and kernels are correct. The command-line argument determines which tool is launched.

---

### Usage

You can call the script directly from your terminal or bind it to a key in your qtile configuration.

#### Examples

```sh
# Launch Jupyter Lab
~/.scripts/lib/snekai/snekai.sh lab

# Launch Jupyter Notebook
~/.scripts/lib/snekai/snekai.sh notebook

# Launch IPython shell
~/.scripts/lib/snekai/snekai.sh ipython
```

You may also want to symlink or add the script directory to your PATH for convenience:

```sh
ln -s ~/.scripts/lib/snekai/snekai.sh ~/bin/snekai
snekai lab
```

---

> [!TIP]
> - The script expects the venv at `~/.local/venv/snekai`. If it’s missing or unpopulated, commands will fail. Consider adding checks to ensure the venv and tools exist.
> - Error handling is minimal: typing an unrecognized argument just prints "Unknown command". More helpful usage info could be provided.
> - Currently, the environment is activated via `source`, but commands are then run explicitly via full path (`$SNEKVENV/bin/…`). If you always source, you may just call `jupyter-lab` directly.
> - No support for passing additional arguments (e.g., opening specific notebooks or labs); consider forwarding `$@` to the commands for increased flexibility.