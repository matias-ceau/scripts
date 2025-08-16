# Open WebUI server launcher

---

**openwebui_serve.sh**: Start Open WebUI via uvx with XDG-compliant data dir

---

### Dependencies

- `bash` — script interpreter.
- `uv` (provides `uvx`) — runs Python apps without manual venvs; installs on first run.
- `open-webui` — the Python package launched by `serve`.
- `python` — `uvx` will fetch Python 3.12 automatically.
- `XDG_DATA_HOME` — used to place data under `$XDG_DATA_HOME/open-webui` (usually `~/.local/share/open-webui` on Arch).

### Description

This tiny launcher starts Open WebUI using Astral’s `uvx`, ensuring a clean, reproducible environment and an up-to-date package. By prefixing the command with:
  
DATA_DIR="$XDG_DATA_HOME/open-webui"

the script directs Open WebUI to store its state/config under your XDG-compliant data directory instead of cluttering `$HOME`. The invocation:

uvx --python 3.12 open-webui@latest serve

tells `uvx` to:
- provision Python 3.12 if needed,
- install and cache the latest `open-webui` package,
- execute its `serve` subcommand.

This works well on Arch Linux and keeps your system Python untouched.

### Usage

- Run in a terminal:
  ```
  ~/.scripts/bin/openwebui_serve.sh
  ```
  Then open http://localhost:8080 in your browser.

- Pass extra flags to Open WebUI (examples):
  ```
  DATA_DIR="$XDG_DATA_HOME/open-webui" uvx --python 3.12 open-webui@latest serve --host 127.0.0.1 --port 8080
  ```
  Tip: run `uvx open-webui@latest --help` for all options.

- Background with systemd (user):
  ```
  systemctl --user enable --now openwebui.service
  ```
  ~/.config/systemd/user/openwebui.service:
  ```
  [Unit]
  Description=Open WebUI

  [Service]
  ExecStart=%h/.scripts/bin/openwebui_serve.sh
  Restart=on-failure
  WorkingDirectory=%h

  [Install]
  WantedBy=default.target
  ```

- Qtile keybinding:
  ```python
  Key([mod], "u", lazy.spawn("~/.scripts/bin/openwebui_serve.sh"))
  ```

---

> [!TIP]
> - Consider a safe shell header: `set -euo pipefail`.
> - Provide a fallback when `$XDG_DATA_HOME` is unset, e.g. default to `$HOME/.local/share`.
> - Use `exec` to avoid leaving an extra shell process: `exec uvx ...`.
> - Pin a version to avoid surprises: `open-webui==<version>` instead of `@latest`.
> - Add logging (stdout/stderr to a file) or rely on `systemd` journal for easier troubleshooting.