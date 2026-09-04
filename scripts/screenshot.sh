#!/bin/bash

# Create a Screenshots folder in your Pictures directory
mkdir -p ~/Pictures/Screenshots

# Generate a filename with the current date and time
FILE=~/Pictures/Screenshots/screenshot_$(date +'%Y-%m-%d_%H-%M-%S').png

# Let the user drag a box (slurp), capture it (grim), and save it
grim -g "$(slurp)" "$FILE"

# Copy the image file to the Wayland clipboard
wl-copy < "$FILE"

# Send a system notification showing the captured image
notify-send "Screenshot Taken" "Saved to Pictures and copied to clipboard." -i "$FILE"
