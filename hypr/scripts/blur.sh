#!/bin/bash

blur_state=$(hyprctl getoption decoration:blur:enabled | awk -F 'int:' '{print $2}' | xargs)

if [ "$blur_state" == 1 ]; then
	hyprctl keyword decoration:blur:enabled 0
else
	hyprctl keyword decoration:blur:enabled 1
fi
