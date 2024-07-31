# Dmenu Run User Scripts

---

**[dmenu_run_scripts.xsh](dmenu_run_scripts.xsh)**: A script to run user scripts via dmenu or rofi.

---

### Dependencies

- `xonsh`: A Python-powered shell that can be used as a flexible command-line interface.
- `rofi`: A window switcher, application launcher, and dmenu replacement that helps to display options for user interaction.
- `script_identifier.xsh`: A custom script (not provided) likely used to identify user scripts based on context and status.

### Description

This script is intended to facilitate the execution of predefined user scripts by integrating them with `dmenu` or `rofi`, allowing for a straightforward and efficient user interface. 

When the script is executed, it uses the `script_identifier.xsh` to gather script options characterized by their **status** and **type** (specifically focused on active scripts). The gathered options are presented in a visually formatted list using `rofi`. Each line is formatted to have the file name displayed in green followed by its description. When a user selects an option, the chosen script is executed.

The overall workflow involves:
1. Invoking `script_identifier.xsh` to fetch the scripts.
2. Presenting the list of available scripts using `rofi`.
3. Executing the selected script.

In more detail, the choice of script is extracted from the output of `rofi`, stripping unnecessary characters to retrieve the actual script filename, which is subsequently executed.

### Usage

To use this script, follow these steps:

1. Make sure that `xonsh` and `rofi` are installed on your system.
2. Ensure that `script_identifier.xsh` is accessible and functioning properly in your environment.
3. Execute the script directly from your terminal or bind it to a key combination in your `qtile` configuration.

Example command to execute the script:
```
chmod +x /home/matias/.scripts/dmenu_run_scripts.xsh
/home/matias/.scripts/dmenu_run_scripts.xsh
```
You can then select a script from the list that appears.

If you want to bind it to a key combination in Qtile, add the following to your configuration file:
```python
keys = [
    Key([mod], "r", lazy.spawn("/home/matias/.scripts/dmenu_run_scripts.xsh")),
]
```

---

> [!TIP] 
The script could benefit from error handling to ensure that it gracefully handles situations where no scripts are found or `script_identifier.xsh` encounters issues. Additionally, consider implementing logging for debugging purposes and user feedback, such as indicating the selected script was successfully started.
