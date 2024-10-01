# Open Web UI Launcher

---

**openwebui-launcher.sh**: A script to launch and serve the Open Web UI in a new tmux session.

---

### Dependencies

- `tmux`: A terminal multiplexer that allows multiple terminal sessions to be accessed simultaneously.
- `curl`: A command line tool for transferring data with URLs.
- `notify-send`: A command to send desktop notifications.
- `qutebrowser`: A keyboard-driven web browser that allows a high level of customization.

### Description

The `openwebui-launcher.sh` script is designed to facilitate the launching of the Open Web UI application in a separate tmux session. The script initializes a new tmux session named 'OPENWEBUI' where it runs the command `open-webui serve`.

Once the server is launched, the script immediately begins to check if it is accessible by sending requests to `http://localhost:8080` using `curl`. It operates in a loop that will retry the request every 3 seconds until the server responds positively, or a timeout of 30 seconds is reached.

When the server becomes reachable, a notification is sent to indicate that it is up and running. If the server does not respond within the specified timeout period, a notification about the timeout will be sent, and the script will exit with an error code.

Lastly, the script launches the site in `qutebrowser` with a specific configuration script provided in the user's configuration directory.

### Usage

To use the script, simply run the following command in your terminal:

```bash
bash /home/matias/.scripts/openwebui-launcher.sh
```

This command will:

1. Start a new tmux session that runs the Open Web UI server.
2. Notify you of the launch process via desktop notifications.
3. Open the Open Web UI in `qutebrowser`.

**Note**: Ensure that tmux and qutebrowser are installed and correctly set up on your system.

---

> [!TIP]  
> One potential improvement could be to make the so-called "timeout" duration configurable, possibly through a command-line argument for greater flexibility. Additionally, error handling for the initial tmux command could enhance the user experience by notifying if the session could not be started.