# MIDI to Arch Control Script

---

**midi2arch.xsh**: Transform a MIDI controller into a keyboard/script launcher.

---

### Dependencies

- `xonsh`: A Python-based shell that extends the functionality of traditional shells.
- `subprocess`: A standard Python library for spawning new processes, connecting to their input/output/error pipes, and obtaining their return codes.
- `yaml`: A library for parsing YAML, used here to read the configuration file for MIDI controls.
- `aseqdump`: A MIDI event dumper from the `alsa-utils` package, required for listing MIDI events.
- `xdotool`: A command-line tool that simulates keyboard input and mouse activity.

### Description

The `midi2arch.xsh` script allows users to leverage a MIDI controller, specifically the `nanoKONTROL2`, as a keyboard input or script launcher on Arch Linux, using a `xonsh` environment. The current implementation reads MIDI events and executes corresponding commands defined in a YAML configuration file, enhancing the interactivity and utility of the MIDI device.

The script begins by loading the configuration file, which contains mappings of MIDI controls to commands. It checks for the presence of the `nanoKONTROL2` device and offers functionality to either output MIDI events or map those events to keyboard commands.

### Usage

To use the script, ensure the following steps:

1. **Configuration**: Create and configure `~/.scripts/config/midi2arch/nanoKONTROL2.yaml` with your MIDI controls and their corresponding commands.

2. **Execution**:
   - To execute the script normally, run:
     ```bash
     xonsh /home/matias/.scripts/midi2arch.xsh
     ```
   - To list MIDI events only (without executing any commands), run:
     ```bash
     xonsh /home/matias/.scripts/midi2arch.xsh -l
     ```

3. **Command Mappings**: Inside your YAML file, specify MIDI control changes that map to commands. The script will listen for these controls and execute commands correspondingly.

---

> [!TIP]  
> The script contains commented-out sections indicating planned future improvements, such as better handling for multiple devices and potential translations for different MIDI message types. These could enhance the code's flexibility and adaptability to different setups. Additionally, error handling could be expanded to avoid crashes during unexpected MIDI input. It's also recommended to maintain the YAML configuration outside the script for easier customization.