#!/bin/bash

# Base URL
base_url="https://www.cinemas-utopia.org/bordeaux/index.php?id="

# Array of IDs to fetch
ids=("7767" "7860" "7861" "7865" "7866" "7867")

# Loop through each ID
for id in "${ids[@]}"; do
    # Fetch content and save to file
    curl -o "film_$id.html" "${base_url}${id}&mode=film"
    echo "Fetched content for film ID: $id"
done

echo "All content fetched."
