# Onyx Docker Installer / Manager

---

**install.sh**: Install, shutdown, or fully remove an Onyx Docker Compose deployment

---

### Dependencies

- `bash`
- `docker` (daemon must be running)
- Docker Compose: `docker compose` (plugin) or `docker-compose` (standalone)
- `curl` (downloads deployment assets + health checks)
- Optional (improves behavior):
  - `nc` (netcat) or `lsof` (better local port availability checks)
  - `jq` + `bc` (only used on macOS paths; not needed on Arch)
- Standard utils: `df`, `grep`, `sed`, `awk`, `wc`, `chmod`, `rm`, `mkdir`

### Description

This script bootstraps an Onyx deployment under a local `onyx_data/` directory and manages its lifecycle via Docker Compose.

It supports three modes:

- Default (install / update / restart):
  - Verifies Docker + Compose availability and checks the daemon.
  - Performs resource checks (expects ~10GB RAM, 32GB disk free) and allows overriding with confirmation.
  - Downloads upstream deployment files from GitHub (compose, env template, nginx templates, README).
  - Creates or updates `onyx_data/deployment/.env`:
    - New install: prompts for image tag and auth schema (basic vs disabled).
    - Existing install: offers “restart” or “update” (rewrites/creates `IMAGE_TAG=`).
  - Detects an available host port starting at `3000` and exports `HOST_PORT` for Compose.
  - Pulls images, starts containers, verifies they aren’t restart-looping, then polls `http://localhost:$HOST_PORT` for readiness.

- `--shutdown`: stops (does not remove) containers via `compose stop`.
- `--delete-data`: stops + removes containers/volumes and deletes the entire `onyx_data/` tree (requires typing `DELETE`).

### Usage

```sh
# Install / start (interactive prompts)
cd /path/where/you/want/onyx_data
/home/matias/.scripts/dev/install.sh

# Stop services (keep data)
./install.sh --shutdown

# Full wipe (containers, volumes, files)
./install.sh --delete-data

# Help
./install.sh --help
```

Notes:
- Designed for terminal use; not really a qtile “keybinding” script due to prompts and long-running output.
- If services are running, the script refuses to modify config; use `--shutdown` first.

---

> [!TIP]
> Improvements to consider:
> - Use `set -euo pipefail` and quote more variables defensively (some are safe but inconsistent).
> - `TOTAL_STEPS=8` becomes inaccurate when extra steps run (health check, etc.); compute dynamically or update the constant.
> - Port probing via `curl` can give false positives/negatives; on Arch, prefer `ss -ltn` (from `iproute2`) for reliable checks.
> - Compose version check relies on parsing `x.y.z`; pre-release/build tags may break it—consider `sort -V` or `dpkg --compare-versions`-style logic.