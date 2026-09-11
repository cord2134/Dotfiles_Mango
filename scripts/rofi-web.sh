#!/bin/bash

# Open Rofi using your theme and collapse the empty listview
query=$(echo "" | rofi -dmenu \
    -config ~/.config/mango/rofi/config.rasi \
    -lines 0 \
    -p "Google / URL 󰖟 ")

# If you hit Escape and close Rofi, do nothing
if [ -z "$query" ]; then
    exit 0
fi

# If the text has a dot (like youtube.com) or says localhost, open directly
if [[ "$query" == *"."* ]] || [[ "$query" == *"localhost"* ]]; then
    firefox "https://$query"
else
    # Otherwise, perform a standard Google search
    firefox "https://www.google.com/search?q=$query"
fi
