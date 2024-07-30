# midi2arch.xsh

# Midi Arch Control Documentation

## Overview

This script transforms a MIDI controller into a keyboard and script launcher. It was inspired by the works of Fippls industries inc. (2019) and further developed by Matias Ceau in 2024.

## Description

The script detects a specific MIDI device and interprets its control changes (CC) to execute predefined keyboard shortcuts or scripts. The configuration for the controls and the MIDI device is loaded from a YAML file located in the user's home directory.

## Usage

### Basic Usage

```bash
./midi_to_keyboard.xsh
```

### Options

- `-h`: Display help and usage information.
- `-l`: List MIDI events without triggering any actions.

## Prerequisites

- `xonsh` shell
- `aseqdump` (usually part of the ALSA tools)
- `yaml` module for Python
- `xdotool` (for simulating keyboard input, uncomment and adjust relevant code as needed)

## Configuration

Configuration is loaded from `~/.scripts/config/midi2arch/nanoKONTROL2.yaml`. Ensure this file exists and is properly formatted. The configuration file should define the MIDI controller name and the actions associated with various control change (CC) messages.

## Script Functionalities

### Device Detection

The script scans for the MIDI device defined in the configuration file (default to "nanoKONTROL2") and confirms its presence before proceeding.

```python
def detect_midi_keyboard(keyboard):
    return $(aseqdump -l | grep @(keyboard) | wc -l)

if detect_midi_keyboard("nanoKONTROL2") != 0:
    print("Found nanoKONTROL2!")
    DEVICE = "nanoKONTROL2"
else:
    print("Found no supported MIDI devices!")
    exit(1)
```

### MIDI Event Listening

If the `-l` option is provided, the script lists the MIDI events from the detected device without performing any actions.

```python
if len($ARGS) > 0 and $ARGS[0] == "-l":
    print("Dumping events only, no keypresses will be reported")
    aseqdump -p @(DEVICE)
    exit(0)
```

### Main Functionality

The main part of the script continuously reads MIDI events from the detected device and acts upon specific control change (CC) messages. Actions are defined in the YAML configuration file.

```python
def main(config_file):
    device = config_file['general']['name']
    controls = config_file['controls']
    process = subprocess.Popen(['aseqdump','-p',device],
                                stdout=subprocess.PIPE,
                                stderr=subprocess.PIPE,
                                text=True)
    while True:
        output = process.stdout.readline()
        if output:
            try:
                cc = int(output.split(',')[1].split(' ')[-1])
                val = int(output.split(',')[-1].split(' ')[-1])
                print(cc,val)
                if cc == 39:
                    process.terminate()
                    process.wait()
                    print("Bye")
                    break
                if val == 127:
                    ctrl = {k : (a,c,d) for k,(a,b,c,d) in controls.items() if int(b) == cc}
                    cmd = list(ctrl.values())[-1][-1]
                    print(cmd)
                    @(cmd)
            except Exception as e:
                print(e)

main(CFG)
```

### Future Considerations

Commented sections suggest potential future enhancements, such as more sophisticated event translation or different methods for reading MIDI events.

## Author

Matias Ceau (2024)

Inspired by Fippls (2019)

## License

This project is licensed under the MIT License. See the LICENSE file for more details.

## Acknowledgments

Thanks to Fippls industries inc. for the initial inspiration in 2019.

---

Feel free to report issues or contribute to this script via the [GitHub repository](#).