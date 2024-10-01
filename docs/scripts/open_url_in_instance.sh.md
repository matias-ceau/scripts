# Open URL in Qutebrowser Instance

---

**open_url_in_instance.sh**: Launches a URL in an existing Qutebrowser instance.

---

### Dependencies

- `socat`: A command line based utility that establishes two bidirectional byte streams and transfers data between them. It is essential for IPC communication in this script.
- `qutebrowser`: A keyboard-focused browser with a minimal GUI, used as the target application for opening URLs.

### Description

The `open_url_in_instance.sh` script allows users to efficiently open a specified URL in an existing instance of Qutebrowser without opening a new window. It utilizes Inter-Process Communication (IPC) to send a JSON-formatted command that instructs the Qutebrowser to navigate to the desired URL.

The script is designed with a few key variables:
- `_url`: The URL to be opened, passed as the first command-line argument.
- `_qb_version`: This represents the version of Qutebrowser that the command is targeting; it defaults to '1.0.4'.
- `_proto_version`: The version of the IPC protocol, set to 1.
- `_ipc_socket`: Dynamically created IPC socket path based on the current user's execution environment.
- `_qute_bin`: Specifies the path to the Qutebrowser binary, ensuring proper execution.

The core functionality consists of formatting the necessary command into JSON and using `socat` to send it over the IPC socket. If the connection fails, the script falls back to attempting to open the URL in a new Qutebrowser instance.

### Usage

To use this script, simply call it from the terminal with the desired URL as an argument:

```bash
sh /home/matias/.scripts/open_url_in_instance.sh https://example.com
```

If the Qutebrowser instance is running and properly configured to accept IPC commands, it should navigate to the specified URL. If it’s not running, the URL will open in a new instance.

You can also bind this script to a key combination in your window manager, allowing for a seamless workflow when browsing.

---

> [!TIP]
> The script currently assumes that the environment is set up correctly (e.g., Qutebrowser is configured for IPC). To enhance robustness, you might want to include error handling to inform the user if the URL opens in a new instance due to IPC failure. Additionally, consider making `_qb_version` and `_proto_version` configurable as command-line arguments, providing flexibility for users with different setups.