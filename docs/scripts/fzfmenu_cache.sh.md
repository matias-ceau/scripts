# fzfmenu cache builder for PATH executables

---

**fzfmenu_cache.sh**: Cache PATH executables to RAM and print them, with background refresh

---

### Dependencies

- `bash` — shell interpreter
- `fd` — fast file finder; used to list executables/symlinks in PATH
- `coreutils` — `sort`, `cat`, `tee`, `mv`, `rm`
- `fzf` (optional) — consumer for interactive selection

### Description

This helper builds and serves a fast, deduplicated list of launchable commands for your fzf-based launcher. It scans only the first level of each directory in PATH (prepending `$HOME/.local/bin` and `/usr/bin`), collecting both executable files and symlinks using `fd` with `-t x -t l --maxdepth 1`, then sorts them uniquely.

The list is cached in RAM at `/dev/shm/fzfmenu_path_cache` to minimize disk I/O and keep startup snappy under Qtile on Arch. On normal invocation, it prints the cached list to stdout (creating it if missing) and simultaneously refreshes the cache in the background for the next run. A `--refresh` mode atomically rebuilds the cache and exits without printing.

Color output is currently preserved via `fd --color=always`, which is useful when piping into `fzf --ansi`.

### Usage

- Print list (build if needed), suitable for piping:
```
~/.scripts/bin/fzfmenu_cache.sh
```

- Force a cache rebuild only (e.g., at login or on PATH changes):
```
~/.scripts/bin/fzfmenu_cache.sh --refresh
```

- Use with fzf to pick and launch a command (detached):
```
cmd="$(~/.scripts/bin/fzfmenu_cache.sh | fzf --ansi)"
[ -n "$cmd" ] && setsid -f "$cmd" >/dev/null 2>&1
```

- Pre-warm cache from Qtile autostart (once per session):
```
~/.scripts/bin/fzfmenu_cache.sh --refresh &
```

- Cron/systemd-user timer alternative: run `--refresh` periodically to keep it hot.

---

> [!TIP]
> - When no cache exists, two builds may run concurrently (one for output, one for refresh). Consider guarding refresh with `flock` or skipping the extra rebuild on first run.
> - The output is produced from a background job; if a consumer expects synchronous output, foreground the initial output and only refresh in the background.
> - Caching colored lines (`--color=always`) can leak ANSI codes to non-fzf consumers; consider storing plain output and adding a flag to colorize on demand.
> - Validate `fd` availability and provide a graceful fallback or hint (e.g., install `fd` on Arch).
> - You may want to include `/usr/local/bin` in PATH precedence if you rely on locally installed binaries.