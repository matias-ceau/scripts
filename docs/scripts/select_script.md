# Rofi script picker (cache-backed)

---

**select_script**: Rofi-based picker to execute a script from a cached CSV description list

---

### Dependencies

- `rofi` — used as the dmenu UI (`-dmenu -markup-rows -i`)
- `~/.cache/script_info.csv` — cache file providing script names + descriptions
- `~/.scripts/` — folder where the executable scripts are expected to live
- C toolchain (build-time): `gcc`/`clang`, `libc`

### Description

`select_script` is a small C launcher that reads a precomputed cache (`~/.cache/script_info.csv`), shows the available scripts in a `rofi -dmenu` list with markup, then executes the selected script from `~/.scripts/`.

Workflow:

1. **Load cache**: `load_cache()` opens the CSV, skips the header, then parses each line into:
   - `file`: script filename (up to 255 chars)
   - `descr`: description extracted from the last quoted CSV field  
2. **Display list**: `display_rofi()` prints entries like:
   - green filename, an arrow separator, then the description
3. **Get selection**: `extract_choice()` reads the chosen line and extracts the filename from the markup.
4. **Execute**: `execute_choice()` builds `~/.scripts/<choice>` and runs it via `execl()` (replacing the current process).

This fits well in an Arch + qtile setup as a fast “script palette” you can bind to a key and use without opening a terminal.

### Usage

Build:

    gcc -O2 -o ~/.scripts/bin/select_script ~/.scripts/bin/select_script.c

Run (interactive rofi picker):

    ~/.scripts/bin/select_script

Qtile keybinding example (conceptual):

    Key([mod], "p", lazy.spawn("~/.scripts/bin/select_script"))

Cache expectations:

- File: `~/.cache/script_info.csv`
- First line is a header (ignored)
- Lines must match the script’s `sscanf()` pattern (filename first, description last quoted field)

---

> [!CAUTION]
> The rofi usage is currently flawed: the program opens `rofi -dmenu` twice—once for writing (display) and once for reading (choice). This results in two separate rofi instances and the selection won’t correspond to what was displayed. Prefer a single `popen()` call opened for reading, and feed entries by writing to rofi via a pipe you control (or run `rofi` once with stdin populated, then read stdout). Also consider: validate `realloc()` results, handle missing/empty cache gracefully, and use `execv()`/`posix_spawn()` with error reporting if execution fails.