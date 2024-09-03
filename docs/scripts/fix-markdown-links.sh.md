# Fix Markdown Links

---

**fix-markdown-links.sh**: A script to convert markdown links to be relative to a specified base directory.

---

### Dependencies

- `sed`: A stream editor for filtering and transforming text, used here to modify markdown files.

### Description

The `fix-markdown-links.sh` script is designed to process one or multiple markdown files, adjusting their links to ensure that they are relative to a specified base directory. When invoked, the script can handle both single markdown files and entire directories containing markdown files. 

The core functionality is implemented in the `process_file` function, which utilizes the `sed` command to update the links:

- It searches for markdown links that do not begin with a leading slash and adds that slash, making them absolute relative to the specified base directory.

### Usage

To use the script, you need to invoke it from the terminal with two arguments: the base directory and the target markdown file or directory. Here’s the general command format:

```bash
./fix-markdown-links.sh <base_dir> <file or directory>
```

- **`<base_dir>`**: The absolute base directory which the links will reference (must start with a `/`).
- **`<file or directory>`**: The markdown file (ending in `.md`) or directory that contains markdown files to process.

#### Examples

1. To process a single markdown file:

```bash
./fix-markdown-links.sh /home/user/project /home/user/project/docs/readme.md
```

2. To process all markdown files in a directory:

```bash
./fix-markdown-links.sh /home/user/project /home/user/project/docs/
```

---

> [!TIP]  
> While the script effectively adds the leading slash to the links, it assumes all links are relative without additional checks, which may not cover malformed cases. Consider expanding the regex to handle edge cases, such as links containing paths that already start with a slash or other formatting issues. It may also be beneficial to implement a dry-run mode that allows users to see the changes that would be made before modifying the files.