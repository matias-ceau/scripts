# Utopia Film Pages Downloader

---

**utopia.sh**: Download selected Utopia Bordeaux film pages to HTML files

---

### Dependencies

- `bash`: Required as the script interpreter.
- `curl`: Used to fetch web content via HTTP.
  
### Description

This script automates the process of fetching and saving several film information pages from the Utopia Bordeaux cinema website. The script defines a set of film IDs and downloads each corresponding web page, saving each as a separate HTML file (`film_<ID>.html`). Each download is announced in the terminal for progress tracking.

Key Details:

- **Base URL**: The script targets pages under `https://www.cinemas-utopia.org/bordeaux/index.php`.
- **ID Array**: Edit the `ids` array to fetch different films without modifying core logic.
- Each HTML page is saved using its film ID for easy reference.
- Status messages provide feedback on progress.

### Usage

You can execute this script from a terminal window or map it to a qtile keybinding if you routinely fetch such pages.

```bash
bash /home/matias/.scripts/dev/utopia.sh
```

Output will look like:
```
Fetched content for film ID: 7767
Fetched content for film ID: 7860
...
All content fetched.
```

To customize which films are fetched, simply edit the `ids` array:

```bash
ids=("1234" "5678")  # Replace with your desired film IDs
```

---

> [!TIP]
> - **Improvements**: The script does not handle errors from `curl` (e.g., network issues, missing pages), meaning if a fetch fails, you'll end up with an empty or invalid HTML file but still get a “Fetched...” message. Add `|| echo "Failed to fetch..."` after the curl command or use `set -e` at the top with error checks for greater robustness.
>
> - **Enhancement**: Consider creating an output directory for fetched files (e.g., `./utopia-films/film_$id.html`) to prevent cluttering your working directory. Support for command-line parameters to override IDs or the base URL would also add flexibility.
>
> - **Arch-specific advice**: Ensure `curl` is installed (`sudo pacman -S curl`). No Arch-specific changes required otherwise.
>
> - **Qtile integration**: The script is suitable for a keybinding in qtile; however, since it produces multiple files, you may want notifications or a summary at the end if run from a GUI context.