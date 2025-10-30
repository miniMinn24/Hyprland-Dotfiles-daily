#!/bin/bash

# Check for internet connection by pinging Google
if ! ping -c 1 archlinux.org &>/dev/null; then
    notify-send -i /usr/share/icons/WhiteSur-dark/devices/scalable/modem.svg "System Update" "No internet connection available."
    exit 1
fi

# Check for updates
updates=$(checkupdates 2>/dev/null | wc -l)

# If updates are available, send a notification
if [[ "$updates" -gt 0 ]]; then
    notify-send -i /usr/share/icons/WhiteSur-dark/apps/scalable/Appstore.svg "System Update" "$updates updates available."
else
    notify-send -i /usr/share/icons/WhiteSur-dark/devices/scalable/drive-harddisk.svg "System Update" "You're on the latest updates!"
fi
