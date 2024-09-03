# Obsidian Vault Launcher

---

**obsidian.xsh**: Open any Obsidian vault from your PKM directory

---

### Dependencies

- `xonsh`: A Python-based shell that allows for a user-friendly scripting environment.
- `fzfmenu.sh`: A script to list options with a fuzzy finder interface, allowing users to select from multiple vaults visually.
- `notify-send`: A command to send desktop notifications for feedback and error handling.

### Description

The `obsidian.xsh` script is designed to facilitate the opening of an Obsidian vault from a specified directory—specifically, the `$HOME/PKM` directory where your personal knowledge management files are likely stored. The script uses `xonsh`, making it efficient and versatile due to xonsh's blend of shell features and Python capabilities.

1. **Vault Discovery:** The script starts by collecting a list of directories located in the `$HOME/PKM` folder. Each directory corresponds to a vault that can be opened in Obsidian.
   
2. **Selection Interface:** Users can select the desired vault using `fzfmenu.sh`, which provides a user-friendly selection menu. The preview feature shows files modified in the vault for better context.

3. **Opening the Vault:** Once a vault is selected, the script constructs a URI to open it in Obsidian. If no vault is selected, it sends a notification to inform the user.

### Usage

To use this script, ensure you have the necessary dependencies installed. Run the script in your terminal with the following command:

```bash
/home/matias/.scripts/obsidian.xsh
```

You can also bind this script to a keybinding in your window manager (qtile) for quick access.

Example keybinding setup in `~/.config/qtile/config.py`:

```python
Key([mod], 'o', lazy.spawn("/home/matias/.scripts/obsidian.xsh")),
```

---

> [!TIP] 
> Consider implementing the vault search feature mentioned in the TODO comment. This would allow for quicker access when dealing with a large number of vaults. Additionally, adding error-checking mechanisms for cases where Obsidian is not installed could improve your user experience.