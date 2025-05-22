# Simple Bash Command Wrapper

---

**wrapper.sh**: Wraps execution of any command, logs invocation with timestamp.

---

### Dependencies

- `bash`: Required to run the script.
- Any command you wish to wrap.
- The path `/data/data/com.termux/files/home/log.txt` must be writable.[footnote:On typical Arch Linux systems, this path is used by Termux on Android. Make sure it is adjusted for your environment.]
- `date`: Used to generate timestamps.
- `sleep`: Used for a 1-second delay at the end of the script.

### Description

This script serves as a transparent wrapper around any command you wish to run. It performs the following steps:

1. Executes the provided command line exactly as given.
2. After completion, logs the current UNIX timestamp along with the invoked command to a log file at `/data/data/com.termux/files/home/log.txt`.
3. Pauses for one second (`sleep 1`) before exiting.

It is particularly useful if you want a simple way to trace or audit temporary command executions (for development, debugging, or learning purposes). 

#### Structure

- `$@` : Expands to all arguments given to the script—this means it will directly run whatever full command you provide.
- `echo "$(date '+%s') - $@" >> /data/data/com.termux/files/home/log.txt"` : Appends a log entry with the current date (as epoch seconds) and the command.
- `sleep 1` : Waits for one second at the end. This gives you a moment to see command output (helpful if run in a terminal window that closes quickly).

### Usage

The script can be run directly, given executable permissions, or called from other scripts, wrappers, or keybindings. You can use it with any command, passing the wrapped command as arguments.

**Examples:**

```bash
# Make the script executable (once only)
chmod +x /home/matias/.scripts/dev/wrapper.sh

# Run 'ls -l' and log the invocation
/home/matias/.scripts/dev/wrapper.sh ls -l

# Run an editor, e.g., nano on a file
/home/matias/.scripts/dev/wrapper.sh nano test.txt
```

**Tip:**  
Integrate with Qtile keybindings by calling this script from your configuration — especially for any command whose calls you want to audit!

---

> [!WARNING]  
> The script hardcodes the log file path to a Termux-specific location (`/data/data/com.termux/files/home/log.txt`). On Arch Linux or a desktop environment, this path likely doesn’t exist and may cause errors or fail silently. Consider parameterizing the log file location to make this script portable across devices and environments. Also, this script does not handle any errors from the wrapped commands—it will only execute and log regardless of success or failure; capturing exit status might make logs more informative. Finally, be cautious when running commands with sensitive data, as everything is logged in plain text.