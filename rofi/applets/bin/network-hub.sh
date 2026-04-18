#!/bin/bash

# 1. Define the options
options="  Wi-Fi\n Bluetooth"

# 2. Open Rofi and store the user's choice
chosen=$(echo -e "$options" | rofi -dmenu -i -p "Networks")

# 3. Launch the correct script based on the choice
case "$chosen" in
    "  Wi-Fi")
        ronema
        ;;
    " Bluetooth")
        rofi-bluetooth
        ;;
esac
