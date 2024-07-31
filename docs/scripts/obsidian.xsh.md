# Open Obsidian Vault (obsidian.xsh)

---

Open a selected Obsidian vault using fzfmenu.

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

- [xonsh](https://xon.sh)
- [fzfmenu.sh](https://github.com/junegunn/fzf/wiki/Useful-tips#fzfmenu)
- Obsidian application
- Notify-send utility for notifications

<a name="description" />

### Description

<a name="overview" />

#### Overview

This script allows users to open an Obsidian vault with a simple menu selection using `fzfmenu`. It dynamically lists directories located in a specified folder (`$HOME/PKM`), which should contain the user's Obsidian vaults. The script leverages Xonsh for execution and interactivity, and the selected vault is opened in the Obsidian application.

The main steps within this script include:
1. **Vault Listing**: The script computes a list of directories in the specified vault directory using shell commands.
2. **User Selection**: It utilizes `fzfmenu.sh` to present the available vaults to the user with a preview of their contents.
3. **Vault Opening**: On selection, it constructs an Obsidian URL to open the chosen vault or notifies the user if no vault was selected.

---

<a name="usage" />

#### Usage

To use the script, simply run it in your terminal:

```shell
./obsidian.xsh
```

Make sure the script is executable:

```shell
chmod +x /home/matias/.scripts/obsidian.xsh
```

You can also bind this script to a key within your window manager or desktop environment for quicker access.

<a name="examples" />

#### Examples

1. Launch the script:

```shell
/home/matias/.scripts/obsidian.xsh
```

2. Select a vault using the `fzf` interface displayed in your terminal.

---

<a name="notes" />

### Notes

- Ensure that `fzfmenu.sh` is properly installed and available in your `PATH` to utilize this script effectively.
- Adjust the `$HOME/PKM` path if your vaults are stored in a different location.
- The `${home}` variable should correctly resolve to your home directory; ensure no environment conflicts.

> **Critique**: 
> - The script relies on direct shell command substitutions which may not handle errors gracefully under certain circumstances. Implementing error checks for directory permissions or content might improve resilience.
> - The commented code snippet using `subprocess.Popen` suggests a possible alternative for user interface handling; optimizing or providing a fallback to `dmenu` could be beneficial for users not familiar with `fzfmenu.sh`.