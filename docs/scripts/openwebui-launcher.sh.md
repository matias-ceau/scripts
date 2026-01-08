# Open WebUI Launcher

---

**openwebui-launcher.sh**: Start Open WebUI in tmux, wait until ready, then open in browser

---

### Dependencies

- `open-webui` (CLI): provides `open-webui serve`
- `tmux`: runs the server in a detached, named session (`OPENWEBUI`)
- `ripgrep` (`rg`): checks if a server is already running
- `curl`: polls the HTTP endpoint until it responds
- `libnotify` (`notify-send`): desktop notifications (works well under qtile)
- `minimal-browser.py`: custom browser launcher script (resolved via `which`)

### Description

This script is a convenience launcher for **Open WebUI** on Arch/qtile. It:

1. Builds a target URL from `HOST`/`PORT` (defaults: `localhost:8080`).
2. Checks for an existing server process using `ps | rg 'open-webui serve' | rg '8080'`.
3. If not found, it starts `open-webui serve` inside a detached tmux session:
   - Session: `OPENWEBUI`
   - Window name: `openwebui`
4. Sends a notification, then **waits for readiness** by polling `curl -I http://HOST:PORT` every 2 seconds (up to 30 seconds).
5. Once reachable, it notifies again and opens the URL using `minimal-browser.py`.

There is also an `init` mode intended to run Open WebUI via `uvx` with Python 3.11 and a fresh-ish `DATA_DIR` (`~/.local/share/open-webui/`), but its current implementation has argument-handling issues (see critique).

### Usage

Run from a terminal, qtile keybinding, or launcher menu:

- Launch (default `localhost:8080`):
  - `openwebui-launcher.sh`

- Custom host/port:
  - `openwebui-launcher.sh --host 0.0.0.0 --port 3000`
  - `openwebui-launcher.sh -H localhost -p 8081`

- Access the tmux session:
  - `tmux attach -t OPENWEBUI`

---

> [!TIP]
> **Potential improvements / issues**
> - The running-check is hardcoded to `8080` (`rg '8080'`), so using `--port` won’t prevent duplicate servers on other ports.
> - `init)` runs `DATA_DIR=... uvx ... serve` *immediately* and then does `shift 2` even though `init` is a single token; this likely breaks parsing. Consider handling `init` as a separate execution path and `shift 1`.
> - `DATA_DIR` is assigned but never exported/used by `open-webui serve` in the main path (unless Open WebUI reads it implicitly). If needed, `export DATA_DIR=...` (or the correct env var) should be set.
> - `eval "$BROWSER $URL"` can be avoided; prefer `"$BROWSER" "$URL"` for safer quoting.
> - If `minimal-browser.py` is missing, `BROWSER` becomes empty; add a fallback (e.g., `xdg-open`).