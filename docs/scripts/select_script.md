# select_script (select_script)

---

A script that selects a chosen script using cached data displayed in Rofi.

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

- C compiler (e.g., gcc)
- Rofi (for the dmenu interface)
- A cache file located at `~/.cache/script_info.csv` that contains script information

<a name="description" />

### Description

<a name="overview" />

#### Overview

`select_script` is a C program designed to facilitate the selection and execution of scripts stored in the user's `.scripts` directory. It relies on a CSV cache file that holds the names and descriptions of scripts, allowing users to select from these scripts using a visually appealing Rofi interface. 

The main components of the script include:

- **Loading Cache**: Reads the script information from a defined cache file and populates an array of `ScriptInfo` structures.
- **Displaying Options**: Presents the user with script options using Rofi's dmenu style interface, allowing selection via keyboard input.
- **Executing Scripts**: Upon selection, the chosen script is executed in the specified script directory.

---

<a name="usage" />

#### Usage

1. Ensure you have a CSV cache file located at `~/.cache/script_info.csv` that follows the expected format.
2. Compile the script using a C compiler, e.g., `gcc select_script -o select_script`.
3. Run the script from a terminal: `./select_script`.
4. Use the arrow keys or type to filter options, then press Enter to execute the selected script.

<a name="examples" />

#### Examples

- Running `./select_script` will show a Rofi dialog with available script options.
- Selecting a script labeled "echo_hello" will execute `~/.scripts/echo_hello`.

---

<a name="notes" />

### Notes

Ensure that Rofi is correctly installed and configured on your system for optimal performance. The cache file must be in the correct format, or the script may not load properly.

> **Critique**: 
>
> - The script lacks error handling for scenarios such as an empty cache file or malformed CSV entries. It would be beneficial to provide user feedback in these cases.
> - It currently assumes that scripts are executable and in the correct format. Consider checking for execute permission before attempting to run a script.
> - The hard-coded CSV and script directory paths could be made configurable for increased flexibility.