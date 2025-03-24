#!/bin/bash

# Default values
DEFAULT_URL="https://ollama.com/library?sort=popular"
DEFAULT_MODEL="groq:llama-3.3-70b-versatile"
CACHE_DIR="$HOME/.cache/model_list"
CACHE_FILE="$CACHE_DIR/response_cache.txt"
CACHE_TIMESTAMP="$CACHE_DIR/cache_timestamp.txt"
MAX_CACHE_AGE_DAYS=7

# Function to create cache directory if it doesn't exist
create_cache_dir() {
    if [ ! -d "$CACHE_DIR" ]; then
        mkdir -p "$CACHE_DIR"
    fi
}

# Function to check if cache is valid
is_cache_valid() {
    if [ ! -f "$CACHE_TIMESTAMP" ] || [ ! -f "$CACHE_FILE" ]; then
        return 1
    fi

    local cache_date=$(cat "$CACHE_TIMESTAMP")
    local current_date=$(date +%s)
    local age_in_seconds=$((current_date - cache_date))
    local max_age_seconds=$((MAX_CACHE_AGE_DAYS * 24 * 60 * 60))

    if [ $age_in_seconds -gt $max_age_seconds ]; then
        return 1
    fi
    return 0
}

# Parse command line arguments
URL="$DEFAULT_URL"
MODEL="$DEFAULT_MODEL"

while [[ $# -gt 0 ]]; do
    case $1 in
        --url)
            URL="$2"
            shift 2
            ;;
        --model)
            MODEL="$2"
            shift 2
            ;;
        --no-cache)
            NO_CACHE=1
            shift
            ;;
        *)
            echo "Unknown option: $1"
            echo "Usage: $0 [--url URL] [--model MODEL] [--no-cache]"
            exit 1
            ;;
    esac
done

# Create cache directory
create_cache_dir

# Check if we should use cached response
if [ -z "$NO_CACHE" ] && is_cache_valid; then
    cat "$CACHE_FILE"
else
    # Fetch new data and cache it
    response=$(curl -s "$URL" | pandoc --from html --to plain | aichat 'return a nicely formatted list of all these models' --model "$MODEL")
    
    # Store response and timestamp in cache
    echo "$response" > "$CACHE_FILE"
    date +%s > "$CACHE_TIMESTAMP"
    
    # Output the response
    echo "$response"
fi
