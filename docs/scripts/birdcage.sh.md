# Birdcage: Firejail + mitmproxy Whitelist Sandbox

---

**birdcage.sh**: Run a command in a private Firejail cage with a domain-whitelisted HTTP(S) proxy

---

### Dependencies

- `bash`
- `firejail` — provides the folder-based sandbox via `--private=...`
- `mitmproxy` — runs a local intercepting proxy and enforces the whitelist
- `python` (via `mitmproxy`) — executes the generated `whitelist.py`

### Description

`birdcage.sh` builds a lightweight “cage” directory and runs a command inside it using Firejail’s `--private`, isolating the process’ filesystem view to that folder. In parallel, it spawns `mitmproxy` on `127.0.0.1:8080` with a dynamically generated addon script (`whitelist.py`) that blocks outbound web traffic unless the request host matches an allowlist.

The allowlist supports wildcards (via Python’s `fnmatch`), e.g. `*.wikipedia.org`. If a host is not allowed, mitmproxy returns a synthetic `403 Blocked by Birdcage whitelist` response.

The target command is executed with `http_proxy` and `https_proxy` set to the local proxy, so well-behaved CLI tools and Python libraries that respect these environment variables will be constrained to the whitelist.

### Usage

Run from a terminal (also suitable for a qtile keybinding if you pass a full command):

- Basic pattern  
  `birdcage.sh /path/to/cage <command...>`

Examples (tldr-style):

- Sandbox a Python agent with restricted egress  
  `birdcage.sh ~/.cache/birdcage python3 my_agent.py --arg value`

- Use a project-local cage directory  
  `birdcage.sh ./cage pytest -q`

- Extend allowed domains  
  Edit `CAGE/whitelist.py` and add entries to `SAFE_DOMAINS`, then re-run the script.

---

> [!TIP]
> **Improvements to consider:** the port is hardcoded to `8080` (risk of conflict); choose a free port dynamically. `trap "kill $MITM_PID" EXIT` may leave children or fail if mitmproxy already exited—use `kill 0`/process groups or `wait`. Also note this relies on apps honoring `http_proxy`/`https_proxy`; a process can bypass via direct sockets unless you add stronger network restrictions (e.g., Firejail networking flags/iptables). Finally, TLS interception with mitmproxy may require installing its CA cert inside the cage for some clients.