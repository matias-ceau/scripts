# Open Web UI Launcher

---

**openwebui-launcher.sh**: A script to launch and monitor the Open Web UI service.

---

### Dependencies

- `tmux`: A terminal multiplexer that allows for session management.
- `curl`: A command-line tool for transferring data with URL syntax.
- `notify-send`: A utility to display desktop notifications.
- `qutebrowser`: A keyboard-driven, vim-like browser with a minimal GUI.

### Description

The `openwebui-launcher.sh` script is designed to start the Open Web UI service in a new `tmux` session and monitor its initiation. The script sets the `WEBUI_AUTH` variable to `0`, which might indicate that authentication is disabled. It then executes the command `open-webui serve` in a detached `tmux` session named "OPENWEBUI". Notifications are sent to inform the user about the process state.

After starting the service, the script enters a loop where it repeatedly checks if the server at `http://localhost:8080` is accessible using `curl`. The loop will terminate successfully if the server responds within 30 seconds; if it does not, a timeout notification is issued, and the script exits with an error.

Upon successfully confirming the service is running, the script notifies the user and opens `qutebrowser` directed to the Open Web UI at `http://0.0.0.0:8080`, facilitating immediate access.

### Usage

To use this script, ensure all dependencies are installed and run it in your terminal:

```bash
bash /home/matias/.scripts/openwebui-launcher.sh
```

You may also consider adding a keyboard shortcut in your window manager to invoke this script quickly.

---

> [!TIP] 
The script could be enhanced by adding argument handling to allow users to specify the port or session name dynamically. Additionally, implementing error logging could help in debugging if the server fails to start or the curl request times out. Furthermore, consider cleaning up the `tmux` session upon completion to avoid accumulating detached sessions over time.