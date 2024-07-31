# MIDI to Arch Keyboard Controller Transformation

---

**[midi2arch.xsh](midi2arch.xsh)**: A script to transform a MIDI controller into a keyboard/script launcher 

---

### Dependencies

- `xonsh`: A Python-powered shell that makes shell scripting easy and features extensive enhancements for interactive use.
- `subprocess`: A module in Python that allows you to spawn new processes, connect to their input/output/error pipes, and obtain their return codes.
- `yaml`: A Python library for working with YAML, a human-readable data serialization format, used here to read configuration files.
- `aseqdump`: A command-line utility to dump MIDI events, which is necessary for reading input from MIDI controllers.
  
### Description

This script allows you to utilize a MIDI controller (specifically the nanoKONTROL2) as an input device to trigger keyboard commands and launch scripts in an Arch Linux environment. Inspired by previous work from Fippls, it utilizes `aseqdump` to gather MIDI input, processes this input, and can translate certain MIDI commands to keyboard shortcuts.

The script expects a YAML configuration file located at `~/.scripts/config/midi2arch/nanoKONTROL2.yaml`. This configuration file should define the mappings for MIDI controls to corresponding keyboard commands.

The core functions of the script include:

- **Device Detection**: Checks for the availability of the specified MIDI device.
- **Event Listening**: Listens for MIDI input and triggers corresponding keyboard commands.
- **Configuration Loading**: Loads configuration mappings to determine which keyboard commands correspond with which MIDI signals.

### Usage

To use the script, make sure your MIDI device is connected and the corresponding configuration file is properly set up.

You can run the script directly via terminal:

```bash
chmod +x /home/matias/.scripts/midi2arch.xsh
/home/matias/.scripts/midi2arch.xsh
```

The script supports the following command-line arguments:

- `-h`: Show help information.
- `-l`: List MIDI events only, with no keyboard trigger output.

Example command to list MIDI events:

```bash
/home/matias/.scripts/midi2arch.xsh -l
```

The script will output messages when certain MIDI controls are triggered, and it can terminate upon receiving a specific MIDI command (`cc == 39`).

---

> [!TIP]  
The current implementation includes commented-out sections that might suggest future extensions or alternative functionality. Consider cleaning up the codebase by either integrating these features or removing them to enhance readability and maintainability. Additionally, error handling could be improved for robustness, ensuring that specific exceptions are caught and logged correctly while maintaining the script's operation.
