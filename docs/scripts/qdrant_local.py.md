# Qdrant Local (Docker launcher)

---

**qdrant_local.py**: Start a local Qdrant Docker container with persistent storage and ports

---

### Dependencies

- `python` (3.10+ recommended): runs the CLI
- `docker`: required to start and manage the Qdrant container
- `qdrant/qdrant` (Docker image): default server image pulled on first run
- `curl` (optional): used in the printed “Test” command

### Description

This script is a small CLI wrapper around `docker run` to reliably launch a local **Qdrant** server on your Arch Linux machine with **persistent storage** under `~/.local/db/qdrant/<name>`. It:

- Verifies Docker availability by calling `docker version` (customizable via `$DOCKER_BIN`).
- Creates the base directory and a per-database subdirectory (`--name`) and mounts it to `/qdrant/storage` inside the container.
- Exposes both Qdrant ports:
  - REST: container `6333` → host `--port`
  - gRPC: container `6334` → host `--grpc-port`
- Optionally enables authentication by setting `QDRANT__SERVICE__API_KEY` when `--api-key` is provided.
- Generates a predictable container name (`qdrant-<name>`) and sanitizes it (lowercase, `/` and spaces to `-`).
- Supports `--replace` to force-remove any existing container of the same name and `--detach` to run in the background.

This is well-suited for a qtile keybinding, a dev shell alias, or quick experimentation with different “databases” by changing `--name`.

### Usage

```sh
# Default (persistent storage in ~/.local/db/qdrant/default)
qdrant_local.py

# Run a separate instance with a different storage directory name
qdrant_local.py --name notes

# Bind to all interfaces (be careful) and run detached
qdrant_local.py --host 0.0.0.0 --detach

# Enable API key auth
qdrant_local.py --api-key 'supersecret'

# Replace existing container (useful after config changes)
qdrant_local.py --replace --name notes

# Use a specific docker binary (rootless docker / podman wrapper, etc.)
DOCKER_BIN=docker qdrant_local.py
```

---

> [!TIP]
> Improvements to consider:
> - Add a pre-flight check for an existing running container (and print a friendly message) when `--replace` isn’t set.
> - Consider adding `--restart unless-stopped` for a more “service-like” experience.
> - `sanitize_container_name()` doesn’t replace dots despite the help text mentioning it; either update the help or also replace `.` with `-`.
> - If you frequently use qtile, a companion script to “toggle” (start/stop) the container could make keybinding usage smoother.