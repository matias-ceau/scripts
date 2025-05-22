# ssh-fzf — Fuzzy SSH Command Launcher

---

**ssh-fzf.sh**: Fuzzy-find and execute ssh commands from `pass` using `fzf`.

---

### Dependencies

- `pass`: Secure password manager storing and retrieving passwords, ssh commands here.
- `fzf`: Command-line fuzzy finder for interactive selection.
- `bash`: Ensures commands are run in a login shell.
- Entry in `pass` (by convention: `ssh_cmds`): Should store a newline-separated list of SSH commands.

---

### Description

This script is designed to quickly launch SSH connections using commands securely stored and organized in your `pass` password store. The SSH commands must be saved as entries under `ssh_cmds` within `pass`—each command on a separate line.

**What it does:**

1. Retrieves SSH command entries using `pass ssh_cmds`.
2. Presents them in `fzf` so you can fuzzy search and pick one interactively.
3. If a choice is made, it runs it in a login shell to ensure shell config is sourced.

This integration is useful for users who manage multiple SSH hosts and want an ergonomic CLI workflow leveraging security and efficiency. Designed for minimal user interaction and intended as a quick-launch tool—ideal for workflow integration in qtile keybindings or simply from a terminal prompt.

---

### Usage

#### Interactive Terminal

Just run:

```
~/.scripts/bin/ssh-fzf.sh
```

#### From qtile Keybinding

Add a keybinding in your qtile config, for example:

```python
Key([mod], "s", lazy.spawn("~/.scripts/bin/ssh-fzf.sh"))
```

#### How to populate your `pass` entry

Store your SSH commands under `ssh_cmds` (newline-separated):

```
pass insert ssh_cmds
```
For example (paste one per line):
```
ssh matias@server1
ssh otheruser@backup-host
ssh -p 2222 me@myspecialbox
```

**Tldr:**

```
# Populate ssh_cmds in pass
pass insert ssh_cmds

# Invoke the script (choose host interactively)
~/.scripts/bin/ssh-fzf.sh
```

---

> [!TIP]
> - If the `ssh_cmds` entry is missing in `pass`, the script will fail silently—consider adding error handling for missing or empty entries.
> - The script assumes each line in `ssh_cmds` is a safe, valid SSH command. There's a potential risk if any line is not an SSH command or contains malicious shell code.
> - You may want to refresh your `pass` store or `fzf` index if changes aren't being picked up immediately.
> - For more complex workflows, consider also copying other connection information (like passwords/keys) or extending the script to manage multiple categories of remote hosts.