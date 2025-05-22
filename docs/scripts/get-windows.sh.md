# qtile: Get Windows Script

---

**get-windows.sh**: Outputs information about currently open windows in qtile (ID, group, name, wm_class)

---

### Dependencies

- `qtile`  
  Used to query the current state of windows via the `cmd-obj` command.
- `uv`  
  Runs the script using the uv Python runtime environment.
- `bash`  
  Script is written for the Bash shell.

### Description

This script retrieves a list of all windows managed by your current qtile session and prints out essential information for each window in a tab-separated format. Specifically, it uses the following workflow:

1. Calls qtile's `cmd-obj -o root -f windows` to retrieve structured data about each window.
2. Embeds this data into a Python snippet executed under `uv run`.
3. Extracts and displays per-window:
   - X11 window ID
   - Associated group
   - Window name (title)
   - Window class (`wm_class`)

The main script block manipulates the response from qtile, extracting only relevant fields into a simplified tabular output, which can be useful for debugging window/group assignments, scripting, external status bars, or custom workflows within your Arch/qtile environment.

### Usage

You can run this script directly in a shell, or bind it to a key or invoke it from other scripts. For instance:

```bash
~/.scripts/dev/get-windows.sh
```

**Example output:**
```
50331658	2	Alacritty	alacritty
65011718	3	Fox	Firefox
...
```

#### Typical ways to use:
- Run interactively in a terminal to quickly inspect windows.
- Pipe output to other scripts or utilities for automation/parsing:

```bash
~/.scripts/dev/get-windows.sh | grep Alacritty
```

- Bind to a key in your qtile configuration to show window info on demand.

---

> [!TIP]
>
> There are a few aspects to consider for improvement:
> - The direct shell interpolation of `$(qtile cmd-obj ...)` into the Python `win = ...` statement is potentially brittle if the output is very large or contains characters that confuse bash or Python parsing (e.g. quotes).
> - It may be more robust to run the qtile command directly in Python using subprocess or through the qtile IPC API, especially for handling the structured outputs without Bash mediation.
> - The script assumes all dependencies are available in the environment; consider adding checks or error handling for missing utilities.
> - Consider adding a header row to the output for clarity, or making the output format configurable (e.g., CSV for further integrations).
> - To avoid `uv run` dependency if not strictly needed, a pure `python` executable would increase portability.