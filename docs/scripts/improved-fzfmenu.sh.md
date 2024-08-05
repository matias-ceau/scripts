# Improved FZF Menu with Alacritty

---

**improved-fzfmenu.sh**: A script to launch FZF in Alacritty with command-line arguments.

---

### Dependencies

- `fzf`: A command-line fuzzy finder that can be used with various input sources.
- `alacritty`: A GPU-accelerated terminal emulator that provides a fast environment to run terminal applications.

### Description

The `improved-fzfmenu.sh` script enhances the usability of the `fzf` fuzzy finder by launching it in a new Alacritty terminal window. This approach is useful for situations where you want to easily navigate or select entries within the fuzzy finder interface, leveraging the visual capabilities of Alacritty.

When run, the script takes any command-line arguments provided and prepends them with escape characters to ensure proper handling. These arguments, intended for FZF, are then passed to the FZF command within a new Alacritty terminal context. The FZF tool reads input from the standard input, which in this case is piped from the current process's file descriptor.

### Usage

To use the script, invoke it with any arguments that you want to pass to FZF. The typical usage pattern is as follows:

```bash
./improved-fzfmenu.sh --bind 'enter:accept' --no-info < your_input_source
```

Where `your_input_source` might be a list of files, commands, or any data stream that FZF can process.

#### Example
```bash
cat file_list.txt | ./improved-fzfmenu.sh --bind 'ctrl-c:abort'
```

This command will take the contents of `file_list.txt`, pass them to the `fzf` interface launched in Alacritty, and allow the user to select entries with the configured key bindings.

---

> [!TIP]  
> One potential improvement for this script would be to include an option to customize the terminal title or color scheme via command-line arguments, making it more versatile for different workflows. Additionally, ensuring proper error handling for the FZF execution would enhance user experience.