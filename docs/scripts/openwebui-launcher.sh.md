# Open Web UI Launcher

---

**openwebui-launcher.sh**: A script to launch Open Web UI in Qutebrowser.

---

### Dependencies

- `tmux`: A terminal multiplexer that allows you to create and manage multiple terminal sessions.
- `curl`: A command-line tool for transferring data with URLs.
- `notify-send`: A utility to display desktop notifications.
- `qutebrowser`: A keyboard-driven web browser based on PyQt5.

### Description

This script is designed to launch the Open Web UI service for Qutebrowser within a `tmux` session while providing user feedback through notifications. It allows users to customize several parameters, including the host address, port number, and database configuration. 

The script begins by defining default values for `HOST`, `PORT`, `QBDATA`, and `OWCFG`. It parses command-line arguments to allow customization of these variables. If the `open-webui` service is not already running on the specified port, it creates a new detached `tmux` session titled "OPENWEBUI" and executes the `open-webui serve` command. 

The script employs a loop that polls the server to check if it is live, and if not, it times out after 30 seconds, notifying the user if the launch fails. Once the server is confirmed as active, it launches the Qutebrowser with the specified configuration and opens the URL.

### Usage

To use this script, simply execute it from the terminal with optional parameters:

```bash
./openwebui-launcher.sh [options]
```

#### Options:

- `-D` or `--database`: Specify the path to the Qutebrowser data directory.
- `-H` or `--host`: Set a custom host IP (default is `0.0.0.0`).
- `-p` or `--port`: Define a custom port (default is `8080`).

**Example:** Launching Open Web UI with a custom port:

```bash
./openwebui-launcher.sh -p 9090
```

---

> [!TIP] 
> The script currently does not validate user input for the host and port arguments. Implementing validation logic would enhance its robustness. Additionally, consider adding more detailed logging to help troubleshoot issues during startup.