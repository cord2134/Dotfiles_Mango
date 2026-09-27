#!/bin/bash

# 1. Define where to store the search history
HISTORY_FILE="$HOME/.cache/rofi_web_history"
touch "$HISTORY_FILE"

# 2. Feed history to Rofi (tac reverses it so newest is at the top, awk removes duplicates)
query=$(tac "$HISTORY_FILE" | awk '!seen[$0]++' | rofi -dmenu \
    -config ~/.config/mango/rofi/config.rasi \
    -p "Google / URL 󰖟 ")

# 3. If you hit Escape and close Rofi, do nothing
if [ -z "$query" ]; then
    exit 0
fi

# 4. Save the valid query to history and limit the file to 100 lines to prevent bloat
echo "$query" >> "$HISTORY_FILE"
tail -n 100 "$HISTORY_FILE" > "${HISTORY_FILE}.tmp" && mv "${HISTORY_FILE}.tmp" "$HISTORY_FILE"

# 5. Route the query (URL vs Search)
if [[ "$query" == http* ]]; then
    # If the user explicitly typed http:// or https://
    firefox "$query"
elif [[ "$query" == *"."* ]] || [[ "$query" == *"localhost"* ]]; then
    # If it looks like a domain name
    firefox "https://$query"
else
    # Otherwise, perform a standard Google search
    firefox "https://www.google.com/search?q=$query"
fi
