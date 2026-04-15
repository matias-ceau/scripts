# Open WebUI Serve Launcher

---

**openwebui_serve.sh**: Launch Open WebUI via uvx with fixed port and data directory

---

### Dependencies

- `bash`
- `uvx` (from `uv`) — runs Python tools in ephemeral/managed environments
- `python` `3.11` — selected explicitly via `--python 3.11`
- `open-webui` — fetched as `open-webui@latest` by `uvx`
- `$XDG_DATA_HOME` — used to place persistent app data under the XDG data dir

### Description

This script starts an **Open WebUI** server using `uvx`, while exporting a small set of environment variables inline:

- `PORT=8765` and `WEBUI_URL="http://localhost:8765"`: bind and advertise the UI at a predictable local URL (useful for bookmarks, qtile keybindings, and consistent reverse-proxy rules).
- `DATA_DIR="$XDG_DATA_HOME/open-webui"`: stores Open WebUI data in an XDG-compliant location (on Arch typically `~/.local/share/open-webui`).
- `ENABLE_PERSISTENT_CONFIG=False`: disables Open WebUI’s persistent config behavior (depending on Open WebUI version/env semantics), which can be helpful if you want stateless config while still keeping data under `DATA_DIR`.

The actual server is launched with:

- `uvx --python 3.11 open-webui@latest serve`

Meaning the Open WebUI package is resolved at runtime (latest version), and executed with Python 3.11.

### Usage

Run from a terminal (foreground):

    openwebui_serve.sh

Open in browser:

    xdg-open http://localhost:8765

Typical qtile usage (example keybinding):

    Key([mod], "u", lazy.spawn("openwebui_serve.sh"))

If you want it to run in the background from a keybinding, consider wrapping it:

    setsid -f openwebui_serve.sh >/tmp/openwebui.log 2>&1

---

> [!TIP]
> Consider quoting/guarding against an unset `XDG_DATA_HOME` (fallback to `~/.local/share`). Also, pinning `open-webui` to a known version instead of `@latest` improves reproducibility. Finally, if `ENABLE_PERSISTENT_CONFIG` is meant to be a boolean, verify the exact expected values for your Open WebUI version (some apps prefer `true/false` or `0/1`).