# FZF Menu Cache Script

---

**fzfmenu_cache.sh**: Efficiently creates and utilizes a cached list of executable files within frequently used directories.

---

### Dependencies

- `bash`: A Unix shell and command processor.
- `fd`: A fast and user-friendly alternative to `find`; used here to search for files.
- `sort`: Unix utility to sort lines in text files.
- `/dev/shm`: A temporary filesystem to store the cache in shared memory for speed.

### Description

This script efficiently generates and uses a cache file containing a list of executable files found in the user's `$PATH` directory. By leveraging this cache, it can provide faster results for command or file selection workflows (e.g., integrating with `fzf`, a fuzzy finder). Here's how the script works:

1. **Cache Management**: 
   - Checks if the cache (`/dev/shm/fzfmenu_path_cache`) exists.
   - If the cache exists, its content is immediately displayed.
   - If the cache does not exist, it invokes `build_cache` to create the list and saves it to the cache file.

2. **Cache Building**:
   - The function `build_cache` iterates through each directory in `$PATH`.
   - For each directory, it uses `fd` to find executable files (`-tx`), symbolic links (`-tl`), and applies options like `--maxdepth=1` to keep it shallow and fast.
   - Results are sorted and duplicates are removed using `sort -u`.

3. **Background Rebuilding**:
   - The cache is asynchronously rebuilt every time the script runs, ensuring an always up-to-date cache with minimal delay for the user.

### Usage

This script is primarily a helper for workflows where a real-time, updated cache of executable files is needed. Below are some examples:

#### Example 1: Running the script to output cache
```bash
~/.scripts/bin/fzfmenu_cache.sh
```

If the cache exists, it outputs the cached list. If not, it generates the cache and simultaneously displays the new list.

#### Example 2: Piping into `fzf`
```bash
~/.scripts/bin/fzfmenu_cache.sh | fzf
```

This example allows using the cache to search interactively (fuzzy search) with `fzf`.

#### Example 3: Assigning to a keybinding in qtile
The script can be launched by binding it to a key in your `qtile` configuration, combined with utilities like `fzf` or custom prompts.

---

> [!TIP]  
> - The path for the cache (`/dev/shm/fzfmenu_path_cache`) is hardcoded to `/dev/shm`. If `/dev/shm` is unavailable on another machine, the script would fail. Consider adding a fallback mechanism.  
> - Instead of hardcoding `$HOME/.local/bin:/usr/bin`, consider dynamically appending all paths from the user's environment (`$PATH`) for broader application.  
> - Potential improvements include adding a verbosity flag or debugging option to control script output, and support more interactive command-line arguments.