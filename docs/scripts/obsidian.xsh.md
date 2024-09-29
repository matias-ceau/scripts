# Open Obsidian Vaults Script

---

**obsidian.xsh**: A script to open any Obsidian vault using `fzf`.

---

### Dependencies

- `xonsh`: An advanced shell that combines the best features of bash, Python, and other shells.
- `fzf`: A command-line fuzzy finder which allows easy selection from the list of vaults.
- `eza`: A modern replacement for `ls` with additional features and colorful output.

### Description

This script is designed to help users quickly open their Obsidian vaults without having to navigate through directories manually. It retrieves a list of vaults from a predefined directory (`$HOME/PKM`), processes this list through `fzf` to present an interactive selection menu, and ultimately opens the chosen vault in Obsidian.

**Key Functions:**

1. **Vault Discovery**: The script creates a list of vaults by checking each item's type in the `$HOME/PKM` directory. It filters these items to ensure only directories (vaults) are considered.
  
2. **User Interaction**: The `fzf` tool is used to display vault names, allowing users to select one easily. It presents a preview of the contents of the selected vault using `eza`.

3. **Open Vault**: If a user selects a vault, the script constructs an Obsidian-specific URI to open it. If no vault is selected, it sends a desktop notification to inform the user.

### Usage

You can run this script directly from your terminal or bind it to a key in your window manager (Qtile). Ensure that the necessary dependencies are installed beforehand. Here's how to execute the script:

```bash
/home/matias/.scripts/obsidian.xsh
```

When executed, the script will present an interactive list of your vaults. Simply navigate through the options and select one to open it in Obsidian.

---

> [!TIP]
> The script could be improved by adding error handling for cases where the `$HOME/PKM` directory is empty or does not exist. Additionally, providing a way to manually input a vault name in case the selection fails could enhance user experience.