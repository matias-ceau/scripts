#!/usr/bin/env bash

$@
echo "$(date '+%s') - $@" >> /data/data/com.termux/files/home/log.txt
sleep 1
