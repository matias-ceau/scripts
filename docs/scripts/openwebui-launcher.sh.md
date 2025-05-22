# Open WebUI Launcher

---

**openwebui-launcher.sh**: Bash script to launch Open WebUI and open it in a minimal browser.

---

### Dependencies

- `uvx`: A Python virtual environment tool for launching Python apps.
- `open-webui`: The actual Web UI Python application (`open-webui serve` command).
- `tmux`: Used to daemonize the Open WebUI backend.
- `notify-send`: For desktop notifications.
- `curl`: To poll server readiness.
- `rg` (ripgrep): Used for efficient process search.
- `minimal-browser.py`: Custom/user-defined lightweight browser script. Must be available in `$PATH`.

---

### Description

This script streamlines the process of starting the Open WebUI server and launching it in a minimal web browser, designed with integration into an Arch Linux + qtile environment.

**Core functionalities:**
- Server Initialization: Optionally, with `init`, uses `uvx` to provision the latest `open-webui` package in a Python 3.12 environment and serve it.
- Host/Port Customization: Overrides default host/port with `-H/--host` and `-p/--port` flags.
- Idempotent Launch: Prevents duplicate `open-webui` instances by scanning running processes.
- Timeout-wrapped readiness checks: Waits (up to 30s) for the web UI to become responsive before launching the browser.
- Desktop Notifications: Notifies status at major steps for UX clarity.
- Browser Launch: Starts the `minimal-browser.py` pointing at the running Web UI once it is live.

---

### Usage

```sh
# Launch with default localhost:8080, or customize:
openwebui-launcher.sh
openwebui-launcher.sh --host 0.0.0.0 --port 9000

# To initialize Open WebUI using uvx for a fresh Python env:
openwebui-launcher.sh init

# Full example, custom host/port, initializing:
openwebui-launcher.sh init -H 127.0.0.1 -p 8181
```

This script can be effectively connected to a qtile keybinding, e.g.:
```python
Key([mod], "F12", lazy.spawn("openwebui-launcher.sh"))
```
Or, run from dmenu/rofi using the script path.

---

> [!NOTE]
> The script is functional but could be improved for robustness:
> - Error handling is minimal (e.g. no checks for missing dependencies or for invalid/not found `open-webui` executable).
> - The process check (`rg 'open-webui serve' | rg '8080'`) is brittle if running on a custom port or if `rg` is unavailable.
> - If `minimal-browser.py` isn't available, the script exits silently.
> - Notification text is basic—consider including more diagnostics for failures, or use more dynamic, user-friendly notifications.
> - The `eval` on the browser line may be unnecessary and slightly risky; directly invoking the browser may be safer.
> - The `init` argument may unintentionally discard host/port overrides (since `shift 2` skips the next argument).
> - Consider using a CLI parsing library (e.g., `getopts` or even Python's `argparse` for more maintainable options handling).