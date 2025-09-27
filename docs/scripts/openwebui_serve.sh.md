# Open WebUI Server Launcher

---

**openwebui_serve.sh**: Launch Open WebUI via uvx with XDG-compliant data directory

---

### Dependencies

- `bash` — script shell.
- `uv` (provides `uvx`) — runs Python apps without global installs; fetches tools on demand.
- `python` (3.12) — interpreter used by `uvx --python 3.12`.
- `open-webui` — Python package providing the `open-webui` CLI/server.
- `systemd` (optional) — to run as a user service.
- `XDG_DATA_HOME` — used to place persistent data under an XDG-compliant path.

### Description

This tiny launcher runs Open WebUI with `uvx`, always using the latest published Python package and Python 3.12 runtime. It sets a per-run environment variable so Open WebUI stores all state under:
- $XDG_DATA_HOME/open-webui (typically ~/.local/share/open-webui on Arch if XDG_DATA_HOME is set)

Because it uses `uvx`:
- No global Python packages are installed; dependencies are cached by uv.
- You always get the latest `open-webui` due to the @latest specifier.
- Python 3.12 is ensured even if system Python differs.

The variable assignment prefix (DATA_DIR="...") only applies to this command invocation, keeping your environment clean.

### Usage

- Make sure ~/.scripts/bin is in your PATH and the script is executable:
  - chmod +x ~/.scripts/bin/openwebui_serve.sh
- Start the server:
  - openwebui_serve.sh
- Then open in your browser (default): http://localhost:8080

Examples:
- Run in a terminal to see logs:
  - alacritty -e openwebui_serve.sh
- Qtile keybinding:
  - lazy.spawn("alacritty -e ~/.scripts/bin/openwebui_serve.sh")
- As a systemd user service (~/.config/systemd/user/openwebui.service):
  - [Unit]
    Description=Open WebUI (uvx)
  - [Service]
    ExecStart=%h/.scripts/bin/openwebui_serve.sh
    Restart=on-failure
  - [Install]
    WantedBy=default.target
  - systemctl --user enable --now openwebui.service

Environment tweaks (before launching):
- Change port: PORT=3000 openwebui_serve.sh
- Override data dir: DATA_DIR=/path/to/data openwebui_serve.sh

---

> [!TIP]
> - If XDG_DATA_HOME is unset, DATA_DIR may expand to “/open-webui”. Consider a fallback: DATA_DIR="${XDG_DATA_HOME:-$HOME/.local/share}/open-webui".
> - The script does not pass through CLI arguments. To allow this, append "$@" after serve: … open-webui@latest serve "$@".
> - Pinning a version (e.g., open-webui==vX.Y.Z) can improve reproducibility.
> - You may want to add a simple healthcheck/retry or systemd sandboxing (ProtectHome, PrivateTmp) for robustness.