# Fix Markdown Links Script

---

**fix-markdown-links.sh**: Adjust relative paths in markdown links to start from a base directory

---

### Dependencies

- `bash`: This script requires the Bash shell to execute.
- `sed`: Utilized for modifying file content.
- `find`: Used to locate markdown files within a directory.

### Description

The **fix-markdown-links.sh** script is designed to process markdown files and prepend a leading slash to relative links, ensuring they start from a specified base directory. This script will be particularly useful when restructuring projects where the markdown files are moved under a new directory hierarchy, or when you need uniform link formatting across multiple files.

The script uses the `sed` command to search and replace link patterns without a leading slash, adding one where necessary. It takes two arguments: a base directory and either a markdown file or a directory containing markdown files.

Once executed, the script reads all markdown files, either directly or recursively through directories, adjusts the links, and confirms each processed file.

### Usage

To execute the script:

```bash
$ ./fix-markdown-links.sh /base/directory /path/to/markdown/file/or/directory
```

- **\<base_dir\>**: The base directory to which markdown links should be relative.
- **\<file or directory\>**: The markdown file or the directory containing markdown files. 

For example, if you want to process all markdown files under `/home/matias/projects` and make the links relative to `/home/matias`:

```bash
./fix-markdown-links.sh /home/matias /home/matias/projects
```

The script will adjust the links and confirm processing by outputting each file name.

---

> [!NOTE]
> The script assumes that links not starting with a slash are meant to be file-relative links, which may not always be the case. It is designed specifically for the scenario where markdown files need links adjusted to a new consistent base directory. Be cautious with different link types or structures that might not fit this assumption. Future improvements could include complex path restructuring or more flexible link pattern matching.