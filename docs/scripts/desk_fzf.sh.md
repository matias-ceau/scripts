# Desktop File Selector using fzf

---

**desk_fzf.sh**: Find and execute .desktop files with fzf selection.

---

### Dependencies

- `fzf`: Fuzzy finder used for selection of files.
- `bat`: Command-line tool for syntax highlighting and Git integration, serves as a preview.
- `fd`: A simple, fast and user-friendly alternative to `find`.

### Description

This script facilitates the selection and execution of `.desktop` files on Arch Linux through a user-friendly terminal interface. It employs `fzf` for fuzzy searching and selection, while `bat` enhances the experience by providing a preview of the files. 

The script operates primarily with cached data to improve performance. It maintains a cache file located at `$XDG_CACHE_HOME/desktop-script.txt`, which stores the list of `.desktop` files found on the system. The cache is automatically updated if it is older than two hours or when invoked with the `--update` flag.

The main functionalities of the script include:

1. **Cache Management**: It updates the cache with the current date and a listing of `.desktop` files in the user's directories. 
2. **File Selection**: Using `fzf`, the user can select a `.desktop` file, with a preview of its contents provided by `bat`.
3. **Execution of Commands**: After selection, the script extracts the `Exec` line from the chosen `.desktop` file and runs the specified command.

### Usage

To use the script, simply run it in a terminal:

```bash
/home/matias/.scripts/desk_fzf.sh
```

If the cache needs to be updated, invoke the script with:

```bash
/home/matias/.scripts/desk_fzf.sh --update
```

The script will display a list of `.desktop` files using `fzf`. After selecting a file, the command defined in the `Exec` field of that `.desktop` file will be executed automatically.

---

> [!TIP]  
> This script is quite functional, but could benefit from additional error handling. For instance, it could include checks for the presence of dependencies (`fzf`, `bat`, `fd`) and provide instructions if they are not installed. Additionally, consider implementing a more robust caching mechanism to ensure that the cache does not get corrupted.