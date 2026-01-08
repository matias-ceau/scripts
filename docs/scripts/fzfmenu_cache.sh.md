# fzfmenu cache builder (PATH executables)

---

**fzfmenu_cache.sh**: Build and maintain a cached list of executables found in `$PATH`

---

### Dependencies

- `bash`
- `fd` — used to quickly enumerate executable files in each `$PATH` entry
- `sort`, `tee`, `cat`, `mv` — coreutils
- Writable shared memory at `/dev/shm` (typical on Arch with `tmpfs`)

### Description

This script generates a cache of executable filenames located in your `$PATH`, intended to be consumed by an `fzf`-based launcher/menu (e.g., a qtile keybinding that pipes candidates into `fzf`).

Key behaviors:

- Cache location: `/dev/shm/fzfmenu_path_cache` (fast, RAM-backed, wiped on reboot).
- PATH override: prepends `~/.local/bin` and `/usr/bin` to ensure common user/system tools are included.
- Cache builder: iterates through each directory in `$PATH` and runs:
  - `fd . -u -t x -t l --maxdepth=1 --search-path "$dir"`
  - Results are deduplicated via `sort -u`.
- Two modes:
  1. Normal mode: prints cached content quickly (if present), otherwise builds it.
  2. `--refresh`: rebuilds the cache atomically (via temp file + `mv`) and exits with no output.

Additionally, in normal mode it *always* triggers a background rebuild so the next invocation is up-to-date without blocking the current one.

### Usage

```sh
# Print cached executable list (best for piping into fzf)
~/.scripts/bin/fzfmenu_cache.sh
```

```sh
# Rebuild cache only (useful at login, after installing packages, etc.)
~/.scripts/bin/fzfmenu_cache.sh --refresh
```

Example qtile/launcher pipeline:

```sh
~/.scripts/bin/fzfmenu_cache.sh | fzf --ansi | xargs -r -I{} sh -lc '{}'
```

---

> [!TIP]
> Consider removing `--color=always`: the cache is plain text, and ANSI codes can pollute `fzf` matching unless you always use `--ansi`. Also, the normal path runs `build_cache` twice concurrently (one for initial output/build, one for refresh), which can be redundant and race on the same cache file; a simple lock (`flock`) and a single background refresh after output would reduce contention. Finally, `fd` on non-existent PATH entries is suppressed, but you might want to skip unreadable dirs explicitly for clarity/performance.