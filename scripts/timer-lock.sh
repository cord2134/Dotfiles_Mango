#!/bin/bash

OPTIONS="10\n15\n30\n60\nNever"
CHOICE=$(echo -e "$OPTIONS" | rofi -dmenu -p "Sleep Delay:" -theme ~/.config/mango/timer.rasi)

if [[ -n "$CHOICE" ]]; then
    echo "$CHOICE" > ~/.cache/lock_sleep_delay
    notify-send "Lock Settings" "Laptop will sleep after $CHOICE seconds."
fi
