# Open URL in Existing Qutebrowser Instance

---

**open_url_in_instance.sh**: Open a URL in an already running qutebrowser session, or start a new one if needed

---

### Dependencies

- `qutebrowser` — Minimal browser driven by keyboard.
- `socat` — Utility for bidirectional data transfer via sockets.
- `md5sum` — Used for generating hashed socket names.
- `sh` — Compatible POSIX shell.

All dependencies should be available from the standard Arch Linux repositories.

---

### Description

This script is designed to send a URL (or any qutebrowser argument list) to an already running instance of `qutebrowser` using its IPC socket. If no session is detected, it falls back to starting a new instance of qutebrowser with the provided arguments.

#### Key Ideas:
- Determines the IPC socket based on the current user's `XDG_RUNTIME_DIR` and a hashed username.
- Prepares a JSON object with URL, qutebrowser version, protocol information, and working directory.
- Uses `socat` to transmit the JSON to the qutebrowser IPC socket, following the qutebrowser's remote command protocol.
- If IPC connection fails (socket unavailable or qutebrowser not running), the script launches qutebrowser directly with the supplied arguments.

#### Script Flow:
1. Parses the first argument as the URL to open.
2. Constructs the socket path and command using environment and qutebrowser version details.
3. Tries sending the open command via IPC; if unsuccessful, runs `qutebrowser` in the background.

---

### Usage

**Basic example:**
```sh
open_url_in_instance.sh https://archlinux.org/
```

**With other arguments:**
```sh
open_url_in_instance.sh --target window https://wiki.archlinux.org/
```

**Integration:**
- Assign to a keybinding in qtile for "send URL to browser".
- Use as a drop-in replacement for usual browser opener commands, ensuring URLs always open in one consistent qutebrowser session.

This script can be executed from the terminal or hooked into application launchers (like rofi), scripts, or qtile keybindings.

#### TL;DR
```sh
# Always open new URL in existing qutebrowser window/session if possible
open_url_in_instance.sh <your-url>
```

---

> [!TIP]
>
> The script relies on `md5sum` to generate a user-specific socket name, which is convenient and adequate, but if $USER contains unexpected/unusual characters, checks for edge cases may be warranted. Moreover, error handling is minimal: if socat fails for any reason other than "qutebrowser not running," the fallback might inadvertently launch unwanted browser instances. Consider extending the script to handle more nuanced failure conditions, possibly with user-facing error messages or logging for troubleshooting. Also, the version and protocol variables are hardcoded—if you update qutebrowser, compatibility may break. Reading these dynamically, or providing an explanation in the script's comments, would improve maintainability.