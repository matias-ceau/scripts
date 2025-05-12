# fzfmenu_run.sh

---

**fzfmenu_run.sh**: Dmenu run replacement using fzf in a floating xterm terminal

---

### Dependencies

This script requires the following dependencies:

- `fzfmenu_cache.sh`: A required script to feed options into the fzf pipeline.
- `improved-fzfmenu.sh`: A script that processes the fzf pipeline and contributes additional features like ANSI formatting.
- `fzf`: A general-purpose command-line fuzzy finder.
- `systemd`: Utilized for creating a user-level scope to run the selected command.
- A floating terminal setup compatible with your Arch Linux environment. On qtile, this might be configured through keybindings or specific terminal properties.

### Description

This script acts as an alternative to the conventional `dmenu_run`, offering a more interactive experience via `fzf`. It utilizes cached application paths or commands as input to `fzf`, where you can fuzzy search for specific applications or scripts. Once an item is selected:

1. It checks if anything was selected. If not, the script exits silently.
2. If a selection exists, it executes the chosen command using `systemd-run` under a new user scope. This ensures the execution does not block other operations.

Additionally, the script offers convenience features such as processing cached inputs and additional display formatting, thanks to `fzfmenu_cache.sh` and `improved-fzfmenu.sh`.

### Usage

To use the script, ensure it is executable:
```bash
chmod +x /home/matias/.scripts/bin/fzfmenu_run.sh
```

Execute the script directly:
```bash
~/.scripts/bin/fzfmenu_run.sh
```

Alternatively, you can bind the script to a key combination in qtile. For instance, you can add this to your `~/.config/qtile/config.py`:
```python
Key([mod], "r", lazy.spawn("~/.scripts/bin/fzfmenu_run.sh"), desc="Run fzf launcher")
```

Sample Input/Output interaction:
- The script shows a fuzzy-search interface with the available binaries, scripts, or commands.
- Example: Typing `fire` might show `firefox`, `firewalld`, etc.
- After selecting `firefox`, it will launch the browser in a new window.

---

> [!NOTE]
> - This script assumes `fzfmenu_cache.sh` and `improved-fzfmenu.sh` are present and functional. If they are missing or have bugs, the script will fail entirely.
> - Consider adding error handling. For example, verify that dependencies like `fzf` or the required scripts are available before running the main logic.
> - While systemd-run adds robustness, it might not be ideal in all use cases, such as environments where systemd isn't available. Consider adding fallbacks.
> - Provide further customization for users to configure the floating terminal setup if not predefined in their environment.