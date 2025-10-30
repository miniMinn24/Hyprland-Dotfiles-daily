#!/bin/bash

if pgrep -x "waybar" > /dev/null; then
    pkill -x "waybar"
else
    ~/.config/hypr/scripts/change_style/waybar.sh simple
    waybar -b taskbar -c ~/.config/waybar/config-taskbar -s ~/.config/waybar/style-taskbar.css
fi
