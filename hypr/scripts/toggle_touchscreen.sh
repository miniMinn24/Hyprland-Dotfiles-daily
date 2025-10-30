#!/bin/bash

current_enabled_value=$(hyprctl getoption input:touchdevice:enabled | awk -F 'int: ' '{print $2}')

if [ "$current_enabled_value" == '1' ]; then
    hyprctl keyword input:touchdevice:enabled 0
    notify-send -h string:x-canonical-private-synchronous:sys-notify -e -u low -i monitor "Touchscreen Disabled" "The screen touches are disabled by Hyprland."
elif [ "$current_enabled_value" == '0' ]; then
    hyprctl keyword input:touchdevice:enabled 1
    notify-send -h string:x-canonical-private-synchronous:sys-notify -e -u low -i monitor "Touchscreen Enabled" "The screen touches are enabled by Hyprland."
fi

