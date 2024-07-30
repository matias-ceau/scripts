# vox.py

# Vox Amp Options Script Documentation

## Overview

This script, written in Python, is designed to list various Vox amp options, their modes, colors, and descriptions. It processes command-line arguments to display specific selections from a predefined DataFrame and formats the output in a tabulated manner for easy readability.

## Functionalities

### 1. Default Listing
When run without arguments, the script displays the entire list of Vox amp options with descriptions truncated to 40 characters.

### 2. Amp Selection by Index
By passing an index number as an argument, the script prints detailed information about the specific amp option corresponding to that index.

### 3. Filter by Color
The script can filter and display amp options based on the specified color (`'g'`, `'o'`, or `'r'`). The descriptions in the output are truncated to 40 characters.

### 4. Filter by Amp Name
The script can filter and display amp options based on the provided amp name. The descriptions in the output are truncated to 40 characters.

## Usage

### Command Line Interface

The script can be executed with several command line arguments to yield different outputs:

1. **No arguments**: Display the entire list with truncated descriptions.
   ```sh
   ./script_name.py
   ```

2. **Index number**: Display detailed information about the specific amp option at the provided index.
   ```sh
   ./script_name.py 3
   ```

3. **Color filter (`'g'`, `'o'`, `'r'`)**: Display amp options matching the specified color.
   ```sh
   ./script_name.py g
   ```

4. **Name filter**: Display amp options matching the provided amp name (case insensitive).
   ```sh
   ./script_name.py "VOX AC15"
   ```

### Example Outputs

1. **No Arguments**:
    ```
    ---  ----  ----  -------------  ----------------------------------------
    0    CLEAN STD   g             This models the clean channel of a high-qu
    1    CLEAN SPL   o             This models the clean channel of a Japanes
    2    CLEAN CST   r             This models is only a three-band tone cont
    3    CALI  STD   g             The 6G5-A “Pro” amp was produced during th
    4    CALI  SPL   o             This American-made tweed-covered 2x12" com
    ...
    ```

2. **Index Number (detail for index 3)**:
    ```
    ***************
    CALI CLEAN - STD
    Fender Pro 6G5-A Brownface
    ***************
    The 6G5-A “Pro” amp was produced during the years 1960–1963, and was distinctive for its yellowish brown vinyl cover and round brown knobs. This 40W combo amp is known for its warm and clean tone.
    ```

3. **Color Filter (`'g'`)**:
    ```
    ---  ----  ----  -------------  ----------------------------------------
    0    CLEAN STD   g             This models the clean channel of a high-qu
    3    CALI  STD   g             The 6G5-A “Pro” amp was produced during th
    6    US BL STD   g             This models a 4x10" combo amp from 1959 th
    9    US 2x STD   g             This models a black-faced 2x12" combo amp 
    ...
    ```

4. **Name Filter (`"VOX"`)**:
    ```
    ---  ----  ----  -------------  ----------------------------------------
    12   VOX  A STD   g             This models the AC15TB, which combines th
    13   VOX  A SPL   o             This models channel 2 of the VOX AC15 (1x
    14   VOX  A CST   r             Designed to emulate the tones of the thic
    15   VOX  A STD   g             This models an AC30 amp with a “top boost
    ...
    ```

## Required Libraries

- `pandas`
- `tabulate`
- `sys`

Make sure to install the necessary Python libraries before running the script. You can install them using pip:

```sh
pip install pandas tabulate
```

## Execution

- Ensure the script has executable permissions:
  ```sh
  chmod +x script_name.py
  ```
- Run the script with the desired arguments:
  ```sh
  ./script_name.py [arguments]
  ```

## Author

This script is authored to provide an easy interface to list and filter Vox amp options using a predefined dataset.