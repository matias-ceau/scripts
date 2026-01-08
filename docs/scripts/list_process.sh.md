# List running services (sorted)

---

**list_process.sh**: List systemd services (all states) sorted by unit file state

---

### Dependencies

- `systemctl` (systemd): lists units/services
- `sort` (coreutils): sorts output by a chosen column

### Description

This script is a small wrapper around `systemctl list-units` meant to quickly display systemd *service* units on your Arch Linux setup without paging or extra headers.

What it does:

- Queries **all service units** (including inactive/failed) via:
  - `--type=service` to restrict to services
  - `--all` to include non-running units
- Produces a clean, script-friendly output:
  - `--no-pager` avoids launching `less` (good for qtile keybindings)
  - `--no-legend` removes the header/legend
- Sorts the resulting lines using `sort -k4`, i.e. by the 4th whitespace-separated field. For `systemctl list-units`, this typically corresponds to the **UNIT FILE STATE** column (e.g. `enabled`, `disabled`, `static`) depending on systemd version/output format.

This is useful when you want a fast “inventory” view of what services exist and how they’re configured, especially when diagnosing startup behavior (enabled vs disabled) on an Arch system.

### Usage

Run in a terminal:

    ~/.scripts/bin/list_process.sh

Common patterns:

- Quick view (pipe to a pager yourself):

    ~/.scripts/bin/list_process.sh | less

- Filter for enabled services:

    ~/.scripts/bin/list_process.sh | grep -E '\benabled\b'

- Show only failed units (note: sorting may hide them in the middle):

    ~/.scripts/bin/list_process.sh | grep -E '\bfailed\b'

- Assign to a qtile keybinding (spawn a terminal command), e.g.:

    alacritty -e ~/.scripts/bin/list_process.sh

---

> [!TIP]
> Consider renaming the script to reflect systemd (e.g. `list_services.sh`), since it does not list “processes”. Also, `sort -k4` relies on the exact column layout of `systemctl`; for robustness you could use `systemctl list-unit-files --type=service` (explicitly about enablement) or specify sorting with `systemctl` options where available. Adding `--state=running` would match “running services” if that’s the intent.