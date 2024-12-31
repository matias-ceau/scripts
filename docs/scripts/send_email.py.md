# send_email.py - Script to Send Emails

---

**send_email.py**: A Python script to send emails using `smtplib` with support for fetching email credentials securely via the `pass` utility.

---

### Dependencies

- `python` (version >= 3.6): Required to run the script.
- `pass`: A command-line password manager to retrieve the email sender's password.
  - The password must be stored in `pass` under the sender's email key. For example:
    ```
    pass insert matiasylinenceau@gmail.com
    ```
- A Gmail account or another mail host supporting SMTP over SSL (adjust the code if using a non-Gmail SMTP server).

### Description

This script is designed to send emails via SMTP using Gmail's SMTP server. The script:
1. Parses command-line arguments for email details, such as sender, receiver, subject, and content.
2. Retrieves the sender email's password securely using `pass`, ensuring no plain-text passwords in the script.
3. Generates an email object containing all provided information.
4. Logs into Gmail's SMTP server using the SSL protocol and sends the email.

**Key Functions**:
- `get_password(sender)`: Retrieves the password for the sender email using the `pass` utility.
- `generate_mail(display_name, email_receiver, subject, content)`: Creates an `EmailMessage` instance with the provided details.
- `argument_parser()`: Handles and parses command-line arguments, allowing the script to receive customization inputs at runtime.

### Usage

You can run the script via terminal with optional arguments to customize the email parameters. By default, it uses pre-defined settings.

#### **Basic Example**:
```bash
python /home/matias/.scripts/bin/send_email.py
```
This sends an email with the following defaults:
- Sender: `matiasylinenceau@gmail.com`
- Receiver: `matias@ceau.net`
- Subject: `automatic`
- Content: `Testing`

#### **Custom Email Example**:
```bash
python /home/matias/.scripts/bin/send_email.py --email-sender "user1@gmail.com" --email-receiver "user2@example.com" --subject "Hello there!" --content "This is a test email." --display-name "User1"
```

#### **Keybinding Example in Qtile**:
Bind the script to a keybinding in your Qtile configuration:
```python
Key([mod], "e", lazy.spawn("python /home/matias/.scripts/bin/send_email.py"))
```

---

> [!TIP] 
> - Use environment variables or a configuration file alternative to hardcode sensitive default values like `email-sender` for better security.
> - Improve error handling for `subprocess.run` when retrieving password with `pass`, as the script currently doesn't validate if the password fetching command fails.
> - Consider adding text formatting or attachments support to enhance email functionality.