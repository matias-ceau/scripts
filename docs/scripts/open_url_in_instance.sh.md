# Qutebrowser URL Opener

---

**open_url_in_instance.sh**: Opens a URL in an existing Qutebrowser instance or starts a new one.

---

### Dependencies

- `qutebrowser`: Minimalistic keyboard-driven web browser. Make sure it is installed at `/usr/bin/qutebrowser`.
- `socat`: Utility used for data transfer between two endpoints.
- `md5sum`: Utility to calculate the MD5 hash, used here for generating a socket identifier.

### Description

The script is designed to open a given URL in an existing instance of Qutebrowser or launch a new one if needed. This is done by utilizing Inter-Process Communication (IPC) through a socket file designated by `XDG_RUNTIME_DIR`. The script constructs a JSON message with details such as the URL, Qutebrowser version, protocol version, and current working directory, then sends it to Qutebrowser via the socket. If this IPC communication fails (when no instance is running), the script launches a new Qutebrowser session with the provided URL.

Behind the scenes, the script utilizes several key components:
- Variables like `_url`, `_qb_version`, `_proto_version`, and `_ipc_socket` are initialized to store essential information.
- The `printf` command constructs the JSON message.
- `socat` is employed to attempt connection to the existing Qutebrowser IPC socket.
- If `socat` fails, Qutebrowser is called directly to open the URL, thereby starting a new instance.

### Usage

This script is designed to take one argument, the URL to open, and can be executed as follows:

```sh
open_url_in_instance.sh https://example.com
```

You can run this script from a terminal or bind it to a key combination in your window manager (qtile), using a custom keybinding setup.

For example, you can utilize qtile’s key bindings feature in your `config.py`:

```python
Key([mod], "u", lazy.spawn("/home/matias/.scripts/bin/open_url_in_instance.sh")),
```

Replace `mod` and `u` with your preferred modifier key and key combination.

---

> [!TIP]
> The script could be expanded to include more robust error handling, such as catching exceptions when `socat` is unavailable. Also, adding support for handling URLs without a protocol (e.g., adding `http://` if missing) would improve user experience.