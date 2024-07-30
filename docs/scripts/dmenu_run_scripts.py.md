# dmenu_run_scripts.py

# Script Documentation: A sort of dmenu_run

This script is a CLI tool that allows a user to select and execute a command from a list of choices generated by another script. Similar in concept to `dmenu_run`, it streamlines the process of executing predefined commands.

## Functionality Overview

1. **Generate Choices**
   - The script first generates a list of choices by executing another script (`script_identifier.xsh`) using `xonsh`.
   - A set of parameters is passed to `script_identifier.xsh` to filter and format the outputs.
   - The choices are received in a formatted string, which is passed to the next step.

2. **Display Choices with Rofi**
   - The script uses `rofi` to present the list of choices to the user in a menu.
   - `rofi` is configured to display the choices in a specified format (`-markup-rows`), with 30 lines and a width of 80 units.

3. **Extract and Execute the Selected Choice**
   - The user's selection from `rofi` is parsed to extract the command.
   - The script then executes the selected command using a subprocess call.

## Script Breakdown

```python
#!/usr/bin/python

import subprocess

# Generate the choices using xonsh
choices = subprocess.run(
    ['xonsh', 'script_identifier.xsh', '-c', 'TYPE=RUN', 'HOST', 'STATUS=active', 'OK', '-f', '"<span color=\'green\'>{FILE:<30}</span> \u27F6   {DESCR}"', '-s', 'FILE'],
    capture_output=True, text=True
).stdout

# Display the choices using rofi
rofi_output = subprocess.run(
    ['rofi', '-dmenu', '-markup-rows', '-i', '-lines', '30', '-width', '80'],
    input=choices, capture_output=True, text=True
).stdout

# Extract the selected choice
choice = rofi_output.split('>')[1].split('<')[0].strip()

# Execute the selected choice
subprocess.run([choice])
```

### Prerequisites

- **xonsh:** Ensure `xonsh` is installed on your system. It is used to run `script_identifier.xsh`.
- **rofi:** Ensure `rofi` is installed for the graphical menu interface.

### Run the Script

Make the script executable and run it from the terminal:
```bash
chmod +x path_to_script.py
./path_to_script.py
```

### Notes

- This script assumes that `xonsh`, `script_identifier.xsh`, and `rofi` are correctly configured and available in the system's PATH.
- Ensure that the `script_identifier.xsh` script produces output in the expected format for correct functioning.

### Troubleshooting

- **No Choices Displayed:** Verify that `script_identifier.xsh` is generating the expected output by running it independently.
- **Command Execution Error:** Ensure the correct command is selected and that it is executable.

### Future Enhancements

- Add error handling for subprocess calls.
- Modify the script to handle different formats and additional parameters dynamically.

This script is marked as `$in_progress$`, and enhancements or modifications may be made to improve its functionality.