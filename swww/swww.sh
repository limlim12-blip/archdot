#!/bin/bash

# Define your wallpapers directory
WALLPAPERS_DIR=~/wallpapers

# Find a random image and set it with transitions
WALLPAPER=$(find "$WALLPAPERS_DIR" -type f | shuf -n 1)
swww img "$WALLPAPER" --transition-type outer --transition-duration 2 --transition-fps 60

