#!/usr/bin/env -S uv run --script --quiet

# /// script
# requires-python = ">=3.13"
# dependencies = [
#     "beautifulsoup4",
# ]
# ///

#!/usr/bin/env python

import sys

from bs4 import BeautifulSoup

# Load the HTML content from the file
content = sys.stdin.read()

# Parse the HTML content with BeautifulSoup
soup = BeautifulSoup(content, "html.parser")

# Locate the div with movie titles
movies_section = soup.find("div", class_="info-wrapper")
movies = []

if movies_section:
    # Extract the text and split by line breaks for each movie
    movies_text = movies_section.get_text(separator="\n")
    # Extract each line, trimming whitespace
    for line in movies_text.split("\n"):
        line = line.strip()
        # Only add lines that seem to be movie titles
        if (
            line
            and not line.startswith("Films avec de l'audio description")
            and not line.startswith("Rappel")
        ):
            movies.append(line)

# Output the extracted movies
for i, movie in enumerate(movies, start=1):
    print(f"{i}. {movie}")
