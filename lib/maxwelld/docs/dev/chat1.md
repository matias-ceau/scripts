Perfect. This is becoming clear: you want **RightCtrl alone** → bring up the assistant console (a tmux session inside kitty, showing AI activity + chat prompt).  
Everything else (layer combos like Rc+S, Rc+M, etc.) → go to **scripts** that POST/log to `maxwelld`.

Let’s break that into two steps:

---

# 1. RightCtrl → Maxwell Console (UI)

Bind in `keyd` to toggle a tmux session inside kitty:

**`/etc/keyd/default.conf`**

```ini
[main]
rightcontrol = command(/home/you/bin/maxwell-ui.sh)
```

**`~/bin/maxwell-ui.sh`**

```bash
#!/usr/bin/env bash
# Open or attach to the Maxwell console session

SESSION="maxwell"

# Use systemd-run so each UI launch is scoped and won’t kill your daemon
systemd-run --user --scope kitty -e tmux new-session -A -s "$SESSION" -n ui
```

- `-A`: attach to existing session if running.
- `-n ui`: window name in tmux.
- This console is where `maxwelld` can dump logs with `tmux pipe-pane`, or clients echo activities.

---

# 2. Maxwell Daemon (`maxwelld`)

Runs under systemd, owns a **Unix socket** + optional TCP port.  
It’s the **log + orchestrator**. Scripts communicate with it via `socat`/`curl`/`nc`.

### systemd service

**`~/.config/systemd/user/maxwell.service`**

```ini
[Unit]
Description=Maxwell Assistant Daemon
After=network.target

[Service]
ExecStart=%h/bin/maxwelld
Restart=on-failure

[Install]
WantedBy=default.target
```

Enable with:

```bash
systemctl --user enable --now maxwell
```

---

# 3. Daemon Stub

**`~/bin/maxwelld`**

```bash
#!/usr/bin/env python3
import socket, os, sys, threading

SOCKET_PATH = os.path.expanduser("~/.local/run/maxwell.sock")
LOGFILE = os.path.expanduser("~/.local/share/maxwell/history.log")

# clean up any previous run
try:
    os.remove(SOCKET_PATH)
except FileNotFoundError:
    pass

server = socket.socket(socket.AF_UNIX, socket.SOCK_STREAM)
server.bind(SOCKET_PATH)
server.listen()

print("maxwelld listening on", SOCKET_PATH)

def handle_client(conn):
    data = conn.recv(8192).decode()
    if not data:
        conn.close()
        return
    # log to history file
    with open(LOGFILE, "a") as f:
        f.write(data + "\n")
    # optionally push to a tmux buffer:
    os.system(f"tmux load-buffer -b maxwell \"{data}\"")
    conn.sendall(b"ok\n")
    conn.close()

while True:
    conn, _ = server.accept()
    threading.Thread(target=handle_client, args=(conn,), daemon=True).start()
```

This daemon:

- Listens on a Unix socket.
- Logs incoming messages into a file.
- Pushes messages into a tmux buffer (`maxwell`).
- (Later: you can expand with structured JSON and command dispatch).

---

# 4. Script Stubs

Each script logs activity → socket. They don’t need to know about each other; the daemon is the hub.

### `maxwell-screenshot`

```bash
#!/bin/bash
IMG="/tmp/maxwell-shot-$(date +%s).png"

if command -v grim >/dev/null && command -v slurp >/dev/null; then
    grim -g "$(slurp)" "$IMG"
    echo "screenshot:$IMG" | socat - UNIX-CONNECT:$HOME/.local/run/maxwell.sock
    # attempt OCR
    if command -v tesseract >/dev/null; then
        TXT=$(mktemp)
        tesseract "$IMG" "$TXT" &>/dev/null
        CONTENT=$(cat "$TXT.txt")
        echo "ocr:$CONTENT" | socat - UNIX-CONNECT:$HOME/.local/run/maxwell.sock
    fi
else
    echo "grim/slurp required" >&2
fi
```

---

### `maxwell-stt`

```bash
#!/bin/bash
WAV="/tmp/maxwell-voice-$(date +%s).wav"

arecord -f cd -t wav "$WAV" &
PID=$!

echo "Recording… press Ctrl-C to stop"
wait $PID

# Stub: pretend it’s transcribed by echo
TRANSCRIPT="(pretend) Speech transcribed from $WAV"
echo "stt:$TRANSCRIPT" | socat - UNIX-CONNECT:$HOME/.local/run/maxwell.sock

# Later: pipe $WAV into vosk/whisper, allow editing in $EDITOR
```

---

### `maxwell-copy`

```bash
#!/bin/bash
DATA="$(xclip -o -selection clipboard 2>/dev/null || wl-paste)"
echo "copy:$DATA" | socat - UNIX-CONNECT:$HOME/.local/run/maxwell.sock
tmux load-buffer -b "maxwell-$(date +%s)" <<<"$DATA"
```

---

### `maxwell-paste`

```bash
#!/bin/bash
BUF=$(tmux list-buffers -F "#{buffer_name}" | fzf)
if [ -n "$BUF" ]; then
    tmux paste-buffer -b "$BUF"
else
    echo "No buffer selected"
fi
```

---

# 5. Putting It Together

- `RightCtrl` → toggles kitty/tmux “Maxwell Console”.
- Daemon `maxwelld` runs and logs events → file + tmux logs.
- Scripts (`maxwell-screenshot`, `maxwell-stt`, `maxwell-copy`, `maxwell-paste`) → all they do is **log events through the socket**.
- The tmux UI can show logs in real time (e.g. `tail -f history.log`).

---

👉 Next Step:  
Would you like me to **flesh out the tmux UI config**, so that when you launch with `RightCtrl`, you land in a split‑pane layout — top pane: scrolling AI log, bottom pane: interactive REPL/chat prompt linked to `maxwelld`? That would give you the **Glass Teletype** feel for Maxwell.


python -c 'import base64; n=100*365*24*60*60; priPerfect — let’s concretize this into a **modern glass TTY for Maxwell**:

We want:

- Hitting **RightCtrl** spawns kitty + tmux session `"maxwell"`.  
- Top pane: an `fzf` history browser, showing each *activity entry* by unique ID.  
- Bottom pane: an interactive REPL/prompt for typing commands/queries that get sent to `maxwelld`.

---

## File organization

Let’s put logs here:

```
$XDG_DATA_HOME/maxwelld/history/
  ├── 1708634123.log     # each log is an "entry file" ID = epoch seconds
  ├── 1708634128.log
  └── ...
```

So each script (`maxwell-screenshot`, `maxwell-stt`, etc.) will do something like:

```bash
LOGDIR="${XDG_DATA_HOME:-$HOME/.local/share}/maxwelld/history"
mkdir -p "$LOGDIR"
TS="$(date +%s)"
echo "screenshot done: $IMG" >"$LOGDIR/$TS.log"

# also send to socket as before
echo "screenshot:$IMG" | socat - UNIX-CONNECT:$HOME/.local/run/maxwell.sock
```

That way, each file in `history/` is its own atomic entry.  

---

## fzf History Browser

We’ll use `fzf` to pick an ID. For example:

```bash
ls -1 "${XDG_DATA_HOME:-$HOME/.local/share}/maxwelld/history"/*.log \
    | sort -r \
    | fzf --preview 'cat {}' --preview-window=down:10:wrap
```

- Left side = list of IDs (`1234567890.log`) sorted newest first.  
- Hitting ↵ shows that entry (cat invoked).  
- Or in tmux, we can bind keys (ENTER = copy to buffer, etc.).

---

## tmux layout

**`~/bin/maxwell-ui.sh`**

```bash
#!/usr/bin/env bash
SESSION="maxwell"
LOGDIR="${XDG_DATA_HOME:-$HOME/.local/share}/maxwelld/history"

systemd-run --user --scope kitty -e tmux new-session -d -s "$SESSION" -n history

# Top pane: fzf file picker
tmux send-keys -t "$SESSION":history.0 \
    "ls -1 $LOGDIR/*.log 2>/dev/null | sort -r | fzf --preview 'cat {}' --preview-window=down:10:wrap" C-m

# Split: bottom pane = REPL prompt
tmux split-window -v -p 30 -t "$SESSION" \
    "while true; do read -p 'maxwell> ' line && echo \"cmd:$line\" | socat - UNIX-CONNECT:$HOME/.local/run/maxwell.sock; done"

tmux attach -t "$SESSION"
```

So when you press RightCtrl:

1. kitty opens, attaches to `tmux` session `"maxwell"`.  
2. **Top window**: fzf UI over your `$XDG_DATA_HOME/maxwelld/history/*.log` entries.  
   - Each corresponds to a script activity log, unique ID by filename.  
   - Preview shows the full JSON/text of that log.  
3. **Bottom REPL**: type commands/queries, they get POSTed via socket to `maxwelld`.  

---

## Example Workflow

- Take screenshot: `RightCtrl+S` → `maxwell-screenshot`. It writes `~/…/maxwelld/history/1708634123.log`.  
- Open console (RightCtrl): fzf instantly shows `1708634123.log` at top of list.  
- Preview shows OCR text extracted.  
- In bottom REPL: type “summarize last entry” → sent to daemon.  

---

🛠️ Next Step decisions for you:

1. Should the `fzf` browser **exit** after one selection (to paste/display result in REPL), or should it run continuously as a navigator (using `fzf --bind 'enter:execute'`)?  
2. Do you want activity entries stored as **JSON** (so more structure/queryability)? That way, `--preview 'jq . {}'` would work beautifully.

Would you like me to expand these into **full structured logs** (e.g. JSON per ID), with `fzf` preview + search over fields, instead of plain text files?
