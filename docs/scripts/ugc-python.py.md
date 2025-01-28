# ugc-python.py: Extract Movie Titles from HTML

---

**ugc-python.py**: Extracts movie titles from a specific HTML structure using Beautiful Soup.

---

### Dependencies

- `python` (>=3.6): Required for running the script.
- `bs4` (`beautifulsoup4`): A Python library for parsing HTML and XML. Install it via `pip install beautifulsoup4`.

### Description

This script is designed to parse an HTML file, extract movie titles from a specific `div` element with the class `info-wrapper`, and output the titles in a numbered list. It is particularly useful when working with websites or web-scraped data formatted in an `info-wrapper` class containing textual movie titles.

#### How it works:
1. Reads the HTML content from `stdin`.
2. Uses the `BeautifulSoup` library to parse the input.
3. Searches for a `div` with the class name `info-wrapper`.
4. Extracts the text within the `div` and processes it line by line:
   - Strips out leading/trailing whitespace.
   - Filters out lines with irrelevant content (e.g., lines starting with "Films avec de l'audio description" or "Rappel").
5. Outputs the cleaned list of titles, numbered sequentially.

### Usage

The script must be provided HTML content via `stdin`. It can be used as part of a larger pipeline or with a direct command.

**Basic Example:**
```bash
cat path/to/your/htmlfile.html | python /home/matias/.scripts/dev/ugc-python.py
```

**Expected Output:**
If the HTML file contains a structure like:
```html
<div class="info-wrapper">
    Film 1
    <br>Film 2
    <br>Rappel: Some note
    <br>Films avec de l'audio description
</div>
```
The output will be:
```plaintext
1. Film 1
2. Film 2
```

You can redirect the output to a file if needed:
```bash
cat path/to/your/htmlfile.html | python /home/matias/.scripts/dev/ugc-python.py > movies.txt
```

---

> [!TIP]
> - **Edge Case Handling:** If the `info-wrapper` div is absent, the script silently prints nothing. Consider adding an error or warning message for better clarity.
> - **Dynamic Filters:** Currently hardcoded to filter specific types of lines ("Rappel" or "Films avec de l'audio description"). Consider making these filters configurable via command-line arguments or a configuration file.
> - **Input Source:** The script only reads `stdin`. Adding a fallback to accept a file path as an argument (e.g., `python ugc-python.py file.html`) could make the tool more versatile.
> - **Performance:** For large HTML files, optimize parser actions or restrict parsing to relevant areas of the document.