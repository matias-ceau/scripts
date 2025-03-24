# UGC Python Movie Extractor

---

**/home/matias/.scripts/dev/ugc-python.py**: Extracts movie titles from HTML content by parsing a designated div

---

### Dependencies

- `beautifulsoup4` – Python library used for parsing HTML content

### Description

This script is designed to extract movie titles from HTML input. It reads HTML data from standard input, parses it using the `BeautifulSoup` library with the `"html.parser"` backend, and searches for a div with the class `info-wrapper`. Upon locating this specific section, the script retrieves its text content, splitting it by line breaks to separate individual movie titles.

To ensure it only extracts relevant movie titles, the script applies filters by ignoring lines that start with specific phrases, such as "Films avec de l'audio description" and "Rappel". The valid movie titles are then enumerated and printed to the standard output with a simple numbered list format.

This utility is particularly useful when you have HTML output or saved files that contain a list of movies, and you want to quickly extract and format them for further processing or logging. The script’s design aligns with typical Arch Linux setups and can be integrated into workflows using the qtile window manager, where piping commands or capturing output is common practice.

### Usage

To run the script, make sure you have installed required dependencies like `beautifulsoup4`. You can execute it directly from the command line by piping in your HTML content, for example:

    cat somefile.html | /home/matias/.scripts/dev/ugc-python.py

This script is set up to be run non-interactively by reading from standard input. It can be bound to a key in qtile if you need to extract movie titles from web snippets on the fly.

---

> [!TIP] One potential improvement is to add error handling for cases where the HTML structure does not match expectations (e.g., missing div elements or changes in class names). Also, consider modularizing the filtering logic so it can be easily adapted if different or additional criteria need to be applied to the extracted text.