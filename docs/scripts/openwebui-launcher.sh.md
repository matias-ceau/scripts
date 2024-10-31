# OpenWebUI Launcher

---

**openwebui-launcher.sh**: Script to launch and manage the Open WebUI with `qutebrowser`.

---

### Dependencies

- `bash`: The script shell.
- `tmux`: To manage the Open WebUI process in the background.
- `notify-send`: For sending desktop notifications.
- `curl`: To check if the server is up.
- `qutebrowser`: A keyboard-focused browser using QtWebEngine.
- `rg` (ripgrep): Utilized to check if the Open WebUI process is already running.

### Description

The `openwebui-launcher.sh` script facilitates the automated launching and management of the Open WebUI on your local machine. By using `tmux`, it starts an Open WebUI server in a detached session and ensures that it is accessible by continuously polling its address. It defaults to `localhost` on port `8080`, but you can modify these with command-line arguments. Once the server is running, it opens `qutebrowser` with the specified configuration file and data directory, directly pointing to the server's URL.

#### Key Functions:

- **Parameter Handling**: Accepts options like `-D|--database`, `-H|--host`, and `-p|--port` to configure data directories and URL settings.
- **Server Check & Launch**: Starts the Open WebUI server in a `tmux` session if it is not already running.
- **Timeout Mechanism**: Ensures the server comes online within a 30-second window; otherwise, it exits.
- **Browser Launch**: Opens the URL using `qutebrowser`.

### Usage

Run the script from the command line, potentially with the following optional arguments:

```bash
openwebui-launcher.sh [OPTIONS]

Options:
  -D, --database     Specify the data directory for qutebrowser.
  -H, --host         Set the host for the server (default: localhost).
  -p, --port         Specify the port (default: 8080).
```

**Example:**

```bash
./openwebui-launcher.sh -D "$HOME/mydata" -H "127.0.0.1" -p 8000
```

This example sets the data directory to `$HOME/mydata`, the host to `127.0.0.1`, and port to `8000`.

---

> [!TIP]
> Ensure that your environment variables, especially `XDG_CONFIG_HOME`, are set correctly to avoid issues with file path resolutions. Additionally, consider adding error handling for missing dependencies like `qutebrowser` and `tmux`, or provide feedback to users in case configurations such as `OWCFG` are incomplete or incorrect.