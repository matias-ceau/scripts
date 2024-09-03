# Random Wallpapers Selector

---

**random_wallpapers.xsh**: Pick random wallpaper from a specified wallpaper list

---

### Dependencies

- `xonsh`: A Python-powered shell that allows you to run Python code directly in the shell.
- `feh`: An image viewer that sets desktop wallpaper in Linux.
- `dmenu` (optional): A dynamic menu for X; helps in interactive selection of wallpapers. 

### Description

This script is designed to randomly select a wallpaper from a specified folder and set it as the desktop background. It utilizes the `xonsh` shell for scripting, making it easy to integrate Python code seamlessly with shell commands.

The script operates by:

1. Importing the necessary modules (`os` for file handling and `random` for random selection).
2. Defining the directory containing wallpapers (`/home/matias/.wallpapers`).
3. Creating a list of wallpapers in the specified directory with extensions `.png` and `.jpg`.
4. Using `random.choice()` to select one wallpaper at random.
5. Setting the chosen wallpaper as the desktop background using `feh --bg-scale`.

The commented-out section that uses `dmenu` offers an alternative interactive method to choose a wallpaper, allowing the user to select from the list visually.

### Usage

To use the script, ensure it is executable and run it directly in an X session. Here's how to do it:

1. Make the script executable (if not done already):
   ```bash
   chmod +x /home/matias/.scripts/random_wallpapers.xsh
   ```

2. Execute the script:
   ```bash
   /home/matias/.scripts/random_wallpapers.xsh
   ```

You can also bind this script to a keybinding in qtile or any window manager to change wallpapers quickly.

---

> [!TIP]  
> The script does not currently handle cases when the wallpapers folder is empty, which may cause errors. Consider adding a check to inform the user if there are no wallpapers to select from, or provide a default value. Additionally, you might want to restore the `dmenu` section to allow interactive selection, giving users more flexibility.