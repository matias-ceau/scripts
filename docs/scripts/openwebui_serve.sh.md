# Open WebUI Serve (uvx)

---

**openwebui_serve.sh**: Launch Open WebUI via uvx with data stored in XDG data directory

---

### Dependencies

- `bash`
- `uvx` (from `uv`): runs ephemeral Python apps without manual venv management
- `python` `3.11` (available to `uvx`)
- `open-webui` (fetched automatically as `open-webui@latest`)

### Description

This script starts **Open WebUI** using `uvx`, forcing **Python 3.11** and placing Open WebUI’s persistent data under your XDG data directory.

Key behaviors:

- Sets `DATA_DIR` to: `$XDG_DATA_HOME/open-webui`  
  This follows the XDG base directory spec and keeps application state out of `~/.config` and `~/.local/share` clutter.
- Runs: `uvx --python 3.11 open-webui@latest serve`  
  `uvx` will download/cache the requested package version (`@latest`) and execute the `serve` entrypoint, so you don’t need to install Open WebUI globally.

On Arch + qtile, this makes it convenient to start the service from a keybinding, a scratchpad terminal, or an autostart hook while keeping data in a predictable location.

### Usage

Run from a terminal:

    ~/.scripts/bin/openwebui_serve.sh

Typical “tldr”:

    # Start server (downloads/caches open-webui automatically)
    openwebui_serve.sh

    # Ensure XDG_DATA_HOME is set (optional; usually already is)
    export XDG_DATA_HOME="$HOME/.local/share"
    openwebui_serve.sh

Suggested qtile autostart (conceptually):

    # call the script once on session start (in your autostart hook)
    ~/.scripts/bin/openwebui_serve.sh &

---

> [!TIP]
> Consider hardening and ergonomics:
> - If `$XDG_DATA_HOME` is empty, `DATA_DIR` becomes `/open-webui`. Add a fallback: `: "${XDG_DATA_HOME:=$HOME/.local/share}"`.
> - Quote variables to be safe: `DATA_DIR="$XDG_DATA_HOME/open-webui"`.
> - You may want a fixed version instead of `@latest` for reproducibility.
> - For a long-running service, using a `systemd --user` unit is more robust than a WM autostart (restart on failure, logs, clean shutdown).