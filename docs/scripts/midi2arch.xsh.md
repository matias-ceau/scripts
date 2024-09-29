# MIDI to Arch Controller

---

**midi2arch.xsh**: Transform a MIDI controller into a keyboard/script launcher

---

### Dependencies

- `xonsh`: A Python-powered shell that provides an extension of the typical shell capabilities.
- `subprocess`: A Python module for launching and interacting with subprocesses.
- `yaml`: A Python library for YAML parsing, used for configuration management.
- `aseqdump`: A tool to display MIDI events.
- `xdotool`: A utility that simulates keyboard input and mouse activity.

### Description

This script is designed to facilitate MIDI controller integration with Arch Linux setups, allowing MIDI inputs to trigger keyboard actions or launch scripts. Written in `xonsh`, it detects a specified MIDI device (in this case, the `nanoKONTROL2`) and translates its output into actionable keypress commands.

The script reads from a YAML configuration file located at `~/.scripts/config/midi2arch/nanoKONTROL2.yaml`, which defines control mappings. Upon receiving MIDI input, the script runs an event loop to process these inputs, mapping specific MIDI control changes (CC messages) to key commands.

Key functions in the script include:

- **`detect_midi_keyboard(keyboard)`:** Checks if the specified MIDI device is connected.
- **`main(config_file)`:** The main logic that processes MIDI inputs and triggers corresponding actions based on the configuration.

### Usage

To use the script, navigate to the directory where it is located and run:

```bash
midi2arch.xsh
```

If you need to list available MIDI events without triggering any key actions, use the command:

```bash
midi2arch.xsh -l
```

For more information on usage, you can call:

```bash
midi2arch.xsh -h
```

This will display the help message detailing arguments and options available.

---

> [!TIP]  
> The current version of the script has commented-out sections that suggest further development opportunities. Consider implementing the functionality to trigger keypresses for additional MIDI control messages or refining error handling mechanisms for greater robustness. Adding more extensive documentation directly within the script would also enhance usability for future users or contributors.