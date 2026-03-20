echo $DBUS_SESSION_BUS_ADDRESS
busctl --user list | grep portal
journalctl --user -u xdg-desktop-portal.service | tail
nyxt --version
