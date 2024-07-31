# Script Launcher - Run Scripts with FZF

---

**[script_launcher.sh](script_launcher.sh)**: Launches user scripts using fzf with a preview pane.

---

### Dependencies

- `fd`: A simple, fast and user-friendly alternative to `find`. It's used to efficiently search your scripts directory.
- `xargs`: A command that builds and executes command lines from standard input.
- `improved-fzfmenu.sh`: A custom fzf menu script designed to enhance script selection with features like previews.
- `bat`: A `cat` clone with syntax highlighting and Git integration. It is utilized for previewing script documentation.

### Description

This script utilizes `fd` to search for executable scripts within the specified `$SCRIPTS` directory. It then pipes the results into an improved fzf menu, allowing users to interactively select and run their scripts. 

The script's flow works as follows:
1. `fd` is executed with an empty search string to list all scripts in the `$SCRIPTS` directory.
2. The output is formatted by `xargs`, which extracts just the filenames using `basename`.
3. The filenames are passed to `improved-fzfmenu.sh`, which presents them in a fzf interface.
4. A preview feature is integrated, powered by `bat`, allowing users to preview documentation of each script.
5. Upon selecting a script and pressing `enter`, the script will execute in a new bash shell.

The script also includes a commented-out line that, when activated, runs selected scripts in the background.

### Usage

To use the script, place it in your desired location, ensure it's executable, and run it via terminal as follows:

```bash
bash /home/matias/.scripts/script_launcher.sh
```

Alternatively, you can bind it to a keyboard shortcut in your window manager (Qtile) configuration:

```python
Key([mod], 's', lazy.spawn('/home/matias/.scripts/script_launcher.sh')),
```

In this setup, pressing `mod+s` would trigger the script launcher.

---

> [!TIP]
> Some enhancements could be made:
> - Consider adding error handling to inform users if no scripts are found.
> - The `$SCRIPTS` variable should be defined or accessible in the script to avoid errors.
> - If the script is not intended to run in the background often, the commented line could be removed to declutter the script.
