# album_email.py

**Script Overview**

This Python script is a simple automated mail sender that selects an album from a music library and sends a daily email to the owner with information about the selected album.

**Functionality**

Here's a step-by-step breakdown of what the script does:

1. **Get Music Library Information**: The script uses the `beet` command-line tool (a music metadata manager) to list all albums in the music library, along with their path and other metadata.
2. **Select an Album Randomly**: A random album is chosen from the list of available albums.
3. **Extract Album Details**: The selected album's name and path are extracted from the output of `beet`.
4. **Compose Email**: An email message is created with:
	* Subject: "[A] {album_name}"
	* Body: A short description of the album, including its path, and a percentage of unheard albums in the music library (based on the total number of albums).
5. **Set up Email Server Connection**: The script sets up an SSL-encrypted connection to the Gmail SMTP server using the `smtplib` module.
6. **Send Email**: The email message is sent to the owner's email address using the Gmail account credentials.

**Notes**

* The script uses a hardcoded password for the Gmail account, which is not recommended in production environments due to security concerns. Consider using environment variables or a secure secrets management system instead.
* The script does not include any error handling or logging mechanisms. You may want to add these features to ensure that errors are properly handled and logged.
* This script seems to be an old implementation (as mentioned in the comment), so it might have been replaced by a more modern and robust solution using newer Python versions and libraries.