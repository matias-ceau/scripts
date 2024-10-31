# Desktop Launcher with FZF

---

**desk_fzf.sh**: Script to find and launch `.desktop` files using `fzf`.

---

### Dependencies

- `fd`: A simple, fast and user-friendly alternative to 'find'. Used to search for `.desktop` files.
- `fzf`: A command-line fuzzy finder, allowing easy selection of files.
- `bat`: A cat clone with syntax highlighting and Git integration, used for previews.
- `bash`: The Bourne Again SHell, the language used for the scripting.

### Description

This script is designed to locate and launch `.desktop` files on your Arch Linux system using `fzf` for fuzzy finding. It maintains a cache of `.desktop` files for performance, refreshing this cache if it is over two hours old. The cache file, `desktop-script.txt`, is stored in the `$XDG_CACHE_HOME` directory.

Upon execution, it uses `fd` to search for `.desktop` files and updates the cache when necessary. `fzf` is then leveraged to interactively select a `.desktop` file, previewing its contents with `bat`. Upon selection, the script extracts the command from the `Exec` line within the `.desktop` file and executes it.

### Usage

To run this script, you can execute it directly in a terminal. To ensure the cache is freshly updated, use the `--update` flag:

```sh
bash /home/matias/.scripts/bin/desk_fzf.sh --update
```

Upon running, you'll be presented with a list of available `.desktop` files. Use the `fzf` interface to select one.

If desired, you can assign a keyboard shortcut to run the script within your window manager, `qtile`.

---

> [!TIP]
> Consider adding error handling if `fd`, `fzf`, or `bat` are not installed, or if the `XDG_CACHE_HOME` is not set. Moreover, handle scenarios where no `.desktop` files are found, perhaps by prompting further actions or notifying the user.