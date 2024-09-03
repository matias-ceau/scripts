# MIDI to Arch Keyboard Mapping Script

---

**midi2arch.xsh**: Transform a MIDI controller into a keyboard/script launcher.

---

### Dependencies

- `xonsh`: A shell designed for ease of use and power. This script utilizes its capabilities for running commands and managing arguments.
- `subprocess`: For spawning new processes, connecting to their input/output/error pipes, and obtaining their return codes.
- `yaml`: For reading configuration files in YAML format, allowing for easy structured data management.
- `aseqdump`: A utility for dumping MIDI events from MIDI ports. This is essential for capturing MIDI data.

### Description

This script enables a MIDI controller (specifically the nanoKONTROL2) to function as a keyboard or script launcher within an Arch Linux environment using the Xonsh shell. Upon execution, the script checks for the presence of the designated MIDI device and displays relevant information. 

The configuration details, such as MIDI control mappings, are loaded from a YAML file located at `~/.scripts/config/midi2arch/nanoKONTROL2.yaml`. The core functionality revolves around capturing MIDI events using `aseqdump` and mapping them to corresponding commands or keypresses.

The main components include:

- **Device Detection**: Identifies the connected MIDI keyboard and ensures it is the supported model.
- **Event Handling**: Listens for MIDI note events and translates them into keyboard commands using the settings defined in the configuration file.

### Usage

Execute the script from your terminal or bind it to a keyboard shortcut in your window manager. The usage format is as follows:

```shell
midi2arch.xsh [-l]
```

- `-l`: Lists MIDI events only without triggering any keypress outputs.

**Example Command**:
To run the script normally:

```shell
midi2arch.xsh
```

To list events available on your MIDI device:

```shell
midi2arch.xsh -l
```

---

> [!TIP]
> While the current implementation provides a solid foundation, consider refactoring to add error handling for missing configuration files or unclear mappings, particularly when the MIDI device configurations are incomplete. Additionally, the commented out sections for `trigger_key` and `translate_note` indicate potential future capabilities that should be fully implemented for improved functionality. Consider also adding logging mechanisms to track events or errors for debugging purposes.