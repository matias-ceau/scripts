# Open WebUI Launcher

---

**openwebui-launcher.sh**: A script to launch the Open WebUI with customizable parameters.

---

### Dependencies

- `bash`: The script is written for the Bash shell.
- `tmux`: Required for running the server in a detached session.
- `curl`: Used to check the availability of the server.
- `qutebrowser`: Web browser used to open the Open WebUI.
- `notify-send`: Used for desktop notifications indicating the status of the script.

### Description

This script facilitates launching the Open WebUI hosted on a specified `HOST` and `PORT`. It allows users to customize the database location and server parameters using command-line arguments. Here’s how the script works:

1. **Parameter Parsing**: The script processes command-line arguments for database location (`--database`), `host` (`--host`), and `port` (`--port`). Default values are set to `localhost`, `8080`, and a specified path in the user's home directory.

2. **Server Check**: It uses `ps` and `rg` to check if the Open WebUI is already running on the specified port. If not, it starts a new `tmux` session to handle the web server.

3. **Server Notification**: After launching the server, it sends a notification about the server status. A loop checks for the server's readiness by sending a request to the URL, with a timeout of 30 seconds.

4. **Launching the Browser**: Once the server is confirmed to be running, `qutebrowser` is launched with the specified user settings and the server URL.

### Usage

To utilize the script, run it from the terminal with optional arguments to customize its behavior. Here are some examples:

```bash
# Launch with default settings
./openwebui-launcher.sh

# Launch specifying a different database and port
./openwebui-launcher.sh --database /path/to/database -p 9000

# Launch with custom host and port
./openwebui-launcher.sh --host 127.0.0.1 --port 8081
```

Remember to ensure that all dependencies are installed to avoid any runtime errors. Configure the `OWCFG` and `QBDATA` variables as needed to point to your specific settings.

---

> [!TIP]
> The script checks for existing server instances using `rg`, but this could lead to issues if multiple instances are running on different ports or using different names. Consider improving the uniqueness of the session name or implementing better instance management strategies. Additionally, consider implementing error handling for dependencies to alert the user if they are missing before trying to run the script.