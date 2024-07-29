# obsidian.xsh

**Script Description**

This is a shell script written in xonsh, a Unix-like shell designed for interactive use. The script's primary functionality is to open an Obsidian note-taking application with a specific vault (database) by selecting it from a list of available vaults using the `fzf` command-line interface.

**Functionality Breakdown**

1. **Vault Discovery**: The script lists all directories in the `$HOME/PKM` directory, assuming that each directory represents an Obsidian vault. It stores these paths in the `vaults` variable.
2. **Vault Selection**: Using `fzfmenu.sh`, a custom implementation of the popular `fzf` command-line interface for file selection, the script displays a list of available vaults to the user and allows them to select one using their keyboard.
3. **Selected Vault Handling**:
	* If the user selects a vault (i.e., `selected_vault` is not empty), the script opens the selected vault in Obsidian using the `obsidian://open?vault=<vault_name>` URL scheme, which is specific to Obsidian.
	* If no vault is selected (i.e., `selected_vault` is empty), the script displays a notification message indicating that no vault was chosen.
4. **Error Handling**: The script includes basic error handling by checking if the user selection (`selected_vault`) is not empty before attempting to open the corresponding Obsidian vault.

**Assumptions and Dependencies**

This script assumes:

* `obsidian` is installed and available on the system.
* `$HOME/PKM` contains the directories representing Obsidian vaults.
* `fzfmenu.sh` is a custom implementation of `fzf` for file selection, which might not be widely available or maintained.

To run this script, you'll need to have xonsh installed and configured on your system.