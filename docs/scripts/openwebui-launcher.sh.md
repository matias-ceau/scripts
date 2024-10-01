# Open Web UI Launcher

---

**openwebui-launcher.sh**: Script to launch and monitor Open Web UI in a tmux session.

---

### Dependencies

- `tmux`: Terminal multiplexer that allows for multiple terminal sessions to be accessed simultaneously.
- `curl`: Command line tool to transfer data from or to a server, used here for health checking.
- `notify-send`: Utility to send desktop notifications.
- `qutebrowser`: A keyboard-focused browser based on QtWebEngine utilized to open the web interface.

### Description

The `openwebui-launcher.sh` script sets up a controlled environment to run an Open Web UI server within a detached `tmux` session and checks if the server is running correctly. 

1. **Environment Setup**: The script begins by disabling authentication with `export WEBUI_AUTH=0`.
2. **Launching in tmux**: It creates a new detached `tmux` session named `OPENWEBUI` and runs the command to serve the Open Web UI (`open-webui serve`).
3. **Monitoring**: The script enters a loop where it uses `curl` to check the health of the server by sending a HEAD request to `http://localhost:8080`. 
   - If the server responds, the loop breaks and the script continues to notify the user that the server is running.
   - If there’s no response within 30 seconds, a timeout notification is sent.
4. **Final Notification and Opening**: After confirming the server is up, the script opens it with `qutebrowser`, pointing to its web interface.

### Usage

To run this script, ensure it is executable and simply execute it in your terminal:

```bash
chmod +x /home/matias/.scripts/openwebui-launcher.sh
/home/matias/.scripts/openwebui-launcher.sh
```

You may also bind this script to a key in your window manager (Qtile) for easier access.

---

> [!TIP]  
> Consider adding error handling for scenarios where `tmux` or `qutebrowser` might not be installed. Additionally, providing a flag to toggle authentication could increase usability depending on the deployment environment. An option to customize the port could also enhance flexibility, allowing you to run multiple instances.