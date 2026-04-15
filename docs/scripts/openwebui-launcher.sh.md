# Open WebUI Launcher

---

**openwebui-launcher.sh**: Start Open WebUI in tmux and open it in your minimal browser

---

### Dependencies

- `open-webui` (CLI): provides `open-webui serve`
- `tmux`: runs the server in a detached background session (`OPENWEBUI`)
- `ripgrep` (`rg`): checks whether a server is already running
- `curl`: polls the HTTP endpoint until it becomes available
- `notify-send` (libnotify): desktop notifications (nice for qtile workflows)
- `minimal-browser.py`: your local browser wrapper resolved via `which` (must be on `$PATH`)
- `bash`: script runtime (`/usr/bin/bash`)

### Description

This script is a small “service + opener” helper for Arch/qtile: it ensures an Open WebUI server is running, waits until it responds, then opens the Web UI in your preferred lightweight browser wrapper.

Key behavior:

- Defaults to `HOST=localhost` and `PORT=8080`, building `URL=http://HOST:PORT`.
- If no existing process matches `open-webui serve` *and* `8080`, it starts the server in a detached tmux session:
  - Session: `OPENWEBUI`
  - Window: `openwebui`
- It then sends a notification (“Opening…”) and polls the URL via `curl -I` until it responds, with a 30s timeout.
- Finally, it notifies “Serving at …” and launches `minimal-browser.py URL`.

There is also an `init` argument intended to initialize/run via `uvx` and Python 3.11, but note the current implementation has issues (see critique).

### Usage

Run from a terminal, a qtile keybinding, or a launcher menu.

- Launch (defaults to `localhost:8080`):
  - `openwebui-launcher.sh`

- Custom host/port:
  - `openwebui-launcher.sh --host 0.0.0.0 --port 8081`
  - `openwebui-launcher.sh -H localhost -p 3000`

- qtile keybinding idea:
  - Bind to: `~/.scripts/bin/openwebui-launcher.sh`

---

> [!TIP]
> **Potential improvements / issues**
> - The “already running” check is hardcoded to `8080` (`rg '8080'`), ignoring `--port`. Use `$PORT` in the match, or check the listening socket (`ss -lntp`).
> - `init)` runs `DATA_DIR=$HOME... uvx ... serve` but doesn’t export `DATA_DIR`, and `shift 2` is wrong (only one arg consumed). Consider `export DATA_DIR=...; shift`.
> - `BROWSER=$(which minimal-browser.py)` can fail silently; add a check and a fallback (e.g., `xdg-open`).
> - `curl -I` may succeed on non-200 responses; consider `curl -fsS` or checking status codes for a cleaner “ready” signal.