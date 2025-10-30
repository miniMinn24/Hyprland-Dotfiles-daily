#!/bin/bash

# Define file paths
config="$HOME/.config/hypr/hyprlock.conf"

# Extract wallpaper path from config.ini
wallpaper_path=$(swww query | grep "image:" | cut -d':' -f6 | xargs)

# Check if wallpaper path was found
if [[ -z "$wallpaper_path" ]]; then
    echo "Error: No wallpaper path found in $config"
    exit 1
fi

# Replace path= in hyprlock.conf
sed -i "s|^\s*path=.*|    path= $wallpaper_path|" "$config"

echo "Updated $config with new wallpaper path: $wallpaper_path"
