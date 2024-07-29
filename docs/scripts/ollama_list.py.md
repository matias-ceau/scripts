# ollama_list.py

# Ollama Model Scraper

This Python script scrapes model data from Ollama's website and displays it in a formatted tabular form. Users can sort and filter the data based on various criteria such as popularity, recency, and more. The script uses the following libraries: `requests`, `BeautifulSoup`, `pandas`, `tabulate`, `colorama`, `textwrap`, `argparse`, `re`, and `warnings`.

## Table of Contents

1. [Features](#features)
2. [Usage](#usage)
3. [Dependencies](#dependencies)
4. [Arguments](#arguments)
5. [Example](#example)
6. [Functions](#functions)

## Features

- Scrapes model information from Ollama's library page.
- Allows sorting models by popularity and recency.
- Supports showing detailed descriptions of specific models.
- Limits the number of models displayed.
- Automatically wraps long descriptions for better readability.
- Formats output in a colored, tabulated style.

## Usage

Run the script from the command line:

```sh
python ollama_scraper.py [OPTIONS]
```

## Dependencies

- Python 3.x
- requests
- BeautifulSoup4
- pandas
- tabulate
- colorama

You can install the required dependencies using pip:

```sh
pip install requests beautifulsoup4 pandas tabulate colorama
```

## Arguments

- `-p, --popularity`: Sort by popularity (number of downloads).
- `-n, --newest`: Sort by most recently updated.
- `-a, --all`: Show all models.
- `-l, --limit`: Limit to N models (default: 10).
- `-d, --describe`: Show full description of the specified model name.

## Example

To display the top 5 models sorted by popularity:

```sh
python ollama_scraper.py --popularity --limit 5
```

To show all models sorted by their latest update:

```sh
python ollama_scraper.py --newest --all
```

To get the full description of a specific model named "Model XYZ":

```sh
python ollama_scraper.py --describe "Model XYZ"
```

## Functions

### `convert_downloads(download_str)`

Converts download numbers from strings like "1.2K", "3M" to float values.

**Parameters:**

- `download_str (str)`: The download string to convert.

**Returns:**

- `tuple`: A tuple containing the float value of downloads and the formatted string.

### `convert_last_updated(time_str)`

Converts time strings like "2 weeks" to the number of days.

**Parameters:**

- `time_str (str)`: The time string to convert.

**Returns:**

- `tuple`: A tuple containing the number of days and the formatted string.

### main script

- Sends an HTTP GET request to the Ollama library URL.
- Parses the HTML content using BeautifulSoup.
- Extracts model names, descriptions, downloads, and last updated information.
- Converts extracted data into a pandas DataFrame.
- Sorts and limits the models based on provided arguments.
- Prints the DataFrame in a tabulated, colored format.

## Additional Notes

- The script suppresses specific warnings to clean up the output.
- Colorama is used for colorful terminal output, and it initializes with `autoreset=True` to reset colors after each print.

This script is a handy tool for users who want to quickly fetch and display model data from Ollama's library with various customization options.