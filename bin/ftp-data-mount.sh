#!/usr/bin/bash

FOLDER=DATA
DEST="/mnt/ftp"

mega-ftp "$FOLDER" && \
	curlftpfs "$(mega-ftp | rg "$FOLDER" | cut -d' ' -f2)" "${DEST}/${FOLDER}"
	
