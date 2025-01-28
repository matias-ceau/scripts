# Test Input Handling Script

---

**test.sh**: A script to handle input from standard input (stdin) or provide a default message if no input is given.

---

### Dependencies

- `bash`: A Unix shell and command language required to interpret the script.

### Description

The script checks for the presence of standard input (stdin) and conditionally processes it. If stdin is detected (`-t 0` returns false), it reads from stdin line by line and outputs each line. Otherwise, it displays a default message to standard output (stdout).

**Key Features:**
- **Check for stdin**: The `[ ! -t 0 ]` condition ensures the script knows whether it is receiving piped input.
- **Loop through input**: The `while read line` block reads and processes each line of stdin.
- **Fallback behavior**: When no stdin is provided, the script outputs "no stdin heres stdout".

### Usage

This script can be run interactively or in the context of a pipeline.

#### Example 1: Piped Input
```bash
echo "Hello, World!" | /home/matias/.scripts/dev/test.sh
```
**Output**:
```
Hello, World!
```

#### Example 2: No stdin
```bash
/home/matias/.scripts/dev/test.sh
```
**Output**:
```
no stdin heres stdout
```

#### Example 3: Multi-line Input
```bash
cat <<EOF | /home/matias/.scripts/dev/test.sh
Line 1
Line 2
Line 3
EOF
```
**Output**:
```
Line 1
Line 2
Line 3
```

---

> [!NOTE]
> - The script could benefit from improved error handling (e.g., handle unexpected input formats gracefully).
> - While the script checks for stdin, it does not support additional functionality beyond echoing lines or providing a fallback message. More utility or configurable behavior could make it more versatile.
> - If the intent is broader than testing stdin functionality, additional comments or a description within the script could clarify its use case.