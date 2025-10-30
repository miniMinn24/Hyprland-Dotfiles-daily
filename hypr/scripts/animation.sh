#!/bin/bash

animation_state=$(hyprctl getoption animations:enabled | awk -F 'int:' '{print $2}' | xargs)

if [ "$animation_state" == 1 ]; then
	hyprctl keyword animations:enabled 0
else
	hyprctl keyword animations:enabled 1
fi

