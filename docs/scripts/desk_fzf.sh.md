# Fuzzy .desktop Launcher

---

**desk_fzf.sh**: Quickly search and launch `.desktop` applications using `fzf` and a cached file listing.

---

### Dependencies

- `fd` — For fast file searches (`fd` is a fast alternative to `find`).
- `fzf` — Terminal fuzzy finder for interactive selection.
- `bat` — Syntax highlighting for file previews in `fzf`.
- Bash — Script is written for bash.
- XDG compatible environment (`$XDG_CACHE_HOME` should be set).
- `.desktop` files on your system (standard in most Linux desktop environments).

---

### Description

This script streamlines application launching by searching for `.desktop` files system-wide and presenting them via an `fzf`-powered fuzzy selector. Its core logic is as follows:

1. **Caching:**  
   - `.desktop` file paths are indexed using `fd` and stored in a cache file under `$XDG_CACHE_HOME/desktop-script.txt`, along with a timestamp (UNIX epoch seconds).
   - The cache is refreshed if older than 2 hours (7200 seconds), or by forcibly running with the `--update` flag.

2. **Selection UI:**  
   - Uses `bat` to display relative paths to `.desktop` files with line highlighting, piped into `fzf` for interactive selection.
   - An `fzf` preview window (with `bat`) displays the full content of each `.desktop` file.

3. **Launching:**  
   - Parses the selected `.desktop` file for its `Exec=` line―the application execution command.
   - Executes this application command using `eval`.

This script suits an Arch Linux user with qtile as WM, providing a minimal and fast alternative application launcher.

---

### Usage

You can either run from a terminal or bind it to a key in qtile.

#### Basic:  
```bash
~/.scripts/bin/desk_fzf.sh
```

#### Force update the cache:
```bash
~/.scripts/bin/desk_fzf.sh --update
```

#### Sample Qtile Keybinding:
Add in your `config.py`:
```python
Key([mod], "d", lazy.spawn("~/.scripts/bin/desk_fzf.sh"))
```
This binds `Mod+d` to the launcher.

---

> [!TIP]
> The caching logic is simple and fast, but some improvements are possible:
> - The script assumes `.desktop` files are readable and have an `Exec` line, but ignores entries with `Exec=` containing desktop environment specific variables or substitution fields (see [freedesktop.org spec](https://specifications.freedesktop.org/desktop-entry-spec/desktop-entry-spec-latest.html)). If the `Exec` command contains `%`-codes (like `%u`), these are not handled and may cause unexpected behavior.
> - The preview command (`bat --color=always {}`) might fail if `bat` isn't installed or if the file path includes problematic characters.
> - No filtering for only user-accessible `.desktop` files, nor filtering out duplicates or broken symlinks.
> - Running `eval` directly can have security implications if untrusted `.desktop` files exist on your system.
> - For privacy or performance, you may wish to scope `fd` to known application directories (like `/usr/share/applications` and `~/.local/share/applications`) rather than searching from root (`/`).
> - The script does not parse or respect the `TryExec` or terminal options within `.desktop` files.
> 
> For daily use on a personalized system these may not matter, but keep them in mind if you adapt or share the script.