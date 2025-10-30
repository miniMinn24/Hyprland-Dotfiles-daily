#!/bin/bash
state=$(hyprctl getoption plugin:hyprbars:enabled | awk -F 'int: ' '{print $2}')
if [ "$state" == "0" ]; then
  hyprctl keyword plugin:hyprbars:enabled 1
else
  hyprctl keyword plugin:hyprbars:enabled 0
fi
