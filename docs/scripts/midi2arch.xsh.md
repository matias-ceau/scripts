# MIDI Controller → Arch Launcher (nanoKONTROL2)

---

**midi2arch.xsh**: Map nanoKONTROL2 MIDI CC events to shell commands on Arch Linux

---

### Dependencies

- `xonsh` — executes the script and enables `@(cmd)` dynamic execution
- `python-pyyaml` (`yaml`) — loads the controller mapping from YAML
- `alsa-utils` (`aseqdump`) — reads raw MIDI events via ALSA sequencer
- A config file at `~/.scripts/config/midi2arch/nanoKONTROL2.yaml`

### Description

This Xonsh script turns a MIDI controller (currently hard-coded to **Korg nanoKONTROL2**) into a command launcher. It:

1. Loads a YAML configuration describing the MIDI device name and a set of control mappings.
2. Detects whether `nanoKONTROL2` is present via `aseqdump -l`.
3. Spawns `aseqdump -p <device>` and continuously reads MIDI lines from stdout.
4. Extracts **CC number** and **value** from each event line.
5. When a control change hits `val == 127` (typical “button press” max value), it looks up the matching control in `CFG['controls']` and executes the mapped command using Xonsh’s `@(cmd)`.
6. Special case: if `cc == 39`, the script terminates `aseqdump` and exits cleanly (“Bye”).

This is well-suited for qtile workflows: map knobs/buttons to scripts (launchers, audio routing, window actions, etc.) and keep the logic in YAML.

### Usage

Run interactively in a terminal (recommended while debugging mappings):

    midi2arch.xsh

List/dump MIDI events only (no commands executed):

    midi2arch.xsh -l

Help:

    midi2arch.xsh -h

Typical workflow:

- Start `-l`, press controls, note CC numbers
- Add/update entries in `~/.scripts/config/midi2arch/nanoKONTROL2.yaml`
- Run normally to execute commands on button presses (`val == 127`)

---

> [!TIP]
> Improvements to consider:
> - The CC/value parsing is brittle (depends on `aseqdump` output format); using regex or splitting more defensively would reduce exceptions.
> - `ctrl = ...; list(ctrl.values())[-1]` can crash if no mapping matches; handle “not found” explicitly.
> - `cc == 39` as a quit signal is magic; make it configurable in YAML.
> - Device detection is hard-coded to nanoKONTROL2 even though the YAML contains `general.name`; you could unify detection + selection using config first, fallback to autodetect.