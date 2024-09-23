#!/bin/bash

HOST="$(hostnamectl hostname)"

mega-sync "$HOME/Desktop" "/BACKUPS/$HOST/Desktop"
mega-sync "$HOME/Downloads" "/BACKUPS/$HOST/Downloads"
mega-sync "$HOME/Templates" "/BACKUPS/$HOST/Templates"
mega-sync "$HOME/Share" "/BACKUPS/$HOST/Share"
mega-sync "$HOME/Documents" "/BACKUPS/$HOST/Documents"
mega-sync "$HOME/Music" "/BACKUPS/$HOST/Music"
mega-sync "$HOME/Pictures" "/BACKUPS/$HOST/Pictures"
mega-sync "$HOME/Videos" "/BACKUPS/$HOST/Videos"

if [ "$HOST" = karhu ]; then
    mega-sync "$HOME/PKM" "/PKM"
    mega-sync "$HOME/UnifiedLibrary" "/UnifiedLibrary"
    mega-sync "/mnt/mega/hauki/xiaomi_mega" "/HOST_QUICKSHARES/xiaomi_mega"
    mega-sync "/mnt/mega/karjala" "/BACKUPS/karjala"
fi
