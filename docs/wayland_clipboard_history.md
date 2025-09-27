# Wayland Clipboard History Overview

This clipboard workflow consists of three cooperating utilities that keep history encrypted at rest while exposing a volatile search interface in RAM.

1. `wayclip-daemon.py` — long-lived watcher that ingests clipboard updates from `wl-paste --watch`, detects MIME type + sensitivity, and appends encrypted rows to the SQLCipher database.
2. `wayclip-decryptor.py` — helper that keeps an in-RAM mirror of the encrypted database inside `/dev/shm/clipboard.db`, refreshing on demand or on a timer.
3. `wayclip-viewer.sh` — lightweight `fzf` wrapper that queries the decrypted `/dev/shm` database, offers fuzzy search, and can reinject clipboard entries with `wl-copy` or simulated typing via `wlrctl`.

A shared helper module (`lib/wayclip_utils.py`) provides SQLCipher helpers, MIME detection, and the sensitivity heuristics so the scripts stay small.

## Prerequisites

- Wayland environment with `wl-clipboard` (`wl-copy`, `wl-paste`).
- `sqlcipher` support available through Python's `sqlite3` module (verified with URI mode).
- `fzf`, `wl-copy`, `wlrctl`, `curl`, and `sqlite3` CLI.
- `CLIPBOARD_DB_KEY` (or alternate var) exported with a strong key before launching any component.

## Clipboard Daemon (`bin/wayclip-daemon.py`)

```
wayclip-daemon.py daemon \
  --database ~/.local/share/clipboard_secure.db \
  --key-env CLIPBOARD_DB_KEY \
  [--primary] [--verbose] [--log-file PATH]
```

- Spawns `wl-paste --watch` under the hood and reinvokes itself in `ingest` mode for every clipboard event.
- Auto-creates the encrypted database (chmod 600) and schema if needed.
- MIME detection handles common text/image types; other payloads default to `application/octet-stream`.
- Sensitive flag triggered by regexes (AWS/GitHub/API tokens, PEM headers) and entropy checks on Base64-like blobs.
- Respects `CLIPBOARD_STATE` to skip empty/nil updates.

## Decryptor (`bin/wayclip-decryptor.py`)

```
wayclip-decryptor.py \
  --database ~/.local/share/clipboard_secure.db \
  --output /dev/shm/clipboard.db \
  --interval 5 \
  [--serve --host 127.0.0.1 --port 8765] \
  [--show-sensitive] [--mlock-all] [--verbose]
```

- Copies the encrypted DB into `/dev/shm` using SQLite's `backup` API, preserving schema + indexes.
- Refresh loop runs every `--interval` seconds; `--interval 0` performs a one-shot export.
- Optional JSON API (`--serve`) exposes recent entries for other tooling; sensitive rows stay hidden unless `--show-sensitive` is set.
- `--mlock-all` attempts `mlockall(MCL_CURRENT|MCL_FUTURE)` to keep decrypted pages out of swap (subject to `ulimit -l`).
- Removes the `/dev/shm` database on exit so sensitive data does not persist past runtime.

## Viewer (`bin/wayclip-viewer.sh`)

```
wayclip-viewer.sh [--db /dev/shm/clipboard.db] [--show-sensitive] [--height 70%]
```

- Reads rows from the volatile mirror and feeds them into `fzf --listen` with live reloads.
- Default view hides `sensitive=1` rows; pass `--show-sensitive` to include them.
- Key bindings:
  - `Enter`: `wlrctl keyboard type` for textual entries (skips binaries).
  - `Ctrl-Y`: pipe raw bytes to `wl-copy --type <mime>` for reinjection.
  - `Ctrl-D`: delete the selected row from the `/dev/shm` mirror only.
- A background watcher monitors the mirror's mtime and POSTs a `reload` command to the `fzf` HTTP listener whenever the decryptor refreshes the file.
- Preview pane shows ID, timestamp, MIME, sensitivity, and a trimmed snippet.

## Security Notes

- Master database is always SQLCipher-encrypted with AES-256; encryption key never touches disk.
- Decrypted mirror resides on tmpfs (`/dev/shm`), chmod 600, and is removed when the decryptor stops.
- Sensitive heuristics help avoid accidental exposure—viewer hides those entries unless explicitly requested.
- `mlockall` optional hardening prevents the mirror from being swapped to disk when supported by the OS limits.
- Model does **not** defend against privileged attackers (root, same-user malware, or live RAM extraction).

## Typical Workflow

1. Export a strong key: `export CLIPBOARD_DB_KEY="$(openssl rand -hex 32)"` (or use your preferred secret manager).
2. Start the daemon: `wayclip-daemon.py daemon --verbose` (run via systemd/user service for persistence).
3. Launch the decryptor when you need to browse history: `wayclip-decryptor.py --serve`.
4. Open the viewer: `wayclip-viewer.sh` and fuzzy-search / act on entries.
5. Stop the decryptor/viewer to wipe `/dev/shm` mirror when finished.

Optional: subscribe external tools to the decryptor JSON API (e.g., `curl http://127.0.0.1:8765/entries?limit=20`).
