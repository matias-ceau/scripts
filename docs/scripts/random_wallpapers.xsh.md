# Random Wallpaper Picker

---

**[random_wallpapers.xsh](random_wallpapers.xsh)**: Pick a random wallpaper from a specified directory

---

### Dependencies

- `feh`: A lightweight image viewer that can set desktop wallpapers. Ensure it is installed to apply the selected wallpaper.
- `xonsh`: A Python-powered shell that combines the capabilities of Python with a shell interface.

### Description

This script is designed to randomly select a wallpaper from a specified directory containing images (either .png or .jpg formats) and set it as the desktop background using the `feh` image viewer. 

The script begins by importing necessary libraries (`os` and `random`). It specifies the wallpaper directory:
```python
folder = '/home/matias/./wallpapers'
```
It then generates a list of all image files in that directory, filtering only for files that end in `.png` or `.jpg`. 

```python
wallpapers = [i for i in os.listdir(folder) if i[-3:]=='png' or i[-3:]=='jpg']
```
The script currently includes commented-out code for using `dmenu` to allow user selection, but defaults to a random selection from the filtered list:
```python
selection = random.choice(wallpapers)
```
Finally, it applies the chosen wallpaper using `feh` with the `--bg-scale` option, which scales the image to fit the screen.

### Usage

To run this script, simply execute it within the terminal or bind it to a key in your window manager, qtile, for quicker access. Here’s how to execute it:
```bash
chmod +x /home/matias/.scripts/random_wallpapers.xsh  # Make the script executable
/home/matias/.scripts/random_wallpapers.xsh           # Run the script to change the wallpaper
```

To bind it in qtile, you can add the following line to your config:
```python
Key([mod], "w", lazy.spawn("/home/matias/.scripts/random_wallpapers.xsh")),
```

---

> [!TIP]  
> Consider implementing error handling in case the wallpaper directory is empty or if `feh` fails to set the wallpaper. You could also include options to allow for different image formats without hardcoding the file extensions, and potentially include a feature to exclude currently set wallpapers from the selection. This would enhance usability and robustness.
