# SnekAI Control Script

---

**snekai.sh**: Script to manage Jupyter Lab, Jupyter Notebook, or IPython in a virtual environment

---

### Dependencies

- `bash`: The script is written for Bash shell, ensure it is installed.
- `jupyter-lab`: Command to launch the Jupyter Lab interface.
- `jupyter-notebook`: Command to launch the Jupyter Notebook interface.
- `ipython`: Command to launch an IPython shell.
- `virtualenv`: Used to create isolated virtual environments in which the dependencies reside.

### Description

This script, `snekai.sh`, is designed to simplify the process of starting a Jupyter Lab, Jupyter Notebook, or IPython session within a Python virtual environment located at `~/.local/venv/snekai`. The script defines a series of functions to activate the virtual environment and run the respective application.

- The function `lab` activates the virtual environment and runs Jupyter Lab.
- The function `notebook` activates the virtual environment and runs Jupyter Notebook.
- The function `ipython` activates the virtual environment and runs IPython.

Upon execution, the script checks for a command-line argument to determine which of the three applications to launch. If an invalid option is given, it outputs an "Unknown command" error.

### Usage

To use this script, execute it from the terminal followed by the desired application command:

```bash
# Launch Jupyter Lab
bash /home/matias/.scripts/bin/snekai.sh lab

# Launch Jupyter Notebook
bash /home/matias/.scripts/bin/snekai.sh notebook

# Launch IPython shell
bash /home/matias/.scripts/bin/snekai.sh ipython
```

This script can also be tied to keyboard shortcuts within your qtile window manager for quick access, or executed from application launchers that support script execution.

---

> [!TIP]
> Ensure that the virtual environment at `~/.local/venv/snekai` is properly set up with all necessary Python packages, especially `jupyter` and `ipython`. You might also consider adding a help option to display usage information, and handling nonexistent virtual environments gracefully.