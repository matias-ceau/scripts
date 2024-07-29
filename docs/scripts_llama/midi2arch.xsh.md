# midi2arch.xsh

**Script Overview**

This script is a MIDI controller to keyboard/script launcher, inspired by Fippls Industries Inc. It transforms a MIDI device into a keyboard or script launcher using the `aseqdump` tool.

**Functionality**

The script performs the following tasks:

1. **Device Detection**: The script checks for available MIDI devices and prioritizes them based on their names.
2. **Config File Loading**: The script loads a YAML configuration file (`midi2arch/nanoKONTROL2.yaml`) that defines the mapping between MIDI controls and keyboard or script commands.
3. **Event Dumping**: If the `-l` option is provided, the script dumps all events from the detected MIDI device without triggering any keypresses.
4. **Main Loop**: The script enters a main loop where it reads output from `aseqdump`, processes it, and triggers corresponding keyboard or script commands based on the configuration file.

**Key Features**

* Supports multiple MIDI devices with prioritization
* Loads YAML configuration file for mapping MIDI controls to keyboard or script commands
* Dumps events without triggering keypresses (with `-l` option)
* Processes output from `aseqdump` and triggers corresponding commands in a main loop

**Script Structure**

The script is divided into several sections:

1. **Importing Libraries**: The script imports necessary libraries, including `subprocess`, `yaml`, and `os`.
2. **Device Detection**: The script defines a function to detect MIDI devices and prioritizes them based on their names.
3. **Config File Loading**: The script loads the YAML configuration file and assigns it to the `CFG` variable.
4. **Main Loop**: The script enters a main loop where it reads output from `aseqdump`, processes it, and triggers corresponding keyboard or script commands.

**Notes**

* The script assumes that the `aseqdump` tool is installed and available on the system.
* The YAML configuration file (`midi2arch/nanoKONTROL2.yaml`) defines the mapping between MIDI controls and keyboard or script commands. This file needs to be updated based on the specific requirements of the project.
* The script uses a simple string matching approach to determine which command to trigger based on the output from `aseqdump`. This may need to be modified depending on the specific use case and the format of the output from `aseqdump`.