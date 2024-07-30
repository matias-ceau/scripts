# midi2arch.xsh

---

Transform a midi controller to a keyboard/script launcher

---

### Table of contents

- [Dependencies](#dependencies)
- [Description](#description)
    - [Overview](#overview)
    - [Usage](#usage)
    - [Examples](#examples)
- [Notes](#notes)

---

<a name="dependencies" />

### Dependencies

- Xonsh shell
- `aseqdump` command from the ALSA-utils package
- YAML configuration file (see below)
- `xdotool` (commented out in the script but may be useful for key triggering)

<a name="description" />

### Description

<a name="overview" />

#### Overview

The `midi2arch.xsh` script is designed to transform a MIDI controller—specifically the "nanoKONTROL2"—into a keyboard/script launcher utilizing Xonsh. By reading input events from the MIDI device, the script triggers predefined actions based on control changes. The configuration details are stored in a YAML file, allowing for flexible mappings between MIDI inputs and corresponding commands in your Arch Linux environment.

The script begins by checking the presence of the MIDI device and can output MIDI events without triggering any keypresses when run with the `-l` option. It processes input through the `aseqdump` tool, and prints control change information to the console. 

--- 

<a name="usage" />

#### Usage

To run the script, navigate to its directory and execute:

```bash
./midi2arch.xsh [options]
```

**Options:**
- `-h`: Displays help and usage information.
- `-l`: Lists MIDI events only; no keypresses will be triggered.

Make sure to have `aseqdump` available and properly configured for your MIDI device. The script can be easily integrated into your workspace, potentially binding it to a key in your window manager (Qtile).

<a name="examples" />

#### Examples

- Run the script normally to launch your configured commands:
```bash
./midi2arch.xsh
```

- List events without triggering any actions:
```bash
./midi2arch.xsh -l
```

---

<a name="notes" />

### Notes

1. The script expects a YAML configuration file located at `~/.scripts/config/midi2arch/nanoKONTROL2.yaml`. Be sure to have this file correctly formatted with the necessary control mappings.
2. Error handling could be improved for more robust operation, especially around subprocess calls.

> **Critique:** 
> The commented-out sections indicate that `xdotool` was considered but is not currently implemented. To enhance functionality, consider reactivating the `trigger_key` and `translate_note` methods to facilitate direct keypress simulation based on MIDI input. Moreover, providing user feedback or logs when a MIDI signal is processed could improve debugging and usability in a live setting.