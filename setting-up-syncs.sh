#!/bin/bash

HOST="$(hostnamectl hostname)"

mega-sync "$HOME/Desktop" "/BACKUPS/$HOST/Desktop"
mega-sync "$HOME/Downloads" "/BACKUPS/$HOST/Downloads"
mega-sync "$HOME/Templates" "/BACKUPS/$HOST/Templates"
mega-sync "$HOME/Public" "/BACKUPS/$HOST/Public"
mega-sync "$HOME/Documents" "/BACKUPS/$HOST/Documents"
mega-sync "$HOME/Music" "/BACKUPS/$HOST/Music"
mega-sync "$HOME/Pictures" "/BACKUPS/$HOST/Pictures"
mega-sync "$HOME/Videos" "/BACKUPS/$HOST/Videos"
