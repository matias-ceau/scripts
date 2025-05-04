# fzfmenu_run.sh: Fuzzy Finder Application Launcher

---

**fzfmenu_run.sh**: A dmenu replacement script utilizing `fzf` for application selection within a floating terminal.

---

### Dependencies

This script requires the following dependencies to function properly:
- `fzfmenu_cache.sh`: **Local script dependency**—Expected to provide a list of cached or available applications.
- `improved-fzfmenu.sh`: **Local script dependency**—Enhances the functionality of `fzf` for menu-based selection.
- `fzf`: A command-line fuzzy finder.
- `systemd-run`: Used to run the selected application under the current user scope.

_Please ensure that the above scripts (`fzfmenu_cache.sh` and `improved-fzfmenu.sh`) are available in your `$PATH` or modify the script to reference their absolute paths._

---

### Description

This script replaces `dmenu_run` functionality by integrating `fzf` for fuzzy searching and launching applications. It streams a list of commands (provided by `fzfmenu_cache.sh`) through `improved-fzfmenu.sh` to filter and select the desired program interactively.

Key features:
- **Nested script processing**: `fzfmenu_cache.sh` provides a list of potential applications, piped into `improved-fzfmenu.sh` for menu enhancement.
- **Floating terminal experience**: Designed to run within a floating `xterm` (though the terminal aspect is implied and not explicitly managed here).
- **Systemd scope**: Applications are launched in a separate user scope through `systemd-run`, which ensures clean process management.

---

### Usage

This script can be used as follows:

#### Interactive Execution
Run the script directly from a terminal:
```bash
~/.scripts/bin/fzfmenu_run.sh
```

You will be presented with a fuzzy search menu powered by `fzf`. Choose an application or command to execute it. The script automatically exits if no selection is made.

#### Qtile Integration
Bind the script to a keybinding within your Qtile configuration:
```python
Key([mod], "r", lazy.spawn("~/.scripts/bin/fzfmenu_run.sh")),
```
Pressing `Mod+r` launches the search menu for application selection.

---

> [!TIP]
> - **Hardcoded Dependencies**: The script assumes `fzfmenu_cache.sh` and `improved-fzfmenu.sh` are in the `$PATH`. Consider making these dependencies configurable with an environmental variable or an initial check.
> - **Terminal Management**: If this script is meant for a floating `xterm`, specify it explicitly for clarity and usability.
> - **Error Handling**: Enhance handling of exceptional cases, such as missing dependencies or improper configurations. Warnings or fallback behavior could improve user experience.
> - **Documentation of User Scripts**: Include brief documentation or reference for `fzfmenu_cache.sh` and `improved-fzfmenu.sh`, as their functionality is key to this script’s behavior.