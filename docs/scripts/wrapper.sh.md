# Command Wrapper + Logger

---

**wrapper.sh**: Runs a command, then logs it with a timestamp to a fixed log file

---

### Dependencies

- `bash` — script interpreter
- `date` — generates a Unix timestamp (`%s`)
- `sleep` — adds a 1s delay after execution
- Write access to `/data/data/com.termux/files/home/log.txt` — fixed log destination (Termux path)

### Description

This tiny wrapper executes whatever command you pass to it, then appends a log line containing:

- the current Unix timestamp (seconds since epoch)
- the exact argument list you provided (`$@`)

It writes to a hardcoded log file located at:

`/data/data/com.termux/files/home/log.txt`

This path strongly suggests the script was designed for **Termux (Android)**, not Arch Linux. After logging, it sleeps for one second, which can be useful for rate-limiting rapid invocations (e.g., if triggered repeatedly by a keybinding or file watcher).

Key behavior details:

- The command is executed via `$@` (word-splitting preserved by the shell). No extra quoting/escaping is applied.
- Logging happens **after** the command runs, regardless of whether it succeeded or failed (no exit-status handling).
- The log line format is:  
  `TIMESTAMP - command arg1 arg2 ...`

### Usage

Run a command through the wrapper:

```sh
/home/matias/.scripts/dev/wrapper.sh notify-send "Hello" "World"
```

Open a program and log it:

```sh
/home/matias/.scripts/dev/wrapper.sh alacritty -e htop
```

tldr:

```sh
wrapper.sh <command> [args...]
```

If you want to use it from qtile keybindings, point the keybinding to the wrapper and pass the command as arguments (ensure absolute paths if needed).

---

> [!TIP]
> - The log path is hardcoded to a Termux location; on Arch you likely want something like `$XDG_STATE_HOME/script-logs/log.txt` (or `~/.local/state/...`) and to `mkdir -p` the parent dir.
> - Use `"$@"` (quoted) instead of `$@` to preserve arguments safely, especially for spaces and special characters.
> - Consider logging exit status: `status=$?; ...; echo "... (exit=$status)" >> ...; exit $status` so callers can rely on the wrapper’s return code.
> - If the command is long-running, logging happens only after it finishes; if you want “started” logs, log before execution too.