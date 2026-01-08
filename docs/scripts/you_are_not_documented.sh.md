# Undocumented Script Finder

---

**you_are_not_documented.sh**: List scripts missing the inline `#INFO:#` documentation marker

---

### Dependencies

- `bash`
- `rg` (ripgrep) — used to scan files for the `#INFO:#` marker and filter results
- `$SCRIPTS` — environment variable pointing to your scripts root directory (expected in your Arch/qtile setup)

### Description

This utility helps you keep your personal script collection consistent by reporting which files do *not* contain your inline documentation tag `#INFO:#`.

It performs two filtering passes:

1. `rg '#INFO:#' --files-without-match "$SCRIPTS"`  
   Recursively searches under `$SCRIPTS` and prints only file paths that **do not** match the marker.
2. `| rg -v '/docs/|/config/|\.csv|\.md'`  
   Excludes common non-target paths and formats:
   - anything under `/docs/` or `/config/`
   - `*.csv` and `*.md` files

The output is a plain newline-separated list of files, suitable for piping into other tools (e.g., opening in `$EDITOR`, generating a TODO list, etc.).

### Usage

Run from a terminal (or from a qtile keybinding that spawns commands):

tldr:
- List undocumented scripts:
  - `you_are_not_documented.sh`

Examples:
- Ensure `$SCRIPTS` is set and run:
  - `export SCRIPTS="$HOME/.scripts"`
  - `you_are_not_documented.sh`

- Open results in your editor (example with nvim):
  - `you_are_not_documented.sh | xargs -r nvim`

- Count undocumented files:
  - `you_are_not_documented.sh | wc -l`

---

> [!TIP]
> Consider failing fast if `$SCRIPTS` is unset or not a directory (e.g., `: "${SCRIPTS:?}"` and `[[ -d "$SCRIPTS" ]] || exit 1`). Also, `rg` will scan *everything* under `$SCRIPTS`; adding `--hidden` / `--no-ignore` (or the opposite) depending on your dotfile layout can make the results more predictable. Finally, you may want to exclude binaries or large directories explicitly (`--glob '!node_modules/**'`, etc.) to keep it fast.