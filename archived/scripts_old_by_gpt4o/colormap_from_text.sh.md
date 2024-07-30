# colormap_from_text.sh

# Extract Color Palettes Script

> **Simple script that extracts color palettes from config files**

This script processes input to extract color codes and optionally formats them in various output styles. It reads hex color codes, converts them to RGB where necessary, and provides several display options.

## Usage

```sh
./script.sh [-x|--hex-code] [-r|--rgb] [-c|--color]
```

### Options

- `-x`, `--hex-code`: Output the color codes in hex format (e.g., `#ff5733`).
- `-r`, `--rgb`: Output the color codes in RGB format (e.g., `rgb(255, 87, 51)`).
- `-c`, `--color`: Display the color followed by a background colored block for a visual preview.

### Notes

- The options `-x`/ `--hex-code` and `-r`/ `--rgb` are mutually exclusive and cannot be used together.
- The script reads color codes from the input, so you need to provide the input (e.g., a config file containing hex color codes).

### Examples

#### Extract and Display Hex Codes

```sh
cat config.file | ./script.sh -x
```

#### Extract and Display RGB Codes

```sh
cat config.file | ./script.sh -r
```

#### Extract and Display Color Codes With a Color Block

```sh
cat config.file | ./script.sh -c
```

#### Extract and Display RGB Codes With a Color Block

```sh
cat config.file | ./script.sh -r -c
```

## Script Details

### Functionality

- **Hex Code Extraction:** The script uses `grep` to find and extract all unique hex color codes (`#[0-9a-fA-F]{6}`) from the input.
- **Conversion to RGB:** If the `--rgb` option is used, the script converts hex codes to RGB values.
- **Color Display:** If the `--color` option is used, the script outputs a visual representation of the color.

### Input Flow

1. The script reads input (typically from a file) which contains color codes.
2. It processes each line to extract hex color codes using `grep`.
3. Depending on the options provided, it:
   - Outputs the hex codes directly.
   - Converts the hex codes to RGB and outputs the RGB values.
   - Optionally displays a colored block beside the color values for a visual preview.

### Example Input

A configuration file (`config.file`) may contain lines like:

```
background: #ff5733;
foreground: #33ff57;
border: #3357ff;
```

When processed with the script, the output will depend on the options chosen.

## Error Handling

- If incompatible options `-x` and `-r` are used together, the script outputs an error and shows the usage message.

## Author

Generated on 2024-07.