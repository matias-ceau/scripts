# dmenu_run_scripts.xsh

# Run User Scripts with Dmenu

This script allows users to run their scripts by selecting them through a graphical menu powered by `dmenu`. The script leverages `dmenu` to provide an interactive and user-friendly interface for script selection.

## Script Overview

- **Interpreter**: The script uses the `xonsh` shell.
- **Primary Functionality**: It runs user scripts that are filtered based on certain criteria.
- **User Interface**: Utilizes `dmenu` through `rofi` to display and choose scripts.

## Detailed Functionality

1. **Gather Script Choices**:
   - The script calls an external command `script_identifier.xsh` with specific parameters for filtering the list of scripts.
   - **Filtering Criteria**:
     - `TYPE=RUN`
     - `HOST`
     - `STATUS=active`
     - `OK`
   - The results are formatted with the following placeholder:
     ```html
     <span color='green'>{FILE:<30}</span> ➦ {DESCR}
     ```
   - The `choices` variable holds the filtered list of scripts.

2. **Display Script Choices**:
   - The filtered script choices are piped to `rofi`, which acts as `dmenu`.
   - **Rofi Options**:
     - `-dmenu`: Turns `rofi` into dmenu mode.
     - `-markup-rows`: Enables markup for row formatting.
     - `-i`: Makes the search case-insensitive.
     - `-lines 30`: Sets the number of lines to display.
     - `-width 80`: Sets the width of the menu.

3. **Parse User Selection**:
   - The user's selection is processed to extract the script file name.
   - The selection string splits around the `>` and `<` characters and trims any leading/trailing whitespace.
   - The extracted script file name is stored in the `choice` variable.

4. **Execute the Selected Script**:
   - The selected script is executed using `@(choice)`.

## Usage

To run this script, ensure that you have the `xonsh` shell installed and `rofi` available on your system. Execute the script in your terminal to bring up the selection menu:

```bash
./run_user_scripts.xsh
```

Select a script from the menu to execute it.

## Example Command

The following example command demonstrates how the script identifier might be called to filter and format the script choices:

```bash
script_identifier.xsh -c TYPE=RUN HOST STATUS=active OK -f "<span color='green'>{FILE:<30}</span> ➦ {DESCR}" -s FILE
```

## Dependencies

- **xonsh**: Required to run the script.
- **rofi**: Serves as the graphical dmenu interface.

## Notes

- Make sure that your scripts are properly labeled and active to be listed in the choices.
- Customize the `-lines` and `-width` options in the `rofi` command to suit your screen size and preferences.

## License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.

## Author

[Your Name] - [Your Contact Information]

---

Thank you for using this script! If you encounter any issues or have suggestions, please open an issue on the project's GitHub page.