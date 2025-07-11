#!/bin/bash

brightness=$(brightnessctl get)
max=$(brightnessctl max)
percent=$(( brightness * 100 / max ))

icon=""  # md-brightness-6

echo "$icon ${percent}%"
