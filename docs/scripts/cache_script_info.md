# cache_script_info

# Script Metadata Extractor

This repository contains a script that extracts the metadata of non-binary scripts from a specified directory and outputs a CSV file with the relevant details.

## Description

The script scans through a directory containing script files, extracts specific metadata embedded within these scripts, and generates a CSV file containing this metadata. The metadata includes details such as file name, type, status, host, date, tag, and description.

## Metadata Format

The script looks for metadata in the following format:

```
#DOC#=YYYY-MM=@TYPE@ "Description"
```

### Supported Metadata Fields:
- `=YYYY-MM=`: Date when the script was created.
- `@TYPE@`: Type of the script (e.g., `@CLI@`, `@RUN@`, `@OTH@`).
- `"Description"`: Short description of what the script does.
- Additional keywords:
  - `$deprecated$`: Denotes that the script is deprecated.
  - `$in_progress$`: Indicates that the script is in progress.
  - `~host~`: Specifies the host (default is "all").
  - `+tag+`: Custom tags associated with the script.

## Output Example

The output CSV file will have the following columns:
- `file`: The filename of the script.
- `type`: Type of the script (e.g., OTH, CLI, RUN).
- `status`: Status of the script (e.g., active, deprecated, in_progress).
- `host`: Host(s) on which the script is applicable.
- `date`: Creation date of the script.
- `tag`: Custom tags associated with the script.
- `description`: Short description of the script.

## Directory Structure

The script assumes the following directory structure relative to the user's home directory:

- Scripts are located in the directory `~/.scripts/`.
- The output CSV file is saved as `~/.scripts/data/script_info.csv`.

## How to Use

1. Clone this repository.
2. Move your script files to the `~/.scripts/` directory.
3. Compile the script using a C compiler (e.g., `gcc`):
   ```sh
   gcc -o metadata_extractor metadata_extractor.c
   ```
4. Run the compiled executable:
   ```sh
   ./metadata_extractor
   ```
5. The extracted metadata will be saved to `~/.scripts/data/script_info.csv`.

## Code Explanation

### Main Components

#### Data Structure
```c
typedef struct {
    char file[256];
    char type[10];
    char status[20];
    char host[50];
    char date[10];
    char tag[50];
    char descr[256];
} ScriptInfo;
```
This structure holds information about a single script.

#### Extract Information
```c
void extract_info(const char *path, ScriptInfo *info);
```
This function extracts metadata from the script file at the given path and populates the `ScriptInfo` structure.

#### Update Cache
```c
void update_cache(const char *script_folder, const char *cache_file);
```
This function scans the `~/.scripts/` directory for script files, extracts metadata from each, and writes the information to a CSV file.

#### Main Function
```c
int main();
```
This is the entry point of the program. It sets up the necessary paths and calls `update_cache` to generate the output CSV file.

## License

This project is licensed under the MIT License. See the [LICENSE](LICENSE) file for details.

For any queries or contributions, please feel free to open an issue or create a pull request.