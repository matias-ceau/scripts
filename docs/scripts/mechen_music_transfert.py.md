# mechen_music_transfert.py

# Custom Script to Copy Music to Mechen

This custom Python script automates the process of copying music albums to a specific directory on a music player named `Mechen`. The script handles checking available space, removing unnecessary albums, creating necessary folders, and synchronizing the music content using `rsync`.

## Requirements

- Python 3
- Required Python packages: `pandas`
- `sudo` access for file operations
- `beet` (used for querying music library)

## Script Functionality

### 1. Importing Libraries
The script begins by importing necessary libraries:
- `subprocess`: To run shell commands.
- `os`: To handle file and directory operations.
- `pandas`: For handling data in a tabular format.
- `random`: For selecting random items.
- `getpass`: To securely input passwords.

### 2. Getting User Password
The script prompts the user for their password using `getpass` for secure input.

```python
password = getpass('Password pliz: ')
```

### 3. Defining Constants
- `MAX_SPACE`: Maximum space the music player can hold (50 MB in this case).
- `player_path`: Path to the music player directory.

### 4. Querying Not Listened Albums
The script uses `subprocess.run` to query albums that have not been listened to.

### 5. Calculating Album Sizes
The script calculates the sizes of the queried albums using the `du` command.

### 6. Creating Pandas Dataframe
A Pandas DataFrame is created to store album paths, short paths, artists, and sizes.

### 7. Getting Albums Already on Device
The script checks which albums are already present on the music player.

### 8. Cleaning Up the Dataframe
Algorithms are implemented to ensure that the total size of albums on the device does not exceed the maximum limit:
- `drop_random_artist(df)`: Randomly drops an artist's albums from the dataframe.
- `df_ttoo_big(df)`: Checks if the dataframe's total size is too big.

### 9. Removing Unnecessary Albums
The script removes albums from the device that are not in the list of albums to be copied.

### 10. Removing Empty Folders
Empty folders on the music player are deleted to keep the directory clean.

### 11. Creating Necessary Folders
Folders are generated as required to organize the new albums being copied.

### 12. Synchronizing Albums
Using `rsync`, the script synchronizes the albums from the music library to the music player, ensuring that they are copied correctly.

## How to Run

1. Ensure you have the `pandas` library installed:
   ```sh
   pip install pandas
   ```

2. Run the script with:
   ```sh
   python3 script_name.py
   ```

3. Enter your password when prompted.

## Note

- The script uses `sudo` commands; ensure you have the necessary permissions.
- Adjust the `MAX_SPACE` and `player_path` values as per your requirements.
- The script assumes the music library is structured and queried using `beet`.

---

This script automates the process of managing music content on your music player, ensuring that the device does not run out of space while keeping your albums organized and up-to-date.