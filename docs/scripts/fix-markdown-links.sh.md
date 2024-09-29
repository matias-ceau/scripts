# Fix Markdown Links

---

**fix-markdown-links.sh**: Fixes markdown links to be relative based on a specified base directory.

---

### Dependencies

- `sed`: A stream editor used for parsing and transforming text, essential for modifying markdown links.

### Description

The `fix-markdown-links.sh` script is designed to adjust links in markdown files to ensure they are relative to a specified base directory. This is particularly useful when moving markdown files around or when setting up documentation for different directory structures. The key functionality of the script includes:

- **Link Processing**: It uses `sed` to identify links in the format `[text](url)` and ensures that URLs missing a leading slash are modified to include one. This helps maintain link integrity when working with relative paths.

- **Directory Handling**: The script is flexible, allowing users to specify either a single markdown file or an entire directory containing multiple markdown files. If a directory is specified, the script will recursively find all `.md` files and process each one.

### Usage

To use the script, you need to specify:
1. A base directory with a leading slash.
2. A target which can either be a markdown file or a directory.

Here is how you can run the script from the terminal:

```bash
./fix-markdown-links.sh /path/to/base_directory /path/to/markdown_file.md
```

Or for a directory of markdown files:

```bash
./fix-markdown-links.sh /path/to/base_directory /path/to/directory/
```

If the correct number of arguments is not provided, or if they are empty, the script will output an error message and display the correct usage.

---

> [!TIP]  
> The script currently only ensures that links without a leading slash are updated. It may be beneficial to create a backup of the markdown files before processing them to avoid accidental data loss. Additionally, consider adding functionality to handle links that might already have a leading slash or check for other types of problematic links.