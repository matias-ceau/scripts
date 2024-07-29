#!/bin/bash

#DOC#@UTL@=2024-07= "create symlinks in ~/.local/bin and remove old ones"

# Directories
SOURCE_DIR="$SCRIPTS"
TARGET_DIR="$HOME/.local/bin"
LOG_FILE="$SCRIPTS/log/symlinking.log"
DATA_FILE="$SCRIPTS/data/symlink_data.csv"

# Initialize the CSV file and backup last one
if [ -f "$DATA_FILE" ]; then
    tail -n +2 "$DATA_FILE" >>"$SCRIPTS/log/symlinking.log.csv"
fi
echo "Original Path,Symlink,Command Name" >"$DATA_FILE"

# Function to log errors with date
log_info() {
    INFO="$(date +'%Y-%m-%d %H:%M:%S') - $1"
    echo -e "\033[32m$INFO\033[0m"
    echo "$INFO" >>"$LOG_FILE"
}

log_error() {
    ERROR="$(date +'%Y-%m-%d %H:%M:%S') - $1"
    echo -e "\033[31m$ERROR\033[0m"
    echo "$ERROR" >>"$LOG_FILE"
}

# Remove broken symlinks and log
remove_broken_symlinks() {
    for SYMLINK in "$TARGET_DIR"/*; do
        if [ -L "$SYMLINK" ] && [ ! -e "$SYMLINK" ]; then
            log_error "Cleaning: Removed broken symlink: $SYMLINK"
            rm "$SYMLINK"
        fi
    done
}

# Simplified symlink function
create_symlinks() {
    fd '' -t x "$SOURCE_DIR" | while read -r FILE; do
        BASENAME=$(basename "$FILE")
        SYMLINK="$TARGET_DIR/$BASENAME"

        if [ -e "$SYMLINK" ]; then
            if [ "$(readlink "$SYMLINK")" != "$FILE" ]; then
                log_error "Conflict: $SYMLINK already exists and links to a different file."
            fi
        elif [ -L "$SYMLINK" ]; then
            if [ "$(readlink "$SYMLINK")" != "$FILE" ]; then
                log_error "Conflict: $SYMLINK is a different symlink."
            fi
        else
            ln -s "$FILE" "$SYMLINK"
            echo "Created symlink $SYMLINK --> $FILE"
        fi
    done
}

# Function to add all symlinks pointing to $SCRIPTS to CSV
add_symlinks_to_csv() {
    for SYMLINK in "$TARGET_DIR"/*; do
        if [ -L "$SYMLINK" ]; then
            TARGET=$(readlink "$SYMLINK")
            if [[ $TARGET == $SCRIPTS* ]]; then
                BASENAME=$(basename "$SYMLINK")
                echo "$TARGET,$SYMLINK,$BASENAME" >>"$DATA_FILE"
            fi
        fi
    done
    bat -lcsv "$DATA_FILE"
}

# Run functions
echo "# Cleaning..." | glow
remove_broken_symlinks
echo -e "\033[32mCleaning complete!\033[0m"

sleep 2

echo "# Symlinking..." | glow
create_symlinks
echo -e "\033[32mSymlinking complete!\033[0m"

sleep 2

echo "# Adding symlinks to CSV..." | glow
add_symlinks_to_csv
echo -e "\033[32mCSV update complete!\033[0m"
