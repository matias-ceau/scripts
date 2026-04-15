# Open WebUI Launcher

---

**openwebui-launcher.sh**: Start (or reuse) an Open WebUI server and open it in a browser

---

### Dependencies

- `open-webui`: the backend/server being launched (`open-webui serve`)
- `tmux`: runs the server detached in a dedicated session (`OPENWEBUI`)
- `ripgrep` (`rg`): used to detect whether the server is already running
- `curl`: polls the HTTP endpoint until the UI is reachable
- `libnotify` (`notify-send`): desktop notifications (nice for qtile workflows)
- `minimal-browser.py`: custom browser wrapper/script resolved via `which`  
  - must exist in `PATH` (commonly a qutebrowser/firefox launcher)

Optional:
- `uvx` + Python `3.11`: only referenced in the `init` subcommand path

### Description

This script is a small “service launcher” for Open WebUI on Arch/qtilte: it ensures an `open-webui serve` process is running in the background, waits for the HTTP endpoint to come up, then opens the UI in your minimal browser.

Key behaviors:
- Defaults to `HOST=localhost` and `PORT=8765`, producing `http://localhost:8765`.
- If no matching server is found, it creates a detached tmux session named `OPENWEBUI` and starts `open-webui serve --host … --port …`.
- Uses a simple readiness loop: `curl -I` is retried every 2s for up to 30s, otherwise it notifies and exits with code `1`.
- Uses notifications for “Opening…” and “Serving at …” so you can trigger it from a qtile keybinding without a terminal.

### Usage

Run from a terminal or bind directly in qtile (no interaction required).

tldr:

- Launch (or focus existing server) and open browser:
  - `openwebui-launcher.sh`

- Custom host/port:
  - `openwebui-launcher.sh --host 0.0.0.0 --port 8765`
  - `openwebui-launcher.sh -H localhost -p 9000`

- “init” mode (attempts to run via `uvx`):
  - `openwebui-launcher.sh init`

---

> [!WARNING]
> The process detection is inconsistent: it greps for `open-webui serve` *and* hard-codes `8080`, while the default port is `8765`. This can spawn duplicate servers or fail to reuse an existing one. Consider matching on the chosen `$PORT` (or checking the tmux session) and fixing `init` (it sets `DATA_DIR=… uvx …` without exporting `DATA_DIR`). Also, quote/validate `$BROWSER` and consider a fallback if `minimal-browser.py` is missing.