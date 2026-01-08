# Toggle system performance profile (tuned + cpupower)

---

**toggle-performance.sh**: Toggle between tuned balanced and throughput-performance CPU profiles

---

### Dependencies

- `bash`
- `tuned-adm` (from `tuned`) — reads/sets the active tuned profile
- `cpupower` (from `linux-tools` / `cpupower`) — sets CPU frequency governor
- `sudo` — required to change tuned profile and governor
- `notify-send` (from `libnotify`) — desktop notification (handy in qtile)

### Description

This script toggles your machine between a “balanced” setup and a higher performance setup by switching:

1) the active **tuned** profile (`tuned-adm profile …`), and  
2) the **CPU frequency governor** (`cpupower frequency-set -g …`).

It detects the current tuned profile via:

- `tuned-adm active` and an `awk` filter that extracts the profile name.

If the current profile is `throughput-performance`, it switches to:
- tuned: `balanced`
- governor: `powersave`
- notification: “Switched to BALANCED”

Otherwise, it switches to:
- tuned: `throughput-performance`
- governor: `performance`
- notification: “Switched to THROUGHPERFORMANCE”

This is well-suited for a qtile keybinding since it’s non-interactive (aside from `sudo` authentication).

### Usage

Run from a terminal:

```sh
toggle-performance.sh
```

Typical qtile keybinding (example):

```python
Key([], "F12", lazy.spawn("toggle-performance.sh"))
```

If you want it to run without prompting, configure sudoers for the specific commands:

- `tuned-adm profile balanced`
- `tuned-adm profile throughput-performance`
- `cpupower frequency-set -g powersave`
- `cpupower frequency-set -g performance`

---

> [!TIP]
> **Potential improvements / issues**
> - The `awk '/Profile/{print $4}'` parse is a bit brittle if `tuned-adm active` output format changes; consider `tuned-adm active | sed -n 's/^Current active profile: //p'`.
> - If `tuned` isn’t running, `tuned-adm` may fail; you could add a check (or `systemctl is-active tuned`).
> - Governor choices (`powersave`/`performance`) may not match your CPU driver (e.g., `amd_pstate` vs `intel_pstate`); adding a fallback or detection would make it more portable.
> - If `notify-send` is run outside a graphical session, it will fail silently; consider guarding it (e.g., check `DISPLAY` / `WAYLAND_DISPLAY`).