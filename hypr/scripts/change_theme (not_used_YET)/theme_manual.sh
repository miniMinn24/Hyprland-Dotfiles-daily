#!/bin/bash

play_sound() {
  paplay ~/.config/hypr/sounds/system/setting.wav &
}

waybar_dark_theme() {
  exec ~/.config/hypr/scripts/change_theme/waybar.sh dark &
}
waybar_light_theme() {
  exec ~/.config/hypr/scripts/change_theme/waybar.sh light &
}

dock_dark_theme() {
  exec ~/.config/hypr/scripts/change_theme/nwg_dock.sh dark &
}
dock_light_theme() {
  exec ~/.config/hypr/scripts/change_theme/nwg_dock.sh light &
}

wofi_dark_theme() {
  exec ~/.config/hypr/scripts/change_theme/wofi.sh dark &
}

wofi_light_theme() {
  exec ~/.config/hypr/scripts/change_theme/wofi.sh light &
}

swaync_dark_theme() {
  exec ~/.config/hypr/scripts/change_theme/swaync.sh dark &
}

swaync_light_theme() {
  exec ~/.config/hypr/scripts/change_theme/swaync.sh light &
}

gtk_dark_theme() {
  exec ~/.config/hypr/scripts/change_theme/gtk.sh dark &
}

gtk_light_theme() {
  exec ~/.config/hypr/scripts/change_theme/gtk.sh light &
}

wallpaper_dark() {
  swww img ~/Pictures/Wallpapers/for_script/Arch_Terminal.png --transition-type any --transition-fps 60 --transition-duration 1.6 &
}
wallpaper_light() {
  swww img ~/Pictures/Wallpapers/for_script/Arch_Terminal_Light.png --transition-type any --transition-fps 60 --transition-duration 1.6 &
}

if [[ $1 == "light" ]]; then
  notify-send -h string:x-canonical-private-synchronous:sys-notify -e -u low "Hyprland" "Changed to <b>Light Mode!</b>" &
  play_sound & disown
  waybar_light_theme & disown
  dock_light_theme & disown
  wofi_light_theme & disown
  swaync_light_theme & disown
  gtk_light_theme & disown
  wallpaper_light & disown
fi
if [[ $1 == "dark" ]]; then
  notify-send -h string:x-canonical-private-synchronous:sys-notify -e -u low "Hyprland" "Changed to <b>Dark Mode!</b>"
  play_sound & disown
  waybar_dark_theme & disown
  dock_dark_theme & disown
  wofi_dark_theme & disown
  swaync_dark_theme & disown
  gtk_dark_theme & disown
  wallpaper_dark & disown
fi
