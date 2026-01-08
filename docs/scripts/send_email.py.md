# Gmail SMTP CLI sender (pass-backed)

---

**send_email.py**: Send a plaintext email via Gmail SMTP using a password from `pass`

---

### Dependencies

- `python` (stdlib: `argparse`, `smtplib`, `ssl`, `subprocess`, `email.message`)
- `pass` (password-store): used to fetch the sender’s SMTP password
- A working Gmail SMTP setup (account credentials / app password if needed)

### Description

This script is a small CLI utility to send a plaintext email through Gmail’s SMTP-over-SSL endpoint (`smtp.gmail.com:465`). It builds an `EmailMessage` with `From`, `To`, and `Subject` headers and uses `set_content()` for the body.

Password retrieval is delegated to `pass show <sender>`. The script then takes the **second line** of the output (`splitlines()[1]`) as the password. That implies your `pass` entry for the sender email must be formatted with at least two lines (commonly: first line could be a label, second line the app password).

It’s well-suited for automation on Arch (cron/systemd timers) or for a qtile keybinding when you want a quick “fire-and-forget” notification email without opening a mail client.

### Usage

Run from a terminal:

- Minimal (uses defaults):
  - `send_email.py`

- Custom receiver / subject / body:
  - `send_email.py --email-receiver "you@example.com" -s "Build done" -c "The pipeline finished successfully."`

- Custom sender + display name header:
  - `send_email.py --email-sender "account@gmail.com" --display-name "Matias <account@gmail.com>" -s "Hi" -c "Hello"`

Arguments:

- `--email-sender`: Gmail address used to authenticate
- `--email-receiver`: destination address
- `-s/--subject`: subject line
- `--display-name`: literal value used in the `From` header
- `-c/--content`: plaintext body

---

> [!TIP]
> Consider making `pass show` parsing more robust: `pass` typically stores the password on the first line, so using `splitlines()[0]` (or searching for a specific field) avoids fragile assumptions. Also handle errors (missing entry, non-zero return code) and avoid hardcoding Gmail host/port so you can reuse the script with other SMTP servers. Finally, `From` should usually include the actual email (`Name <email>`), otherwise some SMTP servers/clients may display it oddly.