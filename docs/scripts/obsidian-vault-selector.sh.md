# Obsidian Vault Selector

---

**obsidian-vault-selector.sh**: A script to select and open any Obsidian vault.

---

### Dependencies

- `eza`: A modern alternative to `ls`, providing enhanced directory listing features.
- `bat`: A `cat` clone with syntax highlighting and Git integration for improved file viewing.
- `jq`: A lightweight and flexible command-line JSON processor.
- `improved-fzfmenu.sh`: A script that extends `fzf` capabilities for enhanced user interaction.

### Description

The **Obsidian Vault Selector** script allows users to efficiently select and open an Obsidian vault from their file system. The script leverages various command-line utilities to provide a visually appealing and functional interface.

1. **preview_cmd**: This function lists directory contents in a streamlined format, showing modified timestamps and total sizes with icons for better visibility.
2. **open_vault**: This function opens the selected vault using Obsidian, ensuring that a vault name is provided; otherwise, it displays a notification indicating no selection was made.
3. **search_cmd**: Retrieves the list of available vaults defined in the Obsidian configuration file, parsing it to output the vault paths neatly.
4. **plabel_cmd**: Similar to `preview_cmd`, but specifically shows directory contents in a single line format.

### Usage

To use this script, simply run it in your terminal. You can use the following command:

```bash
bash /home/matias/.scripts/obsidian-vault-selector.sh
```

The script will use `improved-fzfmenu.sh` to present a selectable list of available vaults, enhanced by the preview functionality. 

1. **Selection**: Use the arrow keys to navigate the vault options presented.
2. **Opening a vault**: Press `Enter` to open the selected vault in Obsidian.
3. **No selection**: If no vault is selected, a notification prompt will inform the user of this.

You can also integrate this script into a keybinding in your Window Manager, allowing for quick access to your Obsidian vaults.

---

> [!TIP] 
> While the `obsidian-vault-selector.sh` script is functional, there are several potential improvements:
>
> - Consider adding error handling for scenarios where the Obsidian application is not installed or accessible.
> - Enhance the parsing of `obsidian.json` to handle cases where vault paths might be misconfigured or contain spaces.
> - Implement caching of vaults for quicker access on subsequent runs, reducing reliance on continually reading the `obsidian.json` file.