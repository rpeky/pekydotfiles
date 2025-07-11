#!/bin/bash

FLAG="/tmp/polybar_battery_verbose"
ACTION="$1"  # optional: "toggle" if clicked

BAT0="/sys/class/power_supply/BAT0"
BAT1="/sys/class/power_supply/BAT1"

capacity0=$(cat "$BAT0/capacity")
capacity1=$(cat "$BAT1/capacity")
status0=$(cat "$BAT0/status")
status1=$(cat "$BAT1/status")

total=$(( (capacity0 + capacity1) / 2 ))

# Status
status="Discharging"
[[ "$status0" == "Charging" || "$status1" == "Charging" ]] && status="Charging"
[[ "$status0" == "Full" && "$status1" == "Full" ]] && status="Full"

# Try upower (search for first valid battery time)
time=""
for bat in $(upower -e | grep battery); do
    t=$(upower -i "$bat" | awk '/time to/ {print $4, $5}')
    [[ -n "$t" ]] && { time="$t"; break; }
done

# Fallback to acpi
if [[ -z "$time" || "$time" == "n/a" ]]; then
    if command -v acpi >/dev/null; then
        # Look for first "Discharging" battery
        time=$(acpi -b | awk -F', ' '/Discharging/ {print $3; exit}')
    fi
fi

[[ -z "$time" ]] && time="unknown"

# Toggle mode
if [[ "$ACTION" == "toggle" ]]; then
    if [[ -f "$FLAG" ]]; then
        rm "$FLAG"
    else
        touch "$FLAG"
    fi
    exit 0  # exit without printing so we don’t double-update
fi

# Output based on flag state
if [[ -f "$FLAG" ]]; then
    echo " ${total}% ($status, $time)"
else
    echo " ${total}%"
fi
