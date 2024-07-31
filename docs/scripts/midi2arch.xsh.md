# MIDI to Arch Control (midi2arch.xsh)

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

- `xonsh` - A shell language that combines Python with shell features.
- `aseqdump` - A command-line utility for MIDI event monitoring.
- `yaml` - Python package for parsing YAML files.
- `xdotool` - A tool that simulates keyboard input and mouse activity.

<a name="description" />

### Description

<a name="overview" />

#### Overview

The `midi2arch.xsh` script allows you to transform MIDI controller inputs into keyboard events or script execution triggers within your Arch Linux environment using the Xonsh shell. It is particularly designed to handle the "nanoKONTROL2" MIDI controller, but can be adapted for other devices by changing the configuration file. MIDI controller actions are captured, translated, and can invoke corresponding keyboard inputs or shell commands.

The script reads a configuration file (`nanoKONTROL2.yaml`) located in the `~/.scripts/config/midi2arch/` directory, which defines mappings between MIDI control change messages and the actions to execute. The script supervises MIDI events and responds accordingly via `aseqdump`.

---

<a name="usage" />

#### Usage

To run the script, execute it from the terminal using the Xonsh shell:

```bash
./midi2arch.xsh
```

You can also use the `-l` flag to list MIDI events without triggering any actions:

```bash
./midi2arch.xsh -l
```

If you need to see help, the `-h` option outputs the usage instructions.

<a name="examples" />

#### Examples

- To start the script and capture MIDI events:
  ```bash
  ./midi2arch.xsh
  ```

- To list MIDI events only:
  ```bash
  ./midi2arch.xsh -l
  ```

---

<a name="notes" />

### Notes

- Ensure your MIDI device is connected and recognized by the system.
- The configuration file must specify the MIDI control mappings; otherwise, the script will exit with an error.
- If you modify the configuration file, make sure its structure aligns with the script's expected format.

> **Critique:** 
> The script is well-structured but contains commented-out sections that may confuse users. It is advisable to either eliminate these or provide clear explanations on their purpose. Additionally, increasing error handling surrounding device detection and subprocess management could enhance robustness and provide clearer diagnostics when issues arise.