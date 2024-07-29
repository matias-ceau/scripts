# obsidian.xsh

# Obsidian Vault Opener

This script is an interactive utility for opening an Obsidian vault from a list of available vaults in a given directory. It uses `fzf` for a user-friendly and efficient vault selection process.

## Features

- **Dynamic Vault Listing**: The script dynamically lists all the vaults (directories) under the specified directory (`$HOME/PKM`).
- **Interactive Search**: Uses `fzf` for an interactive and visually appealing vault selection with previews of the vault content.
- **Obsidian Integration**: Opens the selected vault directly in Obsidian using the Obsidian URL scheme.
- **Notification**: Provides feedback through a notification if no vault is selected.

## Usage

Before running the script, make sure you have the following dependencies installed:
- [Obsidian](https://obsidian.md/)
- [fzf](https://github.com/junegunn/fzf)
- [eza](https://github.com/eza-community/eza)
- [notify-send](https://packages.ubuntu.com/bionic/libnotify-bin)

### Instructions

1. **Place the script in your executable path:**

    Save the script as `obsidian-vault-opener.xsh` or any preferred name in a directory that's included in your system's executable path.

2. **Make the script executable:**
    ```bash
    chmod +x /path/to/obsidian-vault-opener.xsh
    ```

3. **Execute the script:**
    ```bash
    ./obsidian-vault-opener.xsh
    ```

### Customization

- **Vault Directory**: By default, the script searches for vaults in the `$HOME/PKM` directory. You can change this directory by modifying the line:
    ```python
    vaults = [i for i in $(ls $HOME/PKM).split() if $(file -b $HOME/PKM/@(i)) == 'directory']
    ```

## Code Explanation

```python
#!/usr/bin/env xonsh

# Vault names: Lists all directories under the specified path, assuming they are Obsidian vaults
vaults = [i for i in $(ls $HOME/PKM).split() if $(file -b $HOME/PKM/@(i)) == 'directory']

# Use fzf to get the selected vault name with a real-time preview of the vault's content
selected_vault = $(echo @('\n'.join(vaults)) | fzfmenu.sh --preview='eza -T --sort=modified --color=always $HOME/PKM/{}') 

# Check if a vault is selected and open it in Obsidian, otherwise notify the user
if selected_vault:
    obsidian @(f"obsidian://open?vault={selected_vault}")
else:
    notify-send "Obsidian open script" "No vaults selected"
```

## Remarks

- This script provides a simple and extensible framework to interactively open an Obsidian vault.
- The commented-out code sections using `dmenu` can be used alternatively for a graphical menu if `fzf` is not preferred.

Feel free to extend and modify this script to better suit your workflow for managing and opening Obsidian vaults.