# Transform symlinks into real files/directories

---

**transform_symlink.sh**: Turn symlinks into copies of their targets (file or directory)

---

### Dependencies

- `bash`
- `readlink` (from `coreutils`) — resolves the symlink target
- `rm`, `cp` (from `coreutils`) — removes the symlink and copies the target in its place
- `fd` — used in interactive mode to discover symlinks
- `fzf` — interactive selector when no arguments are provided
- `bat` — preview inside `fzf` (nice-to-have; without it the preview will fail)

### Description

`transform_symlink.sh` “unsymlinks” paths: it replaces a symlink with a real copy of whatever it points to. This is useful when you want to vendor a config directory, freeze a snapshot of linked files, or remove symlink indirections before moving/archiving.

Behavior:
- If the given path is **not** a symlink (`[[ -L ... ]]`), it errors and returns non‑zero.
- It resolves the target via `readlink` and ensures it exists.
- It removes the symlink (`rm "$symlink_path"`) and then copies the target into the same path (`cp -r "$target_path" "$symlink_path"`).
- With **no arguments**, it searches the current directory (`$PWD`) up to depth 5 for symlinks, then lets you pick one using `fzf` with a `bat` preview.

### Usage

Interactive (best for ad-hoc cleanup in a project folder):

    transform_symlink.sh

Transform one symlink:

    transform_symlink.sh /path/to/link

Transform multiple symlinks:

    transform_symlink.sh link1 link2 link3

Help:

    transform_symlink.sh -h
    transform_symlink.sh --help

For qtile: this works well bound to a key that opens a terminal in the current working directory and runs it (since the interactive mode is TUI-based).

---

> [!TIP]
> Consider using `readlink -f` (or handling relative targets) because `readlink` may return a relative path that won’t exist unless resolved against the symlink’s directory. Also, `rm` happens before the copy: if `cp` fails you’ve already lost the link—adding a confirmation prompt, a `--dry-run`, and/or copying to a temp path then moving into place would make it safer. Finally, `cp -r` is suboptimal for single files (and doesn’t preserve attributes); `cp -a` plus a file/dir check would be more robust.