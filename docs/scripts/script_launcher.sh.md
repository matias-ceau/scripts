# Interactive Script Launcher (fzf + previews)

---

**script_launcher.sh**: Browse and run your `$SCRIPTS` with fzf, previews, and quick edit actions

---

### Dependencies

- `bash`
- `fzf` (or your wrapper `improved-fzfmenu.sh`): interactive picker UI
- `fd`: enumerates scripts under `$SCRIPTS`
- `ripgrep` (`rg`): extension detection (`.sh`, `.py`, `.xsh`, …)
- `bat`: preview renderer (source + markdown docs)
- `pastel`: converts Flexoki hex colors to ANSI (`ansi-24bit`)
- `realpath`
- `nvim`: quick edit action
- `which`: resolves selected command path
- `../lib/env.sh`: provides `load_env` and your `colors` variables (Flexoki palette)
- User scripts used via bindings:
  - `terminal_with_command.sh`
  - `nvim_in_new_terminal.sh`
  - `improved-fzfmenu.sh` (when not embedded)

---

### Description

`script_launcher.sh` is a Qtile-friendly “command palette” for your personal scripts directory. It lists executable files found under `$SCRIPTS`, decorates them with colored icons based on extension, and feeds the list into fzf.

The picker defaults to previewing the script *source* via `bat $(which {2})`, but can toggle to preview its documentation (`$SCRIPTS/docs/scripts/{2}.md`). It also offers multiple execution/edit workflows:

- run directly in the current shell (`enter`)
- run in a new terminal window (`alt-enter`)
- edit in the current terminal (`ctrl-e`)
- edit in a new terminal (`alt-e`)

The `--embedded/-E` flag switches from your terminal wrapper (`improved-fzfmenu.sh`) to plain `fzf` (useful when already inside a terminal).

---

### Usage

Run normally (spawns your fzf terminal wrapper):

    script_launcher.sh

Run “embedded” inside an existing terminal:

    script_launcher.sh --embedded
    script_launcher.sh -E

Key bindings inside fzf (as shown in the header):

- `enter`: execute selected script
- `alt-enter`: execute in new terminal (via `terminal_with_command.sh`)
- `ctrl-e`: open script in `nvim`
- `alt-e`: open `nvim` in a new terminal
- `alt-d`: preview documentation markdown
- `alt-s`: preview source again

---

> [!TIP]
> Consider making the docs preview more robust: `{2}.md` assumes doc filenames match exactly the displayed “basename”. If two scripts share a name in different subdirs, or if selection isn’t on `$PATH`, `which {2}` may fail. Using the resolved `fd --absolute-path` result for both source and docs (and passing it through fzf as an extra field) would remove ambiguity. Also, `cmd-full-path` currently forwards only one argument (`"$2"`); switching to `"$@"` would make it future-proof for multi-arg actions.