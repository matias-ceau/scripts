# Utopia Film Fetcher

---

**utopia.sh**: Fetches film data from the Utopia Cinema Bordeaux website and saves it locally.

---

### Dependencies

- `bash`: The script is written in Bash, which is available by default on Arch Linux.
- `curl`: A command-line tool used for making HTTP requests. Install it with `sudo pacman -S curl` if not already installed.

### Description

This script automates the task of downloading specific film data from the Utopia Cinema Bordeaux website. It uses a base URL combined with unique film IDs to dynamically generate URLs, then fetches the corresponding HTML content using `curl`. The fetched data is saved locally as separate `.html` files named `film_<ID>.html`, where `<ID>` matches the film's unique identifier.

Key features:
- The `base_url` variable holds the root website URL.
- The `ids` array contains all the film IDs to be fetched.
- A `for` loop iterates through each ID, constructs the full URL, and downloads the webpage.

This script is particularly useful if you’re trying to scrape or archive film details locally.

### Usage

To run the script, ensure it is executable and execute it in a terminal. You can make the script executable via:

```bash
chmod +x /home/matias/.scripts/dev/utopia.sh
```

Then run it using:

```bash
/home/matias/.scripts/dev/utopia.sh
```

The HTML content for each film will be saved in the directory where the script is executed. The filenames will be in the format: `film_<ID>.html`.

Example output in the terminal:

```plaintext
Fetched content for film ID: 7767
Fetched content for film ID: 7860
Fetched content for film ID: 7861
Fetched content for film ID: 7865
Fetched content for film ID: 7866
Fetched content for film ID: 7867
All content fetched.
```

---

> [!TIP]
> - **Parameterization**: The script could allow the user to input a custom list of IDs or specify the output directory.
> - **Error Handling**: Consider adding error handling for `curl` (e.g., using the `--fail` flag) to report if any of the requests fail.
> - **Documentation**: It would be helpful to include inline comments explaining key functionality for easier modification or reuse.
> - **Dynamic Input**: For flexibility, you could allow the user to dynamically pass film IDs as command-line arguments.