# random_wallpapers.xsh

# Random Wallpaper Picker

This script picks a random wallpaper from a specified wallpaper directory and sets it as the desktop background.

## Script Functionality

1. **Locate Wallpaper Directory**:
    - The script sets the variable `folder` to the path where your wallpapers are stored, i.e., `/home/matias/./wallpapers`.

2. **List Wallpapers**:
    - It scans the folder to generate a list of files (`wallpapers`) that have the extensions `.png` or `.jpg`.

3. **Select Random Wallpaper**:
    - It selects a random wallpaper from the list using Python's `random.choice()` function.

4. **Set Wallpaper**:
    - Finally, it uses the `feh` program to set the selected wallpaper as the desktop background with the `--bg-scale` option.

## Dependencies

- **Xonsh**: The script is written to be run with the Xonsh shell.
- **feh**: The script uses the `feh` utility to set the background. Ensure `feh` is installed on your system.

## Usage

To use the script, simply run it from the command line:

```shell
./random_wallpaper_picker.xsh
```

Ensure the script has executable permissions:

```shell
chmod +x random_wallpaper_picker.xsh
```

## Customization

If you wish to change the directory of your wallpapers or include other image formats, modify these sections:

- Change the folder path:
    ```python
    folder = '/path/to/your/wallpapers'
    ```
- Include other image formats by adjusting the condition in the list comprehension:
    ```python
    wallpapers = [i for i in os.listdir(folder) if i.endswith(('.png', '.jpg', '.jpeg', '.gif'))]
    ```

## Example

In its current form, the script randomly selects and sets a wallpaper from the `/home/matias/./wallpapers` directory.

## Troubleshooting

- Ensure that the folder path is correct and that it contains `.png` or `.jpg` files.
- Verify that `feh` is installed and accessible from your command line.
- Make sure script permissions are correctly set to be executable.

## Author

**Matias**

## License

This project is licensed under the MIT License - see the LICENSE file for details.