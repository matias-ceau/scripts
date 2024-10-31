# MIDI to Arch Keyboard/Script Launcher

---

**midi2arch.xsh**: Transform a MIDI controller into a keyboard or script launcher for Arch Linux

---

### Dependencies

- `xonsh`: A Python-powered shell needed to run this script.
- `subprocess`: Standard Python library used for running external programs.
- `yaml`: Python library for parsing YAML configuration files.
- `aseqdump`: ALSA utility for displaying MIDI events (must be available on your system).
- `xdotool` (commented in script): A tool to simulate keyboard input and mouse activity.

### Description

This script allows you to transform your `nanoKONTROL2` MIDI controller into a powerful tool for launching scripts or simulating keyboard shortcuts on your Arch Linux system, particularly within the qtile window manager environment. The script reads a YAML configuration file stored at `~/.scripts/config/midi2arch/nanoKONTROL2.yaml`, which specifies mappings of MIDI control changes to specific commands.

The script first checks for the presence of the `nanoKONTROL2` device using the `aseqdump -l` command. It listens to MIDI events from the connected device, translates them based on the provided configuration, and executes the corresponding command when the specified control changes occur.

### Usage

To use the script, run it in a `xonsh` shell environment:

```shell
xonsh /home/matias/.scripts/bin/midi2arch.xsh
```

- To list MIDI events without executing commands, use the `-l` argument:

```shell
xonsh /home/matias/.scripts/bin/midi2arch.xsh -l
```

Make sure your `nanoKONTROL2` configuration is correctly set up in the YAML file. The script will print the control change (cc) and its value (val) for each detected event.

---

> [!NOTE]
> There are a few parts of the script which appear to be commented out, such as functions for triggering key presses with `xdotool`. If you plan to implement these, ensure `xdotool` is installed and functioning correctly on your system.
> 
> Additionally, consider implementing exception handling for error messages to provide more user-friendly output. Moreover, some constants like device names could be parameterized to improve flexibility and scalability. Another improvement could be the continuation of execution when encountering an unsupported device instead of exiting out immediately.