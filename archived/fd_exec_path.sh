#! /usr/bin/bash

#INFO:#=2024-07=@RUN@ "Replacement of dmenu_path"

# Define cache file path
CACHE_FILE="${XDG_CACHE_HOME:-$HOME/.cache}/fzfmenu_path"

# Function to update the cache

update_cache() {
  fd . --type x --type l $(echo $PATH | sed 's/:/ /g') >"$CACHE_FILE"
}

# Check if cache file exists and is older than an hour
if [[ ! -f "$CACHE_FILE" || $(find "$CACHE_FILE" -mmin +60) ]]; then
  update_cache && cat "$CACHE_FILE"
else
  #Output the paths to stdout
  cat "$CACHE_FILE"
fi

if [[ $(find "$CACHE_FILE" -mmin +60) ]]; then
  update_cache &
fi
