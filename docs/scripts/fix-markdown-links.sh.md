# Fix Markdown Links Script

---

**fix-markdown-links.sh**: A script to ensure that markdown links have consistent leading slashes for relative paths.

---

### Dependencies

- `bash`: The script is written in bash, which should be available on Arch Linux by default.
- `sed`: Utilized for processing and modifying text within files.

### Description

This script, `fix-markdown-links.sh`, is designed to standardize the format of markdown links within specified files or directories by ensuring that all relative links have a leading slash. This is particularly useful for maintaining uniformity and resolving potential issues when links are rendered or served from different environments.

The script functions by applying a regular expression with `sed` to identify markdown links that do not start with a slash (indicating a relative path) and modifying them to do so. It processes each file either individually or recursively if a directory is specified.

### Usage

The script takes two primary arguments:

1. `<base_dir>`: This should include a leading slash to denote the base directory for relativizing paths.
2. `<file or directory>`: The specific markdown file or directory containing markdown files to process.

#### Example

To process a single markdown file:

```bash
./fix-markdown-links.sh /base/dir /path/to/file.md
```

To process all markdown files within a directory:

```bash
./fix-markdown-links.sh /base/dir /path/to/directory
```

Note: The script must be executed with the correct number of arguments; otherwise, it will prompt an error and display the usage message.

---

> [!TIP]
> A potential improvement for the script is to include functionality for backing up the original files before modification, to prevent data loss in case of unexpected errors. Additionally, allowing users to optionally exclude certain directories or suffixes could make the script more versatile for various use cases. Adding logging capabilities could enhance the user's ability to audit and review changes made by the script.