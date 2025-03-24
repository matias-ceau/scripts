# MIDI Controller Command Converter

---

**midi2cmd.py**: Transforms MIDI controller input into keyboard/script commands

---

### Dependencies

- `click`: For command-line interface management.
- `amidi`: Utilized for MIDI device interactions.

---

### Description

This Python script acts as a MIDI controller management tool designed for Arch Linux environments running qtile. It provides a command-line interface (CLI) with three core functionalities:

1. **Listing Controllers**: The script can list all connected MIDI controllers by invoking `amidi -l` to retrieve available devices. The controllers are parsed using Python's `shlex` to create a mapping between controller names and device IDs.

2. **Monitoring MIDI Input**: The `monitor` command allows you to continuously watch MIDI messages from a specified controller (default is "nanoKONTROL2"). In 'raw' mode, it simply relays the output from `amidi`; in 'parsed' mode, it interprets common MIDI messages such as Control Change, Note On, and Note Off, displaying them in a more human-friendly format.

3. **Testing Controller Connection**: The `test` command briefly engages a specified MIDI controller to verify its accessibility. It uses a short timeout with `amidi -t 0.1` to confirm that communication is established, providing immediate visual feedback on whether the controller is working properly.

The `click` library simplifies command definition and error handling. Custom error messages inform you if a controller is not found, and the tool outputs usage instructions if invoked lacking proper context. The script is intended to be executed from a terminal and can be bound to keys within your qtile configuration for quick access.

---

### Usage

To list available MIDI controllers, run:
  
  $ midi2cmd.py list

For monitoring MIDI messages in raw mode (default):

  $ midi2cmd.py monitor

Or in parsed mode:

  $ midi2cmd.py monitor --mode parsed

To test a controller (default is nanoKONTROL2):

  $ midi2cmd.py test

You can replace the default controller by specifying its name as an argument in either monitor or test commands.

---

> [!TIP]  
> Consider adding exception handling for subprocess errors and refining MIDI message parsing for broader controller compatibility. Additionally, improving the parsing logic to cater for variable MIDI message lengths could enhance the script's versatility. Consider logging capabilities to capture long-term device input data for further analysis.