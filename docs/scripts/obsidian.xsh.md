# Obsidian Launcher Script (obsidian.xsh)

---

Open any obsidian vault with a user-friendly selection interface.

---

### Table of contents

- [Dependencies](#dependencies)
- [Description](#description)
    - [Overview](#overview)
    - [Usage](#usage)
    - [Examples](#examples)
- [Notes](#notes)

---

<a name="dependencies" />

### Dependencies

- `xonsh` - A Python-powered shell language and command prompt.
- `fzfmenu.sh` - A utility for fuzzy finding items from a list.
- `eza` - A modern replacement for `ls` that supports coloring and file previews.
- `notify-send` - A tool for sending desktop notifications.

<a name="description" />

### Description

<a name="overview" />

#### Overview

This script allows users to easily open any Obsidian vault located in the `$HOME/PKM` directory using a graphical interface for selecting the vault. It starts by gathering the names of existing vaults (directories) and presents them in a list for the user to choose from.

The initial list of vaults is generated using a xonsh list comprehension that filters directories only:

```python
vaults = [i for i in $(ls $HOME/PKM).split() if $(file -b $HOME/PKM/@(i)) == 'directory']
```

Once the list is created, it utilizes `fzfmenu.sh` to allow the user to select one of the vaults interactively. If the selection is successful, the script constructs the corresponding Obsidian URI and launches the application. If no vault is selected, it provides a notification to inform the user.

---

<a name="usage" />

#### Usage

1. Ensure you have the necessary dependencies installed on your Arch Linux system.
2. Make the script executable by running the command:
   ```bash
   chmod +x /home/matias/.scripts/obsidian.xsh
   ```
3. Execute the script from the terminal:
   ```bash
   /home/matias/.scripts/obsidian.xsh
   ```
4. Select your desired vault from the list presented in the fuzzy finder interface.

<a name="examples" />

#### Examples

- **Open a Vault**: Running the script will bring up a fuzzy search interface listing all available vaults. Just type part of the vault name to filter quickly.

---

<a name="notes" />

### Notes

- The script currently uses `fzfmenu.sh`. Ensure you have it in your PATH.
- If you want to change the path for your vaults, modify the `$HOME/PKM` variable in the script to point to your desired directory.

> **Critique**: 
> The script could be further improved by adding functionality to quickly search by typing while in the `fzfmenu.sh` interface. Additionally, implementing error handling for the case where there are no vaults in the directory would help improve the user experience. The commented `dmenu` approach is another choice; consider including it as an optional method based on user preference.