#!/bin/bash

# The directory where you expect your databases to be stored
DBDIR="$XDG_DATA_HOME/ousse"
mkdir -p "$DBDIR"

# DBS=(home.db $DB_DIR/dots.db $DB_DIR/data.db $DB_DIR/root.db $DB_DIR/mega.db $DB_DIR/devices.db $DB_DIR/limbo.db $DB_DIR/hdd2.db)
# # Optional: Minimum time in seconds before a database is considered out-of-date
# MIN_AGE = 86400

_custom_updatedb() {
    [[ ! $# -eq 5 ]] && echo "invalid nb of args"
}

_home() {
    echo "Updating home..."
    updatedb -l 0 -o "$DBDIR/home.db" -U $HOME --prune-bind-mounts 0 --prunenames "" --prunepaths "/tmp"
}
_dots() {
    echo "Updating dots..."
    updatedb -l 0 -o "$DBDIR/dots.db" -U $HOME \
        --prune-bind-mounts 0 \
        --prunenames "$(fd '^[^.]' -tl -td --search-path=$HOME --exact-depth=1 --format '{/}' | rg -v ' ' | tr \\n ' ')" \
        --prunepaths "$(fd . -td --max-depth=1 --search-path=$HOME | sed 's/\/$//' | tr '\\n' ' ')"
}
_data() {
    echo "Updating data..."
    updatedb -l 0 -o "$DBDIR/data.db" -U /mnt --prune-bind-mounts 0 --prunenames "vids" --prunepaths "$(fd . -td -u --search-path /mnt/HDD2 --search-path /mnt/SSD --search-path /mnt --exact-depth=1 | rg -v 'DATA|HDD2/$|SSD/$' | sed 's#/$##' | tr \\n ' ')"
}
_root() {
    echo "Updating root..."
    updatedb -l 0 -o "$DBDIR/root.db" -U / --prune-bind-mounts 0 --prunenames '' --prunepaths "/afs /efi /sfs /tmp /udev /var/cache /var/lib/pacman/local /var/lock /var/run /var/spool /var/tmp"
}

_mega() {
    echo "Updating mega..."
    updatedb -l 0 -o "$DBDIR/mega.db" -U $(dirname "$(realpath $HOME/UnifiedLibrary)") --prune-bind-mounts 0 --prunenames "" --prunepaths "/tmp"
}
_devices() {
    echo "Updating devices..."
    updatedb -l 0 -o "$DBDIR/devices.db" -U $(fd -td --search-path / --max-depth=4 '^devices$' --owner $USER | rg 'home|mnt' | sed 's#/$##') --prune-bind-mounts 0 --prunenames "" --prunepaths "/tmp"
}
_limbo() {
    echo "Updating limbo..."
    updatedb -l 0 -o "$DBDIR/limbo.db" -U $(fd -td '^LIMBO$' /mnt --max-depth=4 | sed 's#/$##') --prune-bind-mounts 0 --prunenames "" --prunepaths "/tmp"
}
_hdd2() {
    echo "Updating hdd2..."
    updatedb -l 0 -o "$DBDIR/hdd2.db" -U /mnt/HDD2 --prune-bind-mounts 1 --prunenames "" --prunepaths ""
}

_all() {
    _home
    _dots
    _data
    _root
    _mega
    _devices
    _limbo
    _hdd2
}

case "$1" in
    hom*) _home ;;
    dot*) _dot ;;
    dat*) _data ;;
    roo*) _root ;;
    meg*) _mega ;;
    dev*) _devices ;;
    li*) _limbo ;;
    hd*) _hdd2 ;;
    all) _all ;;
    *)  ;;
esac

