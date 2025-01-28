# Wrapper Script

---

**wrapper.sh**: A simple script to execute a command and log its execution with a timestamp.

---

### Dependencies

- ``bash``: Required to run this script as it uses Bash-specific syntax.
- Write access to `/data/data/com.termux/files/home/log.txt`: The log file location should be writable; ensure the directory exists.

---

### Description

The **wrapper.sh** script is a minimal utility to execute a command while logging its execution. The workflow is straightforward: 
1. It takes a command (with its arguments) as input.
2. Executes the command.
3. Logs the command and its UNIX timestamp into a predefined file: `/data/data/com.termux/files/home/log.txt`.

It’s particularly useful for debugging or tracking usage patterns of commands. Also, it enforces a 1-second delay after execution using a `sleep` command.

**Note:** In its current form, the script assumes that the log file path `/data/data/com.termux/files/home/log.txt` exists and is writable.

---

### Usage

This script needs to be executed via the terminal. To use it:

```bash
bash /home/matias/.scripts/dev/wrapper.sh <command> [arguments]
```

For example:

```bash
bash /home/matias/.scripts/dev/wrapper.sh ls -la
```

This will:
1. Execute `ls -la`.
2. Append its execution log (with the current timestamp in seconds) to the log file at `/data/data/com.termux/files/home/log.txt`.
3. Sleep for 1 second.

If you intend to use this script frequently, you can set it up as an alias in your `.bashrc`:

```bash
alias wrapper='/home/matias/.scripts/dev/wrapper.sh'
```

Then, use it directly:

```bash
wrapper ls -la
```

---

> [!CAUTION]
> - The script does no error handling. If the directory `/data/data/com.termux/files/home/` or the log file does not exist, or the script lacks write permissions, it will fail silently. Consider adding checks to ensure the log file exists and is writable.
> - As it directly executes any passed command using `$@`, there is a potential risk when input is not sanitized, leading to unintended execution (e.g., malicious command injection). Input validation might be worth considering.
> - Hardcoded paths like `/data/data/com.termux/files/home/log.txt` lower flexibility and portability. Parameterizing the log file path would enhance usability.