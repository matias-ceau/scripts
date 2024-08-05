# Obsidian Vault Opener Script

---

**obsidian.xsh**: Open any Obsidian vault from a user-defined directory

---

### Dependencies

- `fzfmenu.sh`: A script used for displaying a user-friendly menu to select the vault.
- `obsidian`: The application that is being triggered to open the selected vault.
- `notify-send`: Utility to send desktop notifications.

### Description

This script is designed to help users quickly open any vault in the Obsidian knowledge management tool from a pre-defined directory (`$HOME/PKM`). 

- **Directory Scanning**: The script scans the specified directory for folders which represent different obsidian vaults. It generates a list of these vaults for the user's selection using `fzfmenu.sh`.
- **User Selection**: The user is prompted to select a vault from the generated list using a menu interface. The script uses `fzfmenu.sh` to facilitate this selection.
- **Launching Vaults**: Once a vault is selected, it launches Obsidian using a specific URI format to open the desired vault. If no vault is selected, a notification is displayed to inform the user.

### Usage

To utilize this script, you can run it directly in your terminal. Ensure that you have the dependent utilities installed. The script can be executed simply by invoking:

```bash
~/path/to/obsidian.xsh
```

### Key Features:
- Automatically lists available vaults from your personal knowledge management directory.
- Allows for seamless selection of vaults using a graphical interface.
- Provides user feedback when no vaults are selected.

Example command to run the script:

```bash
/home/matias/.scripts/obsidian.xsh
```

---

> [!TIP]
> The script currently lacks error handling when the `fzfmenu.sh` command fails or returns unexpected results. It may be useful to implement checks or fallbacks if the `fzfmenu.sh` command does not succeed in retrieving vault names. Additionally, consider adding an interactive prompt feature that allows users to input a path to the vault directory dynamically, enhancing script usability.