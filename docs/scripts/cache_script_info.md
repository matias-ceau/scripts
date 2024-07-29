# cache_script_info

**Script Overview**

This is a C program that extracts metadata from non-binary scripts (i.e., text files) in a specified directory and writes the information to a CSV file. The script uses a custom data structure (`ScriptInfo`) to store the extracted metadata.

**Functionality**

Here's a step-by-step breakdown of what the script does:

1. **Setup**: The program sets up some constants for the script directory and cache file paths.
2. **`extract_info` function**:
	* Opens a script file in read mode.
	* Initializes the `ScriptInfo` structure with default values.
	* Reads the first three lines of the file (to skip any header comments).
	* If the third line starts with "#DOC#", it extracts metadata from that line and populates the `ScriptInfo` structure accordingly:
		+ Type: CLI or RUN if present in metadata, otherwise OTH.
		+ Status: deprecated or in_progress if present in metadata.
		+ Host: extracts a hostname from the metadata (if present).
		+ Date: sets to the last modified date of the file (if not present in metadata). If the file doesn't exist, it defaults to 2000-01.
		+ Tag: extracts a tag from the metadata (if present).
	* Returns the `ScriptInfo` structure.
3. **`update_cache` function**:
	* Opens the script directory and cache file in write mode.
	* Writes the CSV header line to the cache file.
	* Iterates through all files in the script directory, skipping non-regular files (e.g., subdirectories).
	* For each regular file:
		+ Extracts metadata using `extract_info`.
		+ If metadata is present, writes a CSV line to the cache file with the extracted information.
4. **`main` function**:
	* Retrieves the HOME environment variable and uses it to construct the script directory path.
	* Ensures the data directory exists (if not, creates it).
	* Calls `update_cache` to generate the cache file.

The resulting CSV file contains metadata for each non-binary script in the specified directory. The structure of the CSV file is:
```csv
file,type,status,host,date,tag,description
```
Each row represents a single script, with columns containing the extracted metadata.