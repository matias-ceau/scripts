# fzfmenu Cache Launcher

---

**fzfmenu_cache.sh**: Caches and lists executables in PATH instantaneously for fzfmenu launcher

---

### Dependencies

- `fd` — Modern alternative to `find` for fast file searches. Used here for listing executables quickly.
- `/dev/shm` — System memory-backed temporary storage (usually available on modern Linux).
- `bash` — Script uses Bash-specific syntax.
- `sort`, `tee`, `mv` — Basic coreutils, standard on Arch Linux.

### Description

This script speeds up the execution time for any menu or launcher script (such as your custom `fzfmenu`) that needs to list all executables in your `$PATH`. It achieves this by building and caching an up-to-date list of all executable files found in `$HOME/.local/bin` and `/usr/bin` (plus any other directories in the user's `$PATH`) using `fd`.

- **Cache Location**: The cache file is placed in `/dev/shm/fzfmenu_path_cache` — this is a RAM-disk location, guaranteeing very fast reads and ephemeral storage (reset at boot).
- **Cache Strategy**: 
    - If the cache exists, its contents are output immediately (providing nearly instant results).
    - Meanwhile, a new cache is built in the background for the next script invocation, keeping the list fresh with minimal launch delay.
    - The cache is saved atomically using a `.tmp` file then moved over the old cache.
- **Environment Manipulation**: Checks in `$HOME/.local/bin` first, so custom user scripts and binaries are always found.

### Usage

Typically, you'd use this script as input for an `fzf`-based program launcher. It’s designed to be piped into another script or command:

```
/home/matias/.scripts/bin/fzfmenu_cache.sh | fzf --ansi
```

**Stand-alone execution:**
```sh
/home/matias/.scripts/bin/fzfmenu_cache.sh
# Outputs a sorted, colored, unique list of all “executables” in $PATH directories
```

**In a keybinding (Qtile config example):**
```python
Key([mod], "p", lazy.spawn("sh ~/.scripts/bin/fzfmenu_cache.sh | fzf --ansi | xargs -r $SHELL -ic"))
```

---

> [!TIP]
> - While this design makes menu launches almost instantaneous, it has a *race condition*: the cache is always being rebuilt in the background, but it's possible for a menu to show slightly outdated data after you’ve just installed or removed programs.
> - It’s not cross-platform (somewhat Arch-centric: assumes existence of `/dev/shm`, GNU coreutils, `fd`) and hardcodes `$HOME/.local/bin` and `/usr/bin`.
> - You may consider error-handling if `$CACHE` is not writable, or abstracting `$PATH` handling for more flexibility.
> - If you have a rapidly changing `$PATH`, consider mechanisms for an explicit cache refresh.
> - To sort strictly by file name (not including full path), adjust the `sort -u` or post-process output.