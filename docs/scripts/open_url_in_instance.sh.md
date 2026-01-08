# Open URL in running qutebrowser instance

---

**open_url_in_instance.sh**: Send a URL to qutebrowser via IPC, or start qutebrowser if needed

---

### Dependencies

- `qutebrowser` (binary at `/usr/bin/qutebrowser`)
- `socat` (used to talk to the qutebrowser IPC UNIX socket)
- `md5sum`, `cut` (to build the per-user socket name)
- `XDG_RUNTIME_DIR` (environment variable used to locate the IPC socket)

### Description

This script implements a “reuse existing browser” workflow for qutebrowser on Arch Linux/qtile setups: it tries to send the given URL (first argument) to an already-running qutebrowser instance via qutebrowser’s IPC socket. If that IPC send fails (e.g., qutebrowser not running, socket missing, permission issues), it falls back to launching qutebrowser with the original arguments.

Key points:

- The IPC socket is computed as:
  - `${XDG_RUNTIME_DIR}/qutebrowser/ipc-<md5(username)>`
- The message sent to the socket is JSON with:
  - `args`: the URL as a single-element array
  - `version`: hardcoded qutebrowser version (`1.0.4`)
  - `protocol_version`: set to `1`
  - `cwd`: current working directory (`$PWD`)
- `socat` performs the UNIX domain socket write; logging is silenced with `-lf /dev/null`.
- If IPC fails, `"$ _qute_bin" "$@" &` launches qutebrowser in the background with all provided args.

### Usage

Run from a terminal or bind in qtile as a URL handler:

- Open a URL (prefer existing instance):
  - `open_url_in_instance.sh "https://example.org"`
- Pass through additional qutebrowser args (used on fallback start):
  - `open_url_in_instance.sh "https://example.org" --target window`

In qtile (conceptually), bind it to a key to open clipboard/selected URLs via your preferred helper.

---

> [!TIP]
> Consider making `_qb_version` dynamic (e.g., `qutebrowser --version`) or omitting it if newer IPC expects different fields; a hardcoded `1.0.4` is likely outdated on Arch. Add basic argument checking (`[ -n "$1" ]`) and quoting/escaping for JSON safety (URLs containing `"` will break the JSON). Also consider using `exec` for the fallback launch (or explicitly disown) depending on how you want process lifetime handled.