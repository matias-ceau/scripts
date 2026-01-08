# Utopia film page fetcher

---

**utopia.sh**: Download Utopia Bordeaux film pages for a fixed list of film IDs

---

### Dependencies

- `bash` (POSIX shell environment on Arch)
- `curl` (HTTP client used to fetch the HTML pages)

### Description

This script bulk-downloads several film detail pages from the Utopia Bordeaux website and stores them locally as HTML files. It defines:

- A `base_url` pointing to the Utopia Bordeaux index endpoint.
- An `ids` array containing the film IDs you want to fetch.
- A loop that requests each film page using `curl` and saves it as `film_<id>.html` in the current working directory.

Each request appends `&mode=film` to ensure the site returns the film page view. Progress is printed after each download, followed by a final completion message.

This is useful if you want to:
- quickly archive pages for offline reading,
- later parse the HTML (e.g., with `pup`, `python+bs4`, `xmllint`, etc.),
- integrate it into a larger pipeline (cron/systemd timer, or a qtile keybinding that refreshes the cache).

### Usage

Run it from a terminal (it writes files into the directory you run it from):

```sh
cd /tmp/utopia-cache
~/.scripts/dev/utopia.sh
```

Resulting files:

```sh
ls -1 film_*.html
# film_7767.html
# film_7860.html
# ...
```

Edit the list of IDs to change what gets downloaded:

```sh
ids=("1234" "5678")
```

If you want it runnable from anywhere but still keep outputs in one place, call it like:

```sh
mkdir -p ~/.cache/utopia
cd ~/.cache/utopia && ~/.scripts/dev/utopia.sh
```

---

> [!TIP]
> Consider adding `set -euo pipefail` and using `curl -fSL --retry 3 --retry-delay 1` to fail on HTTP errors and be more robust. Also, the output directory is implicit (current directory): you could add a configurable destination (e.g., `out_dir="${1:-.}"`) and ensure it exists. Finally, if IDs change often, fetching them dynamically (or reading from a file) would avoid editing the script each time.