# Dmenu-style Script Launcher (dmenu_run_scripts.py)

---

**dmenu_run_scripts.py**: Presents a list of runnable scripts via `rofi` integrated with xonsh for selection and execution.

---

### Dependencies

- `xonsh`  
  *Advanced Python-powered shell; used to gather script metadata via script_identifier.xsh.*

- `rofi`  
  *Window switcher, run dialog & dmenu replacement; acts as the GUI menu for script selection.*

- `script_identifier.xsh`  
  *User script required for fetching the list of manageable scripts. Must be in $PATH or same directory.*

- Python 3  
  *Standard interpreter for running this script.*

### Description

This script provides an application-launcher-like interface for running your local scripts.  
It works by first invoking `script_identifier.xsh` (presumably an xonsh script that enumerates available executable scripts, formatting and annotating them for display) with specific arguments to produce a list of scripts. The output is piped to `rofi` in dmenu mode, presenting a searchable and attractive interface, with color markup for statuses and descriptions.

Upon selection, it parses the chosen entry to extract the command and directly invokes it using `subprocess.run`. This enables you to quickly search, select, and execute scripts from a large collection, without touching the terminal.

The script assumes the output format of `script_identifier.xsh` is consistent and suited for markup parsing as implemented.

### Usage

You can run the script either from a terminal or bind it as a hotkey via your qtile configuration (recommended for fast access):

#### **TLDR:**

```sh
~/.scripts/bin/dmenu_run_scripts.py
```

#### **Keybinding Example in Qtile (python):**
```python
Key([mod], "r", lazy.spawn("~/.scripts/bin/dmenu_run_scripts.py"))
```

#### **From Terminal:**
```sh
python ~/.scripts/bin/dmenu_run_scripts.py
```

**Select an entry** with arrow keys/type-to-search, press `Enter` — the corresponding script will be executed.

---

> [!TIP]
>  
> - The script assumes the chosen entry can be parsed simply by splitting on `>` and `<` and that the executable command is directly extractable in this way. If the output format changes or contains these characters, parsing may break.  
> - The script does not handle user cancellation gracefully (e.g., pressing <kbd>Esc</kbd> in `rofi`), which may cause an IndexError. Consider adding input validation after the `split` statement.  
> - Security consideration: If your script list contains untrusted items, arbitrary code could be invoked.  
> - Consider passing absolute paths to `rofi` and `script_identifier.xsh` for robustness, and adding logging or error handling for missing dependencies or crashes.  
> - You might wish to use `os.execvp()` to replace the process or run in a new terminal for CLI scripts with output.