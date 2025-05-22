# MIDI Controller to Script Launcher

---

**midi2arch.xsh**: Transform a MIDI controller into a script/keyboard command launcher for Arch

---

### Dependencies

- `xonsh`: Required shell to interpret the script.
- `python-yaml`: For parsing the YAML configuration file.
- `aseqdump`: MIDI event monitoring utility.
- `xdotool` *(commented, not currently used)*: For simulating keypress events.
- `nanoKONTROL2` (or compatible MIDI controller): The script is designed for this device.
- User config file: `~/.scripts/config/midi2arch/nanoKONTROL2.yaml` – Describes MIDI event to command mappings.

---

### Description

This script enables mapping physical controls on a MIDI device (such as nanoKONTROL2) to arbitrary shell commands or keypresses on an Arch Linux system, specifically for use with the qtile window manager workflow.

**How It Works:**
1. **Device Detection:**  
   The script looks for attached MIDI controllers, specifically `nanoKONTROL2`. If not found, it exits.
2. **Configuration:**  
   Reads control mappings from a YAML config file located at `~/.scripts/config/midi2arch/nanoKONTROL2.yaml`. This file defines which controller control triggers which shell command or action.
3. **Listening Loop:**  
   Spawns `aseqdump` as a subprocess to listen for real-time MIDI events.  
   - When a specific control-change message with value `127` is detected, the mapped command is executed via xonsh interpolation.
   - Receiving control `cc == 39` (hardcoded) will terminate the listener.
4. **Event Listing Mode:**  
   If run with the `-l` flag, dumps all MIDI events to stdout for mapping discovery or debugging (no commands are triggered).

---

### Usage

**Basic:**

```sh
midi2arch.xsh
```
- Connect your MIDI controller (nanoKONTROL2).
- Press controls as mapped in your YAML config, and the corresponding shell commands will run.

**Event Listing (debug/discover mode):**
```sh
midi2arch.xsh -l
```
- Just prints MIDI events as received.
- Useful for mapping controls in your YAML.

**Add to qtile or WM keybindings:**
- Can be run at login or via a specific keybinding in your qtile config.
- Background usage is typical for real-time response.

**YAML Mapping Config Example:**
```yaml
general:
  name: nanoKONTROL2
controls:
  play_button: ["button_play", 41, "Pressed", "playerctl play"]
  stop_button: ["button_stop", 42, "Pressed", "playerctl stop"]
```

---

> [!IMPORTANT]
> - **Error Handling:** The script currently parses MIDI messages in a brittle way (fixed CSV position, lacks robust MIDI spec parsing). It may break on unexpected event lines.
> - **Limited Device Support:** Only recognizes `nanoKONTROL2` explicitly; others would require code edits and a proper extension of detection logic.
> - **Security:** Executing arbitrary commands from a YAML file can be a risk; ensure your config file is secure.
> - **Graceful Exit:** Hardcoded control (cc==39) for exit is not flexible; make this configurable for broader device support.
> - **Enhancements:** Use async subprocess and full MIDI parsing library for robustness. Add more CLI options and config validation.