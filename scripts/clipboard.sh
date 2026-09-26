#!/bin/bash

# Store temporary image previews in RAM (clears on reboot)
CACHE_DIR="/tmp/cliphist-previews"
mkdir -p "$CACHE_DIR"

# 1. Process cliphist list and extract image thumbnails
rofi_input=""
while read -r line; do
    if [[ "$line" == *"[[ binary data"* ]]; then
        # Extract the ID and create a temp image
        id=$(echo "$line" | awk '{print $1}')
        img_path="$CACHE_DIR/$id.png"
        
        # Decode the image if it doesn't exist in cache yet
        if [ ! -f "$img_path" ]; then
            echo "$line" | cliphist decode > "$img_path"
        fi
        
        # Append to list with the hidden Rofi icon syntax
        rofi_input+="${line}\x00icon\x1f${img_path}\n"
    else
        # Standard text clipboard item
        rofi_input+="${line}\n"
    fi
done < <(cliphist list)

# 2. Launch Rofi with Pywal styling and icons enabled
selected=$(echo -e "$rofi_input" | rofi -dmenu -i -show-icons \
    -theme-str 'element-icon { size: 6em; }' \
    -config ~/.config/mango/rofi/config.rasi \
    -p "󰅌 Clipboard")

# 3. Decode and copy the selection to the active clipboard
if [ -n "$selected" ]; then
    echo "$selected" | cliphist decode | wl-copy
fi
