# MIDI2CMD Python Utility

---

**midi2cmd.py**: Manage and monitor MIDI controller input and test connections from the terminal

---

### Dependencies

- `python` (tested with standard Python 3)
- `click` (`pip install click`) — CLI framework for building commands and options
- `amidi` (provided by `alsa-utils` on Arch Linux) — Command-line MIDI device tool
- `shlex` and `subprocess` — Standard Python libraries (no extra install needed)

---

### Description

This script provides a convenient terminal interface to interact with MIDI controllers connected to your system, primarily designed for use on your Arch Linux system with `qtile` window manager. 

Core capabilities:
- **List available MIDI controllers** (device names and device IDs)
- **Monitor MIDI messages** from a selected controller, in `raw` or parsed/human-readable mode
- **Connection test** to verify if a controller device is accessible

**Command Overview:**
- Uses the `amidi` tool for device interrogation and message monitoring
- Offers a CLI via the robust `click` Python package
- Default controller is set to `nanoKONTROL2` if none specified

**Highlights:**
- Parsed monitoring mode provides simple decoding (`Control Change`, `Note On`, `Note Off`) for common MIDI messages
- Helpful output on missing controllers and incorrect usage
- Functions portably as a terminal tool, well-suited for integration with keybindings or scripts in your `qtile` setup

---

### Usage

```
# List all connected MIDI controllers
$ midi2cmd.py list

# Monitor MIDI messages (raw mode, default controller nanoKONTROL2)
$ midi2cmd.py monitor

# Monitor a specific controller by name in parsed mode
$ midi2cmd.py monitor MyController --mode parsed

# Test connection to nanoKONTROL2
$ midi2cmd.py test

# Test connection to another controller by name
$ midi2cmd.py test MyController
```

You can assign script invocations to `qtile` keybindings for advanced MIDI-triggered workflows. For persistent monitoring or scripting, run in a terminal or assign to an autostart script with desired arguments.

---

> [!TIP]
>
> - The script currently only interprets a subset of MIDI messages (3-byte standard ones) in parsed mode, so System Exclusive or SysRealtime messages will appear as `Unknown messages`. For robust controller mapping/automation, you might extend the parsing logic or add script execution on certain MIDI events.
> 
> - The use of `run` for monitoring MIDI input means it will block until process exit and does not handle continuous streaming efficiently; for real-time usage consider a subprocess with event-driven or line-by-line output handling.
> 
> - Default controller name (`nanoKONTROL2`) is hardcoded; you might want to make this configurable or load from a preferences file.
> 
> - Only basic error handling: If `amidi` is missing or ALSA MIDI isn't available, errors may not be friendly.
> 
> - Shebang includes `-L uv` which may not be universally supported; ensure your environment supports this or replace with a simple Python shebang.
