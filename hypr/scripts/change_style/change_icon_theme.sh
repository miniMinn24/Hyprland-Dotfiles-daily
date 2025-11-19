#!/bin/bash

WIN_THEME="Win11-blue-dark"
WHITESUR_THEME="WhiteSur-dark"

change_theme() {
    local theme_name=$1
    nwg-look -x # Export current settings
    sed -i "s/^icon-theme=.*/icon-theme=$theme_name/" ~/.local/share/nwg-look/gsettings
    nwg-look -a # Apply settings
    hyprctl reload
}

if [[ $1 == "win" ]]; then
    change_theme $WIN_THEME &
elif [[ $1 == "whitesur" ]]; then
    change_theme $WHITESUR_THEME &
else
    echo "Usage: $0 {win|whitesur}"
    exit 1
fi
