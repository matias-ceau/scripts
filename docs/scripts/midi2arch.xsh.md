# MIDI to Arch Keyboard/Script Launcher

---

**midi2arch.xsh**: A script to transform a MIDI controller into a keyboard or script launcher.

---

### Dependencies

- `xonsh`: A shell language for Python 3.6+.
- `yaml`: Python library for YAML parsing.
- `aseqdump`: A utility to monitor MIDI events, used to detect MIDI device events.
- `xdotool`: A (commented) tool for simulating keyboard inputs.

### Description

This script is designed to transform MIDI input from a specific device, namely the `nanoKONTROL2`, into actions on an Arch Linux system with the qtile window manager. Configuration for the MIDI controls is loaded from a YAML file located at `~/.scripts/config/midi2arch/nanoKONTROL2.yaml`. The script detects the connected MIDI device and listens for control change (CC) messages. These messages can then trigger associated commands defined in the configuration file.

The `main` function is central to this script. It continuously reads MIDI events from the `aseqdump` output and matches these events to configurations, triggering the specified command when a control event reaches its maximum value (127). It terminates when a specific control change event (`cc == 39`) is read, signaling it to stop listening for events. 

### Usage

To execute this script, ensure it has executable permissions:

```bash
chmod +x /home/matias/.scripts/midi2arch.xsh
```

Run the script using xonsh:

```bash
xonsh /home/matias/.scripts/midi2arch.xsh
```

Flags:

- `-h`: Displays help information on usage.
- `-l`: Lists MIDI events without triggering any commands. This is useful for debugging or understanding the MIDI messages sent by the device.

Example:

To start translating MIDI inputs to commands, simply run:

```bash
xonsh /home/matias/.scripts/midi2arch.xsh
```

To list the events without performing actions:

```bash
xonsh /home/matias/.scripts/midi2arch.xsh -l
```

---

> [!NOTE] The script currently comments out sections for translating note events to keypresses with `xdotool`. For future enhancements, you might consider uncommenting these features or improving error handling. Additionally, it might be beneficial to expand this script to support other MIDI devices beyond just the `nanoKONTROL2`.