# Send Email Script

---

**send_email.py**: Script to send an email from the command line with argparse and `smtplib`

---

### Dependencies

- `python` (>=3.6) — The script is written in Python.
- `argparse` (builtin) — For parsing command-line arguments.
- `smtplib` (builtin) — To send mail via SMTP.
- `ssl` (builtin) — For secure SMTP connection.
- `subprocess` (builtin) — To securely fetch passwords.
- `email` (builtin) — Constructs MIME email messages.
- `pass` — Password manager; retrieves email account passwords securely from your password store.

### Description

This script provides a CLI utility for quickly sending emails from your terminal, leveraging your existing password store for authentication:

- It uses `argparse` to accept sender, receiver, subject, display name, and content as flags/arguments.
- Emails are structured using the `EmailMessage` class for clean formatting.
- The `get_password()` function fetches your email account password from the `pass` password manager, assuming you keep the plain password on the second line of the pass file for the sender's email.
- It uses `smtplib.SMTP_SSL` to securely connect to Gmail's SMTP server on port 465 and send your message.

### Usage

You can run this script directly from the terminal or bind it to a launcher/shortcut in qtile. 

Basic example:

```
$ ~/.scripts/bin/send_email.py \
    --email-sender matiasylinenceau@gmail.com \
    --email-receiver someone@example.com \
    -s "Subject Line" \
    -c "Body of the email"
```

With minimal arguments (uses script defaults):

```
$ ~/.scripts/bin/send_email.py
```

**Arguments:**

| Flag                | Default                        | Description                    |
|---------------------|--------------------------------|--------------------------------|
| --email-sender      | matiasylinenceau@gmail.com     | Gmail address to send from     |
| --email-receiver    | matias@ceau.net                | Address to send mail to        |
| -s, --subject       | automatic                      | Email subject                  |
| --display-name      | self                           | Name shown as sender           |
| -c, --content       | Testing                        | Email body                     |

*Ensure that your password is correctly stored in `pass` under the label that matches your sender's email address, with the password on the second line.*

---

> [!CAUTION]
> - The script directly fetches the second line from your `pass` entry for the sender's email, assuming your password is configured on that line. This could fail if your password is located elsewhere or your `pass` entry structure differs.
> - Password retrieval isn't very flexible. If you use GPG comments or extra metadata in your password store, you might need to adjust the line indexing.
> - `"From"` header uses the display name only, which may cause the message to appear malformed in some email clients that expect "Display Name <email@address>" format.
> - SMTP server details are hardcoded for Gmail; this won't work with other providers as-is.
> - No error handling for failed authentication, mail delivery errors, or password retrieval.
> - Sending HTML or attachments is not supported—content is plain text only.
> - Consider switching to environment variables (or a secrets manager) for more portable authentication if you ever migrate from `pass`.