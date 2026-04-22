#!/bin/bash

BATTERY="BAT0"
STATE_FILE="/tmp/last_battery_level"

# Get current status
LEVEL=$(cat /sys/class/power_supply/$BATTERY/capacity)
STATUS=$(cat /sys/class/power_supply/$BATTERY/status)

# Only notify if discharging
if [ "$STATUS" = "Discharging" ]; then
    # Create state file if it doesn't exist
    [ ! -f "$STATE_FILE" ] && echo "100" > "$STATE_FILE"
    LAST_LEVEL=$(cat "$STATE_FILE")

    # Check thresholds
    if [ "$LEVEL" -le 10 ] && [ "$LAST_LEVEL" -gt 10 ]; then
        notify-send -u critical "CRITICAL BATTERY" "Battery at ${LEVEL}%! Plug in now."
        echo "10" > "$STATE_FILE"
    elif [ "$LEVEL" -le 20 ] && [ "$LAST_LEVEL" -gt 20 ]; then
        notify-send -u normal "Low Battery" "Battery at ${LEVEL}%."
        echo "20" > "$STATE_FILE"
    elif [ "$LEVEL" -le 30 ] && [ "$LAST_LEVEL" -gt 30 ]; then
        notify-send -u low "Low Battery" "Battery at ${LEVEL}%."
        echo "30" > "$STATE_FILE"
    fi
else
    # Reset state when charging so it can notify again next time it's unplugged
    echo "100" > "$STATE_FILE"
fi
