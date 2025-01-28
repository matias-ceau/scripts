# ssh-fzf: SSH Connection Selector

---

**ssh-fzf.sh**: Quickly select and connect to an SSH destination using `fzf`.

---

### Dependencies

- `pass`: A command-line password manager to retrieve stored SSH commands.
- `fzf`: A general-purpose command-line fuzzy finder for selecting items.
- `ssh`: For initiating the SSH connection.

### Description

This script allows the user to establish an SSH connection by choosing an SSH command from a predefined list stored in their `pass` password manager. The flow of the script is straightforward:
1. It retrieves SSH commands stored in `pass ssh_cmds`.
2. The user selects an item from this list interactively using the `fzf` fuzzy finder.
3. Once an option is chosen, the script establishes an SSH connection using the `ssh` command.

This script simplifies the process of connecting to different servers by avoiding the need to remember or manually type long SSH commands.

### Usage

1. **Setup**:
   - Ensure your `pass` manager has an entry called `ssh_cmds` with SSH command options, e.g.:
     ```
     server1_user@server1.com
     server2_user@server2.com
     ```
   - Install necessary dependencies (`pass`, `fzf`, and your SSH client).

2. **Run the Script**:
   You can execute the script directly or bind it to a shortcut in qtile:
   ```bash
   ~/.scripts/bin/ssh-fzf.sh
   ```
   On execution, `fzf` will present a list of SSH commands stored in `pass ssh_cmds`. Use the keyboard to select a command, hit **Enter**, and the script will immediately run `ssh` to connect to the chosen server.

3. **Example Output**:
   Assuming `ssh_cmds` contains:
   ```
   alice@192.168.1.10
   bob@example.com
   ```
   Running the script will open a fuzzy finder like:
   ```
   > alice@192.168.1.10
     bob@example.com
   ```
   After selection, `ssh alice@192.168.1.10` or `ssh bob@example.com` will be executed.

---

> [!TIP] 
> - **Security Consideration**: Ensure that the `ssh_cmds` entry in `pass` does not expose sensitive details like private keys or plaintext passwords.
> - **Error Handling**: If `pass ssh_cmds` or `fzf` fails, the script does not handle the error gracefully. Consider adding checks to ensure that `pass` and `fzf` exist and exit with meaningful errors if something goes wrong.
> - **Expandability**: You may want to extend this script to include optional flags for the SSH command or allow dynamic addition of entries to `ssh_cmds`.