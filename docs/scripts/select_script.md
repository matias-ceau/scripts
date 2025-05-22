# Script Selector Utility

---

**select_script**: Interactively select and execute a script from cached metadata using Rofi

---

### Dependencies

- `rofi`: Pop-up menu for selection; must support `-markup-rows`.
- `~/.cache/script_info.csv`: CSV file containing script metadata (must exist and be regularly updated).
- Scripts located in `~/.scripts/`: The script target directory; selected scripts must be executable and present here.
- Standard C library (`stdio`, `stdlib`, `string`, `unistd`).

---

### Description

This **select_script** C application provides an interactive graphical menu for quickly selecting and executing scripts stored under `~/.scripts/`, relying on cached metadata for speed and context.

**How it works:**
- Reads **~/.cache/script_info.csv** which should have rows describing script files and their metadata. The exact CSV format expects at least a filename in the first column and a quoted description in the seventh.
- Presents the list of scripts using `rofi`, displaying each filename in green alongside its description.
- Captures the user’s selection and parses out the script name.
- Launches the selected script by calling it with `execl()`.

**Main Utilities and Functions:**
- `load_cache()`: Loads script info from CSV, filling an array of `ScriptInfo` (file + description).
- `display_rofi()`: Sends all scripts as menu entries to a `rofi` process for user selection.
- `extract_choice()`: Runs another `rofi` as a dmenu, and parses out the chosen filename from the user's selection.
- `execute_choice()`: Runs the chosen script directly by absolute path.

---

### Usage

You can run this utility from a terminal, keybinding, or dmenu/rofi runner:

```
$ ~/.scripts/bin/select_script
```

**tldr; Quick setup:**
1. Ensure scripts you wish to select are executable and exist under `~/.scripts/`.
2. Ensure `~/.cache/script_info.csv` exists and is up-to-date.
3. Make sure `rofi` is installed.
4. Run the script as above. A rofi menu will appear with all scripts and their descriptions.
5. Select an entry; the corresponding script will immediately execute.

---

> [!TIP]
>
> - **Critique:**  
> The current implementation launches two separate `rofi` processes: one to display options, and one to extract user choice. This is inefficient—ideally, all should be handled in a single `rofi` session by writing and reading through the same pipe.  
> - The CSV `sscanf` parsing is fragile and dependent on the exact input format; more robust CSV parsing is advised if the schema changes.  
> - There is no error checking for script existence/executability before attempting to run. Adding those would prevent silent failures.  
> - The script does not handle the possibility of no selection (user-escape or enter on empty).  
> - The executable environment is not preserved; scripts relying on parent env vars might fail.
>
> Consider providing a brief usage/help display if executed with `-h` or `--help`, and improving the rofi integration for speed and user experience.