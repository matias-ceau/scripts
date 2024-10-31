# Vox Amplifier Options

---

**vox.py**: A script to list and describe Vox amplifier settings and modes.

---

### Dependencies

- `pandas`: Provides data manipulation and analysis (e.g., DataFrame).
- `tabulate`: Formats tabular data with ASCII tables for easy viewing.
- `sys`: Access system-specific parameters and functions.

### Description

The script **vox.py** is designed to display a list of various Vox amplifier models, offering relevant attributes such as the amplifier's name, mode, color designation, and a brief description. The amplifier information is stored within a `pandas.DataFrame` and presented through the `tabulate` library for easy, tabular viewing. 

This script is intelligent in its display options, showing either a truncated version of each amplifier's description by default or providing detailed information about a specific model when an index is given. It can filter amplifiers based on their color code (g, o, r) or by portions of the amplifier's name present in the command arguments.

### Usage

To execute this script, use the command line on your Arch Linux setup. No special permissions are needed unless read access is prohibited.

```bash
python /home/matias/.scripts/bin/vox.py
```
This will display a truncated list of all amplifier settings.

To see the details of a specific amplifier indexed in the list:
```bash
python /home/matias/.scripts/bin/vox.py 3
```

To filter amplifiers by color code:
```bash
python /home/matias/.scripts/bin/vox.py g
```

To filter by a part of the amplifier name, for instance, 'CLEAN':
```bash
python /home/matias/.scripts/bin/vox.py CLEAN
```

This script can be interlinked with your qtile keybindings, enabling faster access to the information without opening a terminal each time.

---

> [!TIP]
> Although the script is functional, for enhanced code readability and maintainability, consider refactoring repeated code segments into helper functions. Besides, adding more comprehensive error handling, especially when dealing with user inputs, could improve the script robustness. Additionally, including an option to view the full description without truncation might be desirable for in-depth information access.