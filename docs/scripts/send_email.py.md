# Send Email (Gmail SMTP helper)

---

**send_email.py**: Send a simple plaintext email via Gmail using credentials from `pass`

---

### Dependencies

- `python` (stdlib: `argparse`, `smtplib`, `ssl`, `email.message`)
- `pass` (password store CLI used to fetch the sender’s SMTP password)
- A working Gmail SMTP setup (ideally an **App Password** if 2FA is enabled)

### Description

This script sends a plaintext email through **Gmail’s SMTP over SSL** (`smtp.gmail.com:465`). It builds an `EmailMessage` with basic headers (`From`, `To`, `Subject`) and a plain content body, then authenticates to Gmail and sends.

Credentials are retrieved from `pass` via:

- `pass show <sender_email>`

The script then takes the **second line** of the output (`splitlines()[1]`) as the password. This implies your password entry must have a predictable format (e.g., first line might be something else, second line is the SMTP/app password). If that’s not the case, sending will fail or use the wrong secret.

Defaults for sender/receiver can be provided via environment variables:

- `EMAIL_SENDER` (fallback: `matiasylinenceau@gmail.com`)
- `EMAIL_RECEIVER` (fallback: `matias@ceau.net`)

### Usage

Run from a terminal (also suitable for a qtile keybinding if you hardcode/pipe content):

tldr:

- Send with defaults:
  - `send_email.py`
- Set subject and content:
  - `send_email.py -s "Build finished" -c "All tests passed."`
- Override sender/receiver:
  - `send_email.py --email-sender you@gmail.com --email-receiver other@domain.tld -s "Hi" -c "Hello!"`
- Use env defaults:
  - `EMAIL_SENDER=you@gmail.com EMAIL_RECEIVER=me@domain.tld send_email.py -s "Ping" -c "..."`

---

> [!TIP]
> Improvements to consider:
> - `get_password()` assumes the password is on line 2; typically `pass show` returns the password on line 1. Consider using `splitlines()[0]` or parsing more robustly.
> - Add error handling for missing `pass`, missing entry, empty output, or SMTP auth failures (currently silent besides exceptions).
> - `From` is set to `display_name` only; many clients expect `From` like `Name <email@domain>`. You could format it or set both properly.
> - Consider supporting stdin for `--content` (e.g., `-c -`), attachments, and HTML content if needed.