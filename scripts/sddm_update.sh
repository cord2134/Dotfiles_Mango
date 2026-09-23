#!/bin/bash
WALLPAPER=$(cat /home/nograss/.cache/current_wallpaper)
EXT="${WALLPAPER##*.}"
SDDM_DIR="/usr/share/sddm/themes/corners"

sleep 2
source "/home/nograss/.cache/wal/colors.sh"

# Clean old backgrounds and copy new one
rm -f "$SDDM_DIR"/pywal_bg.*
cp -f "$WALLPAPER" "$SDDM_DIR/pywal_bg.$EXT"
chmod 644 "$SDDM_DIR/pywal_bg.$EXT"

# Inject the colors safely directly into SDDM
cat << EOF > "$SDDM_DIR/theme.conf.user"
[General]
BgSource="/usr/share/sddm/themes/corners/pywal_bg.$EXT"
InputColor="$background"
InputTextColor="$foreground"
InputBorderColor="$color2"
LoginButtonColor="$color4"
LoginButtonTextColor="$background"
PopupColor="$background"
PopupActiveColor="$color4"
PopupActiveTextColor="$background"
UserBorderColor="$color2"
DateColor="$foreground"
TimeColor="$foreground"
SessionButtonColor="$color2"
SessionIconColor="$background"
PowerButtonColor="$color2"
PowerIconColor="$background"
EOF

sync
