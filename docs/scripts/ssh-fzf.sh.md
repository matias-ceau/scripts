# SSH command picker (pass + fzf)

---

**ssh-fzf.sh**: Pick an SSH command from pass via fzf and execute it in a login shell

---

### Dependencies

- `bash` — script interpreter
- `pass` — provides the `ssh_cmds` entry containing your SSH commands
- `fzf` — interactive fuzzy finder UI

### Description

This script is a tiny launcher for SSH (or generally *any*) commands stored inside your password-store. It:

1. Reads the content of `pass ssh_cmds` (a multiline secret/entry in your `~/.password-store`).
2. Pipes it into `fzf` so you can interactively search and select one line.
3. If you selected something (non-empty), it executes that line via `bash -l -c`.

Using `bash -l` is convenient on Arch because it loads your login shell environment (e.g., `~/.bash_profile`), making sure your PATH, SSH agent variables, and any qtile-launched environment quirks are consistent. This is especially useful when triggering it from qtile keybindings where the environment can differ from a terminal.

Your `ssh_cmds` entry should typically be a list of one-command-per-line, for example:

- `ssh myuser@host`
- `ssh -J jump user@internal-host`
- `mosh user@server` (works too)

### Usage

Run interactively (needs a TTY for `fzf`):

- `ssh-fzf.sh`

Recommended from qtile: bind it to open in your terminal (since `fzf` is interactive), e.g. via your preferred terminal command.

tldr:

- Add lines to pass:  
  - `pass edit ssh_cmds`
- Pick a line with fuzzy search:
  - `ssh-fzf.sh`
- Execute selection automatically on Enter.

---

> [!TIP]
> Consider trimming out the password-store “first line” convention: `pass` entries often start with a password on line 1. If `ssh_cmds` follows that pattern, `fzf` may show (and execute) unintended lines. You can mitigate by storing only commands in that entry, or by filtering (e.g., `tail -n +2`). Also note that executing arbitrary strings via `bash -c` is powerful but risky—ensure only trusted commands are stored there, and consider adding a preview (`fzf --preview`) or confirmation prompt before execution.