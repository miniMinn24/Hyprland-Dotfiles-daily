#!/bin/bash

kill_waybar() {
    if pgrep -x "waybar" >/dev/null; then
        pkill -x waybar
    fi
}

kill_dock() {
    if pgrep -f "nwg-dock-hyprland" >/dev/null; then
        pkill -f nwg-dock-hyprland
    fi
}

waybar_win() {
    waybar -c ~/.config/waybar/config-win -s ~/.config/waybar/style-win.css &
}

waybar_simple() {
    #nwg-dock-hyprland -l top -i 74 -hd 40 -nolauncher -p bottom &
    #hyprctl reload &
    exec waybar -c ~/.config/waybar/config-simple -s ~/.config/waybar/style-simple.css &
    exec waybar -c ~/.config/waybar/config-task -s ~/.config/waybar/style-task.css &
}

kill_waybar
#kill_dock

if [[ $1 == "win" ]]; then
    waybar_win
    #exec ~/.config/hypr/scripts/change_windows_layout.sh win
elif [[ $1 == "simple" ]]; then
    waybar_simple
    #exec ~/.config/hypr/scripts/change_windows_layout.sh mac
fi
