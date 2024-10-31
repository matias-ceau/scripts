# Obsidian Vault Opener

---

**obsidian.xsh**: Quickly open an Obsidian vault using a menu-driven interface.

---

### Dependencies

- `xonsh`: A Python-powered shell for executing scripts.
- `fzfmenu.sh`: Fuzzy finder script that provides interactive menus.
- `eza`: An enhanced, modern replacement for `ls` that is used for previews in the menu.
- `obsidian`: The Obsidian application that will be used to open the vaults.
- `notify-send`: A utility to send notifications to the user.

### Description

The `obsidian.xsh` script is a convenient utility for opening Obsidian vaults stored in a specific directory on your system. Written in `xonsh`, this script utilizes the `fzfmenu.sh` tool to present the user with a list of available vaults stored in the `~/PKM` directory. The vaults are displayed alongside a preview, which is generated using `eza` to show the directory structure sorted by the most recently modified files. Once a selection is made, if a valid vault is chosen, it opens in Obsidian via a URL scheme. If no vault is selected, a notification is sent to inform the user that no vault was chosen.

### Usage

To use this script, ensure it is executable and invoke it from the terminal:

```sh
$ xonsh ~/home/matias/.scripts/bin/obsidian.xsh
```

The script will display a menu of available vaults using `fzfmenu.sh`, where you can navigate and select a vault. Once selected, it will open in Obsidian. This script can also be integrated into your window manager's keybindings (such as Qtile), enabling quick access to your vaults:

```python
# Example Qtile keybinding
Key([mod], "o", lazy.spawn("xonsh /home/matias/.scripts/bin/obsidian.xsh")),
```

Make sure all dependencies are installed and properly configured.

---

> [!TIP]
> Consider refining the `vault search` functionality to improve usability by allowing filtered searches or preset listings. Additionally, the handling of dependencies should be verified to confirm they exist before execution. Lastly, ensure compatibility with any script changes in `fzfmenu.sh` or `eza` outputs as these might affect usability.