# Vox Amp Options List (vox.py)

---

List various Vox amp options and their descriptions.

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

- Python 3
- pandas
- tabulate

<a name="description" />

### Description

<a name="overview" />

#### Overview

This script provides a concise list of Vox amplifier options, utilizing a pandas DataFrame to hold information on various amp models. Each amp is characterized by its name, mode, color, model name, and a brief description. The tabulated information can be filtered based on user input, allowing users to find amplifiers by categories such as name, color, or an index number. The script employs the `tabulate` library to format its output in a human-readable table format.

- **Data Structure**: The amp options are encapsulated in a pandas DataFrame with the following columns:
  - `name`: The name of the amp model.
  - `mode`: The operational mode of the amp.
  - `color`: A color code associated with the amp.
  - `amp_name`: The specific model name of the amplifier (if applicable).
  - `description`: A summary introduction of the amplifier's sound and characteristics.


---

<a name="usage" />

#### Usage

To utilize the script, run it from the command line interface. The main usage pattern is as follows:

1. Without arguments: Display a list of all Vox amp options with short descriptions.
2. By index number: Provide an index number to retrieve specific details of that amp option.
3. By color: Use color codes (g, o, r) to filter amps by their associated color.
4. By name search: Type in part of the amp name for a filtered search.

Example command:
```bash
python3 vox.py
python3 vox.py 5
python3 vox.py g
python3 vox.py "CLEAN"
```
This allows flexibility for users to get specific information or explore the wide array of attributes related to Vox amplifiers.

<a name="examples" />

#### Examples

- Display all Vox amps:
  ```bash
  python3 vox.py
  ```
- Get details of a specific amp by index (e.g., index 3):
  ```bash
  python3 vox.py 3
  ```
- List amps of a specific color (green):
  ```bash
  python3 vox.py g
  ```
- Search for amps by name:
  ```bash
  python3 vox.py "CLEAN"
  ```

---

<a name="notes" />

### Notes

- Make sure the `pandas` and `tabulate` libraries are installed. You can install them using `pip`:
  ```bash
  pip install pandas tabulate
  ```

> **Critique**: 
> - The script could benefit from error handling for inputs that do not correspond to valid indexes or colors to prevent crashes.
> - Adding more flexible search options, such as case-insensitive searches, could enhance user experience.
> - Incorporating a help command to guide users on how to correctly use the script would improve usability significantly.