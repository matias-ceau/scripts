# toggle_picom.sh

# Picom Control Script

This script checks if the `picom` compositor is running on your system. If it detects that `picom` is running, it will stop the `picom` process. If `picom` is not running, it will start the `picom` process in the background.

## Description

The script performs the following actions:
1. Checks if the `picom` process is running using the `pgrep` command.
2. If `picom` is running, it will output a message indicating that `picom` is running and then stop the process using the `pkill` command.
3. If `picom` is not running, it will output a message indicating that `picom` is not running and then start the `picom` process in the background using the `picom -b` command.

The script ensures that you can easily control the running state of the `picom` compositor with a simple command.

## Usage

```bash
./picom_control.sh
```

### Example

To execute the script, navigate to the directory containing the script and run:

```bash
chmod +x picom_control.sh
./picom_control.sh
```

### Output

- If `picom` is running:
  ```
  Picom is running. Stopping picom...
  ```
- If `picom` is not running:
  ```
  Picom is not running. Starting picom...
  ```

## Notes

- Ensure the script has executable permissions. You can set this using the `chmod +x` command as shown in the example usage.
- The script uses `pgrep` to search for the `picom` process by name and `pkill` to stop it if it is running.
- The `picom -b` command starts the `picom` process in the background.

This script provides a simple and efficient way to manage the `picom` compositor without manually checking and restarting the process.