#!/bin/bash

HOST="$(hostnamectl hostname)"

# XDG FOLDERS
mega-sync "$HOME/Desktop" "/BACKUPS/$HOST/Desktop"
mega-sync "$HOME/Downloads" "/BACKUPS/$HOST/Downloads"
mega-sync "$HOME/Templates" "/BACKUPS/$HOST/Templates"
mega-sync "$HOME/Share" "/BACKUPS/$HOST/Share"
mega-sync "$HOME/Documents" "/BACKUPS/$HOST/Documents"
mega-sync "$HOME/Music" "/BACKUPS/$HOST/Music"
mega-sync "$HOME/Pictures" "/BACKUPS/$HOST/Pictures"
mega-sync "$HOME/Videos" "/BACKUPS/$HOST/Videos"

# NOTES FOLDER
mega-sync "$HOME/PKM" "/PKM"

if [ "$HOST" = karhu ]; then
    # Common Library
    mega-sync "$HOME/UnifiedLibrary" "/UnifiedLibrary"
    mega-sync "/mnt/mega/hauki/xiaomi_mega" "/HOST_QUICKSHARES/xiaomi_mega"
    mega-sync "/mnt/mega/karjala" "/BACKUPS/karjala"

elif [ "$HOST" = karjala ]; then
    # Common Library
    mega-sync "/mnt/HDD2/MEGA/UnifiedLibrary" "/UnifiedLibrary"
    # Media files too big to fit on every device
    mega-sync "/mnt/HDD2/MEGA/AUDIOVISUAL" "/AUDIOVISUAL"
    # Access to other hosts
    mega-sync "/mnt/HDD2/devices/karhu" "/BACKUPS/karhu"
    mega-sync "/mnt/HDD2/devices/hauki" "/BACKUPS/hauki"
    mega-sync "/mnt/HDD2/devices/xiaomi_mega" "/HOST_QUICKSHARES/xiaomi_mega"
    # TODO: also sync huge data folders:
    # - ARCHIVES
    # - DATA
    # - LIMBO
fi
