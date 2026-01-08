# Script file “birthdays” index updater

---

**update_birthdays.sh**: Rebuilds `bdays.csv` with each script’s “birth date” from git history

---

### Dependencies

- `bash`
- `git` — used to retrieve the first commit date of each file (`git log --follow`)
- `fd` — file discovery under `$SCRIPTS`
- `sed` — fills missing dates
- `coreutils`: `sort`, `tail`, `cut`, `basename`, `rm`, `date`

### Description

This script generates a CSV file (`$SCRIPTS/bdays.csv`) containing a “birthday” for each script in your `$SCRIPTS` tree: the date of the earliest git commit that touched the file (with rename tracking via `--follow`).

Workflow:

1. Creates a temporary file at `$SCRIPTS/bdays.csv.temp`.
2. Uses `fd` to enumerate files under `$SCRIPTS` (files only, because `-t x` is used).
3. For each file, it runs:

   - `git log --follow --format=%ai <file>` to list commit timestamps
   - `tail -n 1` to select the oldest entry
   - `cut -d' ' -f1` to keep only `YYYY-MM-DD`

4. Appends lines in the form:

   - `YYYY-MM-DD, filename`

5. If a file has no git history (or `git log` returns nothing), the date field is blank; `sed` replaces leading `, ` with today’s date.
6. Sorts the final output and writes it to `$SCRIPTS/bdays.csv`, then removes the temp file.

This is handy for meta-maintenance: tracking when scripts first appeared, generating dashboards, or feeding status widgets in qtile.

### Usage

Run from anywhere, as long as `$SCRIPTS` is set:

    export SCRIPTS="$HOME/.scripts"
    ~/.scripts/meta/update_birthdays.sh

Typical output file:

    2023-08-14, volume.sh
    2024-02-01, lock.sh

Suggested qtile binding (example idea):

    lazy.spawn("~/.scripts/meta/update_birthdays.sh")

---

> [!TIP]
> Consider adding safety and correctness improvements:
> - Quote `$SCRIPTS` in `--search-path "$SCRIPTS"` to handle spaces.
> - `fd . -tx` likely means “executable files”; if you want *all* scripts, consider `-t f` and filter by extension/path.
> - Running `git log` per file can be slow; you could batch via `git ls-files` + `git log --name-only` parsing.
> - Prefer `sed 's/^, /.../'` without `cat` (use input redirection) and use `mktemp` for the temp file to avoid collisions.