#!/bin/bash

wallpaper_win() {
    swww img ~/Pictures/Wallpapers/for_script/win_dark.jpg --transition-type any --transition-fps 60 --transition-duration 1.6 &
}

wallpaper_simple() {
    swww img ~/Pictures/Wallpapers/for_script/landscape2.jpg --transition-type any --transition-fps 60 --transition-duration 1.6 &
}

if [[ $1 == 'win' ]]; then
    wallpaper_win
elif [[ $1 == 'simple' ]]; then
    wallpaper_simple
fi
