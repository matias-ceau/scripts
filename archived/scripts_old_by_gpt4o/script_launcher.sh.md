# script_launcher.sh

# Run Scripts with FZF

This Bash script allows users to discover and execute scripts interactively using the `fzf` fuzzy finder. It leverages `fd` for finding scripts in a specified directory, displays script previews using `bat`, and executes the selected script via `bash`.

## Prerequisites

- **fd**: A simple, fast, and user-friendly alternative to `find`.
- **fzf**: A command-line fuzzy finder.
- **bat**: A `cat` clone with syntax highlighting and Git integration.
- **improved-fzfmenu.sh**: A custom script that extends `fzf` functionalities.

## How It Works

1. **Search Scripts**:
   The script utilizes `fd` to find all files (scripts) in the specified `$SCRIPTS` directory.
   ```bash
   fd '' -tx "$SCRIPTS"
   ```

2. **Extract Script Names**:
   The `basename` command is used to extract the names of the scripts.
   ```bash
   xargs -I {} basename {}
   ```

3. **Interactive Menu**:
   `improved-fzfmenu.sh` is called to present the scripts in an interactive fuzzy finder interface.
   ```bash
   improved-fzfmenu.sh
   ```

4. **Preview Selected Script**:
   A preview feature is enabled using `bat`, showing the script's documentation (if available) in markdown format.
   ```bash
   --preview "bat -lmd $SCRIPTS/docs/scripts/{}.md --color=always --style=grid"
   ```

5. **Configure Preview Window**:
   Sets the preview window to occupy 70% of the terminal.
   ```bash
   --preview-window='70%'
   ```

6. **Bind Select Key to Execution**:
   Binds the `Enter` key to execute the selected script using `bash`.
   ```bash
   --bind "enter:become(bash -c {})"
   ```

## Example Directory Structure (Assuming `$SCRIPTS` Points Here)

```
/path/to/scripts/
    script1.sh
    script2.sh
    docs/
        scripts/
            script1.sh.md
            script2.sh.md
```

## Usage

Run the script from the terminal:
```bash
./run-scripts-with-fzf.sh
```

Interact with the fuzzy finder to select and run your desired script. A preview of each script's documentation will be shown as you navigate through the list.

## Notes

- Ensure `$SCRIPTS` environment variable is set to the directory containing the scripts you want to run.
- Place the documentation for each script in the `$SCRIPTS/docs/scripts` directory following the naming convention `scriptname.sh.md` for proper preview functionality.
- This script uses functionality from `improved-fzfmenu.sh` which should be available and executable in your `$PATH`.

## Comments

The script includes a commented out line that could alternatively be used to execute selected scripts:
```bash
# xargs -I {} bash -c "{}" &
```

Uncomment the line if you want to execute scripts in the background using `xargs`.

---

By leveraging this script, you can efficiently navigate and run various scripts from your directory, with enhanced user interaction and preview capabilities. Happy scripting!