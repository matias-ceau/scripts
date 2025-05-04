# openwebui-launcher.sh

---

**openwebui-launcher.sh**: Script to launch and interact with an Open WebUI instance.

---

### Dependencies

- `tmux`: Terminal multiplexer used to manage background processes.
- `curl`: For verifying the availability of the web server.
- `minimal-browser.py`: A lightweight browser (ensure it is in your PATH).
- `notify-send`: For desktop notifications (part of `libnotify` package).
- `rg` (ripgrep): Utilized for process matching (ensure it's installed and in PATH).
- `open-webui`: Required for serving the web interface. This must be installed (e.g., via `uvx` or equivalent).

---

### Description

This script is designed to automate the launching of an Open WebUI instance alongside a web browser for frontend interaction. It allows specifying hosts and ports for serving the web interface and has an initialization option (`init`). It checks if the required web interface is already running, and, if not, starts it in a new `tmux` session. 

The web interface will be served locally (defaulting to `localhost:8080`) unless overridden via the relevant script arguments. The script makes use of the `curl` command to ensure the server is reachable, retrying for up to 30 seconds before timing out.

Finally, the specified browser (in this case, `minimal-browser.py`) is opened to the URL hosting the web UI.

---

### Usage

Run the script either interactively in a terminal or integrate it with your tiling window manager (e.g., qtile).

#### Options

- `init`: Initializes the web UI data directory and serves the Open-WebUI instance (`uvx` usage shown, adapt based on your setup).
- `-H` or `--host [HOST]`: Specify the host address (default is `localhost`).
- `-p` or `--port [PORT]`: Specify the port number (default is `8080`).

#### Example Usage

```bash
# Launch the script with default settings
bash openwebui-launcher.sh

# Specify a custom host and port
bash openwebui-launcher.sh --host 127.0.0.1 --port 9090

# Initialize environment and launch the server
bash openwebui-launcher.sh init
```

#### Integration Example (qtile)
You can assign this script to a keybinding in qtile:
```python
Key([mod], "w", lazy.spawn("~/.scripts/bin/openwebui-launcher.sh"))
```

---

> [!TIP]
> **Improvement Suggestions:**
> 1. **Portability:** This script depends on certain tools (`ripgrep`, `tmux`, `curl`, etc.). Add checks to ensure these tools are installed before execution to avoid failures.
> 2. **Error Handling:** There is limited error handling for invalid arguments or missing prerequisites (e.g., the `minimal-browser.py` path not found).
> 3. **Environment Flexibility:** Consider supporting alternative browsers if `minimal-browser.py` is not installed.
> 4. **Timeout Configuration:** Timeout is hardcoded (30 seconds). Making this configurable could enhance flexibility.