#!/usr/bin/python

# INFO:#@CLI@ "Script to send emails"

import argparse
import smtplib
import ssl
import subprocess
from email.message import EmailMessage


def get_password(sender):
    output = subprocess.run(["pass", "show", sender], capture_output=True)
    return output.stdout.decode("UTF-8").splitlines()[1]


def generate_mail(display_name, email_receiver, subject, content, **kwargs):
    em = EmailMessage()
    em["From"] = display_name
    em["To"] = email_receiver
    em["Subject"] = subject
    em.set_content(content)
    return em


def argument_parser():
    parser = argparse.ArgumentParser(description="Send an email")
    parser.add_argument("--email-sender", default="matiasylinenceau@gmail.com")
    parser.add_argument("--email-receiver", default="matias@ceau.net")
    parser.add_argument("-s", "--subject", default="automatic")
    parser.add_argument("--display-name", default="self")
    parser.add_argument("-c", "--content", default="Testing")
    return parser.parse_args()


def main():
    args = argument_parser()
    email = generate_mail(**vars(args))
    context = ssl.create_default_context()
    password = get_password(args.email_sender)
    with smtplib.SMTP_SSL("smtp.gmail.com", 465, context=context) as smtp:
        smtp.login(args.email_sender, password)
        smtp.sendmail(args.email_sender, args.email_receiver, email.as_string())


if __name__ == "__main__":
    main()
