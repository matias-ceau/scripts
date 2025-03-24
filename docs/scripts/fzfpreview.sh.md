# fzf File/Img Preview Utility

---

**/home/matias/.scripts/dev/fzfpreview.sh**: A script to preview text or images in the fzf preview window

---

### Dependencies

- `bat` or `batcat`: For syntax-highlighted previews of text-based files.
- `chafa`: To render images in the terminal using Sixel output.
- `imgcat`: For image preview support in iTerm2.
- `kitty`: Provides the `kitty icat` command for fast image rendering in the Kitty terminal.

### Description

This script enhances the fzf preview experience by dynamically determining whether the selected file is an image or a text file and displaying it accordingly. It begins by checking if exactly one argument is passed; if not, it outputs a usage message and exits. The script expands paths that use the tilde (`~`) and determines the MIME type using the `file` command.

For text files, if the file is non-binary, it attempts to use `bat` (or `batcat` if `bat` isn’t available) to display the file with syntax highlighting. When none of these commands are present, it falls back to `cat`.

For image files, the script calculates the appropriate dimensions for preview based on environment variables (`FZF_PREVIEW_COLUMNS` and `FZF_PREVIEW_LINES`). It then:
- Uses `kitty icat` if running in a Kitty terminal, ensuring the output is appropriately formatted to prevent scrolling issues.
- Falls back to `chafa` if available when not using Kitty.
- Finally, if `chafa` isn’t available but `imgcat` is present (typically on iTerm2), it employs `imgcat` to display the image.
- If all else fails, it defaults to the `file` command to give basic file information.

This multi-tool approach ensures a flexible and effective preview system, adapting to various environments and file types.

### Usage

Run the script with a single file as an argument. It is ideal for integration with fzf's preview options or as a standalone command.

Example usage:
   $ /home/matias/.scripts/dev/fzfpreview.sh /path/to/file

It can also be bound to a key in qtile for quick access to file previews during your development or file browsing sessions.

---

> [!TIP]
> Consider enhancing the robustness of the script by incorporating a check for terminal type using utilities like `it2check` for iTerm2 rather than assuming its usage based solely on available commands. Additional logging or error handling mechanisms could improve maintainability and debugging. Moreover, modularizing image preview methods into functions may further streamline future enhancements.