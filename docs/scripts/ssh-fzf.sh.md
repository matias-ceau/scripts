# SSH Command Selector

---

**ssh-fzf.sh**: Select and execute an SSH command from a list

---

### Dependencies

- `pass` – A password management tool used here to retrieve saved SSH commands.
- `fzf` – An interactive command-line fuzzy finder that allows quick selection of a command.
- `bash` – The script relies on Bash for execution, particularly using a login shell (`bash -l`).

### Description

This script facilitates the selection and execution of SSH commands stored in your password manager database (managed by `pass`). It retrieves a list of commands labeled under "ssh_cmds" from `pass` and pipes them into `fzf` for interactive selection.

The workflow is straightforward:
1. The script calls `pass ssh_cmds` to retrieve a set of SSH command entries.
2. These commands are fed to `fzf`, allowing you to swiftly search and choose one.
3. If a command is selected (i.e., the variable `_chosen` is non-empty), the script spawns a new Bash login shell (`bash -l -c`) to execute the chosen command.

This design efficiently integrates secure storage, fuzzy search, and command execution, letting you quickly initiate SSH sessions with minimal keystrokes—ideal for environments like Arch Linux running a window manager like qtile.

### Usage

To use this script:
- Ensure you have `pass`, `fzf`, and Bash installed on your Arch Linux system.
- Populate your `pass` database with SSH commands under the "ssh_cmds" entry.
- Make the script executable if it isn’t already:

  chmod +x /home/matias/.scripts/bin/ssh-fzf.sh

- Execute the script from a terminal:

  /home/matias/.scripts/bin/ssh-fzf.sh

- Alternatively, you can bind the script to a key in your qtile configuration for quick access.

Example (in a terminal):

  $ /home/matias/.scripts/bin/ssh-fzf.sh

---

> [!TIP]  
> The script assumes that SSH commands are properly stored in your `pass` database under "ssh_cmds". Consider adding error handling for situations where the command might not be valid or if `pass` returns no results. Additionally, be cautious with commands that require specific environment variables; executing them in a new login shell may have unexpected behaviors if your login profiles are not set up accordingly.