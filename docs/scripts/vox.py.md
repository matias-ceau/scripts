# Vox Amplifier Options Script

---

**vox.py**: Python script to list and filter Vox amplifier options.

---

### Dependencies

- `pandas`: Used for data manipulation and handling tabular data efficiently.
- `tabulate`: Utilized to print data in a nicely formatted table.
- `sys`: A Python standard library used for reading command-line arguments.

### Description

This script provides a command-line utility to list various Vox amplifier options. It utilizes a pandas DataFrame to store and organize amplifier data, which includes name, mode, color, amplifier name, and description of the model. With the aid of the `tabulate` library, the script outputs the data in a readable table format.

The script accepts command-line arguments to filter the amplifiers:
- Running the script with no arguments will output a shortened description for all amplifiers.
- A numeric argument will display detailed info for the amplifier at that index.
- A color code ('g', 'o', 'r') argument filters amplifiers by the specified color.
- Any other string will attempt to filter amplifiers by name, showing a truncated description.

### Usage

Run this script from the terminal on your Arch Linux system:

```bash
python /home/matias/.scripts/vox.py
```
This command lists all amplifiers with a shortened description.

```bash
python /home/matias/.scripts/vox.py 3
```
This returns detailed information for the amplifier at index 3. Ensure that the number provided is within the bounds of the DataFrame's index.

```bash
python /home/matias/.scripts/vox.py g
```
Filters and lists all amplifiers with the color code 'g'.

```bash
python /home/matias/.scripts/vox.py CLEAN
```
Displays all amplifiers with 'CLEAN' in their name, with descriptions truncated to 40 characters.

---

> [!NOTE]
> While the script effectively manages data via a DataFrame and tabulates it, there's a hardcoded data structure which may not scale well for modifications. You might consider importing these options from an external file or database for more dynamic behavior. Additionally, add error handling for potentially unexpected inputs, such as handling out-of-range index values or invalid input types.