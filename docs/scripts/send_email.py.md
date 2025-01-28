# Email Sending Script

---

**send_email.py**: Script to send emails automatically through Python and the Gmail SMTP server.

---

### Dependencies

- `argparse`: Standard library module used for parsing command-line arguments.
- `smtplib`: Standard library module for SMTP (email sending).
- `ssl`: Standard library module for secure SSL/TLS connections.
- `subprocess`: Standard library module for interacting with system commands.
- `email.message.EmailMessage`: To create and format email messages.
- `pass`: External CLI tool for securely storing and retrieving passwords ([Password Store](https://www.passwordstore.org/)).

**Note**: Ensure that the `pass` tool is installed and your Gmail passwords are saved correctly within `pass`.

---

### Description

This script allows sending emails programmatically. It constructs the email using the `email` library, retrieves the sender email's password securely via the `pass` utility, and sends the email using Gmail's SMTP server over an SSL connection.

Key functions:
1. **`get_password(sender)`**: Uses the `pass` utility to fetch the password for the email account (sender). Assumes passwords are stored in `pass` under the name corresponding to the sender email.
2. **`generate_mail(...)`**: Creates an `EmailMessage` object with the appropriate headers and content.
3. **`argument_parser()`**: Parses command-line arguments like sender, recipient, subject, etc. Default values are preconfigured.
4. **`main()`**: Combines all the above to retrieve the password, format the email, and send it using Gmail's SMTP server.

---

### Usage

Run the script in a terminal with the appropriate arguments:

```bash
python send_email.py --email-sender <sender_email> --email-receiver <receiver_email> -s <subject> -c <content>
```

#### Example:
```bash
python send_email.py --email-sender matiasylinenceau@gmail.com --email-receiver matias@ceau.net -s "Hello there!" -c "This is a test message sent via Python."
```

**Command-Line Options**:
- `--email-sender` (default: "matiasylinenceau@gmail.com"): Sender email address.
- `--email-receiver` (default: "matias@ceau.net"): Receiver email address.
- `-s, --subject` (default: "automatic"): Email subject line.
- `--display-name` (default: "self"): Display name of sender.
- `-c, --content` (default: "Testing"): Email body content.

This script can be tied to keybindings in qtile for quick email dispatching.

---

> [!TIP]
> - The script tightly couples with the Gmail SMTP server (`smtp.gmail.com`) and assumes the password is managed by `pass`. Make this configurable in case of non-Gmail emails or alternate password managers.
> - Remember to use [App Passwords](https://support.google.com/accounts/answer/185833?hl=en) for Gmail to meet their recent security policies.
> - Error handling can be added, e.g., for cases where `pass` outputs errors or if SMTP fails to connect.
> - Consider logging the success or failure of each email dispatch for debugging purposes.