# fzfmenu_cache.sh: Command Cache Script

---

**fzfmenu_cache.sh**: Generates and caches a list of executables in your `PATH` for fast access.

---

### Dependencies

- `bash`: Script is written for Bash.
- `find`: Finds executable files in directories.
- `sort`: Removes duplicate entries by sorting output uniquely.
- `tee`: Writes output to both standard output and a file.
- Shared Memory (`/dev/shm`): The script utilizes shared memory (`/dev/shm`) for faster caching. Ensure your system has this mounted.
  
### Description

The **fzfmenu_cache.sh** script generates a list of all executables available in the system `PATH` environment variable and caches them at `/dev/shm/fzfmenu_path_cache` for quick access. 

#### Key Features:
- **Caching**: On first run, it generates a cache of executables and keeps it in shared memory for faster subsequent retrievals.
- **Background Cache Update**: The script always updates the cache in the background, ensuring that it remains up-to-date while keeping the output instant.
- **De-duplication**: Ensures no duplicates are present in the cached list of executables by sorting uniquely.

The cache is stored in a temporary and fast memory (`/dev/shm`) to provide instant reads on subsequent runs.

### Usage

The script can be executed in a terminal or as part of another script/tool. 
It is especially useful for integration with tools like `fzf` for command selection.

Example:

```bash
# Running the Script
bash /home/matias/.scripts/bin/fzfmenu_cache.sh

# Sample Output (if cache already exists)
ls
grep
find
bash
```

#### Common Scenarios:
1. **Direct Command**: Run the script directly to list available executables.
2. **fzf Integration**: Pair it with `fzf` to select an executable interactively:
    ```bash
    selected_command=$(bash /home/matias/.scripts/bin/fzfmenu_cache.sh | fzf)
    $selected_command
    ```

3. **Set to Keybinding** (in qtile or other WMs).
   Add a keybinding to run this script with `fzf`, allowing quick command execution.

---

> [!TIP]
> - The script does not handle invalid entries in the `PATH` variable. Consider adding checks for malformed or non-existing directories in `PATH`.
> - If `/dev/shm` is unavailable (or mounted with improper permissions within your environment), the script will fail to cache data. It may be useful to provide fallback storage, such as `/tmp/`.
> - Using `find` across large directories might slow down the cache rebuild, particularly on low-powered systems. Consider implementing smarter exclusion rules for paths like `/usr/bin` if needed.
> - Since cache refreshes run in the background, use caution if multiple instances of the script are run simultaneously, as they might overwrite the cache mid-execution.