# Obsidian Vault Opener Script

---

**obsidian.xsh**: Open any Obsidian vault interactively using `fzf`

---

### Dependencies

- `xonsh`: A shell that combines Python and shell scripting. This script uses xonsh as its scripting language.
- `fzfmenu.sh`: Assumed to be a custom script or alias for `fzf`, a general-purpose command-line fuzzy finder.
- `eza`: A modern, colorful replacement for `ls`, used for previewing directory content.
- `notify-send`: A utility for sending desktop notifications.
- `obsidian`: Make sure Obsidian is installed and can be interacted with via the `obsidian://` URL protocol.

### Description

This script is designed to navigate and open your Obsidian vault directories located under `~/PKM`. It utilizes `xonsh` for its blend of Python and shell capabilities to list directories. The script then uses `fzfmenu.sh` for interactive vault selection with a live preview enabled by `eza`. If a vault is selected, the script constructs an Obsidian URL to open the chosen vault directly in the Obsidian application. If no vault is selected, it sends a desktop notification to alert the user.

### Usage

The script is invoked in the terminal and can be executed directly or mapped to a keybinding in your qtile window manager for quick access. 

To run the script, use:

```sh
~/.scripts/obsidian.xsh
```

You might wish to add a keybinding in qtile, for example:

```python
Key([mod], "o", lazy.spawn("~/.scripts/obsidian.xsh")),
```

Ensure the script is executable by running:

```sh
chmod +x ~/.scripts/obsidian.xsh
```

This command will trigger `fzf`, allowing you to select a vault. Navigate using `fzf` and preview files within the vault directory to make your selection intuitive.

---

> [!TIP]
> While the script interacts efficiently with the user's vaults, consider handling cases where `fzfmenu.sh` isn't installed to avoid script failure. Additionally, adding error handling for the `obsidian` URL invocation could provide more informative feedback on failures.