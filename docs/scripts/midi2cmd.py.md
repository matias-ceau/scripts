# MIDI Controller CLI (amidi helper)

---

**midi2cmd.py**: List/test/monitor ALSA MIDI controllers and print messages (raw/parsed)

---

### Dependencies

- `python` (run via `uv` shebang)
- `uv` (because of `#!/usr/bin/env -L uv python`)
- `python-click` (CLI framework)
- `alsa-utils` (`amidi` for listing and reading devices)

### Description

`midi2cmd.py` is a small Click-based CLI to inspect and sanity-check MIDI controllers on Arch using ALSA’s `amidi`. It builds a name → device-id mapping by parsing `amidi -l`, then exposes three subcommands:

- **list**: prints every controller detected by `amidi`, along with its `hw:<id>` address.
- **test**: attempts a short read (`amidi -d -t 0.1`) against the selected controller to confirm it’s accessible.
- **monitor**: reads MIDI data and outputs either:
  - `raw`: the unprocessed `amidi` output
  - `parsed`: a minimal decoder for common 3-byte messages (Control Change, Note On, Note Off)

The controller argument is optional and defaults to `nanoKONTROL2`, which matches your “MIDI controller to keyboard/script launcher” workflow (e.g., quick probing before wiring events into qtile keybindings or an external mapper).

### Usage

```sh
midi2cmd.py --help
midi2cmd.py list
```

Test a specific device:

```sh
midi2cmd.py test nanoKONTROL2
midi2cmd.py test "Your Controller Name"
```

Monitor raw bytes (good for discovery):

```sh
midi2cmd.py monitor nanoKONTROL2
midi2cmd.py monitor "Your Controller Name" --mode raw
```

Monitor with basic decoding:

```sh
midi2cmd.py monitor nanoKONTROL2 --mode parsed
```

> [!TIP]
> `monitor` currently uses `subprocess.run()`, which waits for `amidi` to exit; in practice you’ll want streaming (`subprocess.Popen` + incremental reads) so it behaves like a real live monitor and can be stopped cleanly with Ctrl-C. Also, the CLI command name `list` shadows Python’s built-in `list` and then gets used in an error message in `monitor`, which is confusing—rename the command function (e.g., `list_cmd`) and import `builtins.list` if needed. Finally, parsed mode assumes each output line is a clean hex triplet; `amidi` output formats can vary, so a more robust parser (or `aseqdump`) may be more reliable.