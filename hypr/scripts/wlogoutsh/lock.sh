#!/bin/bash

exec ~/.config/hypr/scripts/wlogoutsh/update_hyprlock_wallpaper.sh &

# Prevents from Lockscreen-stacks
if ! pgrep hyprlock > /dev/null; then
    exec hyprlock
fi
