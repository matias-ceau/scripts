# Xephyr + Qtile Testing Harness

---

**xephyr.sh**: Launches a nested X session with Xephyr, running a development Qtile instance.

---

### Dependencies

- `Xephyr`: Lightweight nested X server, part of the `xorg-server-xephyr` package.
- `python3`: Required for launching Qtile and (optionally) for guessing the terminal emulator.
- `qtile`: Should be installed; script assumes development inside or near the qtile source tree.
- `libqtile.utils`: Used by the helper line for terminal guessing.
- `$APP` (your terminal, like `alacritty`, `urxvt`, etc.): Automatically detected but can be overridden.
- `readlink`, `dirname`, `sleep`, `env`, `wait`, `kill`: Standard UNIX utilities.

---

### Description

This script is a developer utility for quickly spawning a testing instance of your (possibly modified) Qtile window manager within a Xephyr nested X server. This workflow is very handy for Arch Linux users who want to test configuration changes, experiment with Qtile development, or debug their Qtile setup—without interfering with their primary running X session.

#### Key points:
- **Screen and Display**: Customizable with `SCREEN_SIZE` (default: 800x600) and `XDISPLAY` (default: :1).
- **Terminal Launch**: Attempts to detect your preferred terminal, or will use one you specify with `$APP`.
- **Qtile Logging**: Set `LOG_LEVEL` environment variable to control verbosity (default: `INFO`).
- **Isolation**: The script launches Qtile under the nested server and starts your terminal. When the Qtile session ends, Xephyr is killed—cleaning up automatically.

#### Flow:

1. Launches Xephyr.
2. Starts a Qtile test instance with the same configuration as your real session.
3. Spawns a terminal inside the nested X session.
4. Tears down everything when done.

---

### Usage

You will usually run this from a terminal; it's interactive and best *not* bound to a keyboard shortcut (due to cleanup requirements).

Basic usage:
```
$ ~/.scripts/dev/xephyr.sh
```

To specify a screen size or display number:
```
$ SCREEN_SIZE=1280x720 XDISPLAY=:2 ~/.scripts/dev/xephyr.sh
```

To run Qtile with debug logging:
```
$ LOG_LEVEL=DEBUG ~/.scripts/dev/xephyr.sh
```

To override the terminal used inside the session:
```
$ APP=alacritty ~/.scripts/dev/xephyr.sh
```

To pass extra arguments to `qtile start`:
```
$ ~/.scripts/dev/xephyr.sh --some-qtile-option
```

---

> [!TIP]
> **Possible Improvements:**
> - The script assumes Qtile's `start` binary is available at `../bin/qtile` relative to the script, which is brittle; consider a more flexible lookup.
> - No check if required programs (`Xephyr`, Qtile, terminal) are installed—adding basic dependency checks could make the tool friendlier.
> - `sleep 1` may be insufficient on some systems for Xephyr to initialize; consider a more robust "wait for display ready" mechanism.
> - Arguments after the script are passed only to `qtile start`, not Xephyr or the terminal. Make this explicit in documentation, or add more flexible argument parsing.
> - No error handling for background process termination; if Qtile or the terminal crashes, Xephyr may remain orphaned.
> - On modern Arch instals, you may want to explicitly use `python` or `python3`. The `PYTHON` variable can be set to suit, but clarify its need and defaults and possibly fallback better if neither are available.