#!/bin/bash

Win_Style() {
    # exec ~/.config/hypr/scripts/change_style/change_icon_theme.sh win &
    hyprctl reload
    exec ~/.config/hypr/scripts/change_style/waybar_style.sh win &
    # exec ~/.config/hypr/scripts/change_style/wallpaper.sh win &
}

Mac_Style() {
    # exec ~/.config/hypr/scripts/change_style/change_icon_theme.sh whitesur &
    hyprctl reload
    exec ~/.config/hypr/scripts/change_style/waybar_style.sh simple &
    # exec ~/.config/hypr/scripts/change_style/wallpaper.sh simple &
}

toggle() {
    CONFIG_WIN='/home/miniminn/.config/waybar/config-win -s /home/miniminn/.config/waybar/style-win.css'
    CONFIG_MAC='/home/miniminn/.config/waybar/config-simple -s /home/miniminn/.config/waybar/style-simple.css'

    PID=$('pgrep -f $CONFIG_MAC')

    ps aux | grep "waybar -c" | grep -v grep | while read -r line; do
        PID=$(echo "$line" | awk '{print $2}')
        CMD=$(echo "$line" | awk '{$1=$2=$3=$4=""; print $0}' | xargs)

        # Check if the process is running with the correct config
        if [[ "$CMD" == *"-c $CONFIG_MAC"* ]]; then
            Win_Style
            hyprctl reload
        else
            Mac_Style
            hyprctl reload
        fi
    done
}

if [[ $1 == 'toggle' ]]; then
    toggle
elif [[ $1 == 'win' ]]; then
    Win_Style
elif [[ $1 == 'mac' ]]; then
    Mac_Style
fi
