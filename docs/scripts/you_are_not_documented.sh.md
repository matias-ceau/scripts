# you_are_not_documented.sh

---

**you_are_not_documented.sh**: Finds scripts lacking specific inline documentation tags

---

### Dependencies

- `rg`: ripgrep, required for fast file searching and text matching.
- Environment variable: `$SCRIPTS`, should point to the directory containing your scripts.

### Description

This script helps you manage inline documentation in your script repository by finding Bash (or other) scripts that do **not** contain a documentation marker of the form `#INFO:#`. It uses `ripgrep` (`rg`) for efficient text searching.

The steps are:
1. `rg '#INFO:#' --files-without-match "$SCRIPTS"`  
   Searches the `$SCRIPTS` directory for all files **without** the `#INFO:#` tag.
2. The results are piped through `rg -v '/docs/|/config/|\.csv|\.md'`  
   This excludes any matches that are:
   - In `/docs/` or `/config/` subdirectories
   - Files ending with `.csv` or `.md`

This is particularly useful for enforcing documentation standards in a self-maintained script library (like your dotfiles or personal utilities), especially when evolving a large or shared codebase under `qtile` on Arch Linux.

### Usage

Make sure:
- `ripgrep` is installed (`pacman -S ripgrep`).
- The environment variable `$SCRIPTS` is set correctly (i.e., points to the directory containing your scripts).

**Example Usage:**
```sh
export SCRIPTS="$HOME/.scripts/bin"
~/.scripts/bin/you_are_not_documented.sh
```

You can bind this command to a key in your `qtile` config or run it manually in the terminal to audit script documentation.

---

> [!TIP]
>
> - The script depends on the `$SCRIPTS` environment variable, but doesn't check if it's set or valid; adding a check with a friendly error could be helpful.
> - Currently, it only looks for the single tag `#INFO:#`. If your documentation scheme changes or adds extra markers, you'll need to update the script.
> - Excludes are hardcoded; you might want to make those configurable.
> - Only works for single-level excludes and extensions; if your structure grows more complex, consider allowing .gitignore-style rules.
> - No shebang checks: the script will match all files, not just scripts. Filtering by file extension or executable bit could improve accuracy.