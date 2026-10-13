#!/bin/bash

REPO_URL="https://github.com/cord2134/Dotfiles_mango.git"
REPO_DIR="$HOME/Documents/mango"
CONFIG_DIR="$HOME/.config"

echo "Starting MangoWM Installation..."

if ! command -v git &> /dev/null; then
    echo "Installing git..."
    sudo pacman -S --noconfirm git
fi

if [ ! -d "$REPO_DIR" ]; then
    echo "MangoWM not found locally. Cloning from GitHub..."
    mkdir -p "$HOME/Documents"
    git clone "$REPO_URL" "$REPO_DIR"
else
    echo "MangoWM already exists. Pulling latest updates..."
    cd "$REPO_DIR" && git pull
fi

echo "Checking for yay..."
if ! command -v yay &> /dev/null; then
    echo "yay not found. Installing yay..."
    sudo pacman -S --needed --noconfirm base-devel git
    git clone https://aur.archlinux.org/yay.git /tmp/yay
    cd /tmp/yay
    makepkg -si --noconfirm
    cd "$REPO_DIR" 
fi

echo "Installing core dependencies via yay..."
yay -S --needed --noconfirm hyprland foot rofi eww waybar cliphist swaybg sddm glow

echo "Ensuring target directories exist..."
mkdir -p "$CONFIG_DIR/mango"
mkdir -p "$CONFIG_DIR/foot"
mkdir -p "$CONFIG_DIR/eww"

echo "Linking core MangoWM files..."
ln -sf "$REPO_DIR/config.conf" "$CONFIG_DIR/mango/config.conf"
ln -sf "$REPO_DIR/bind.conf" "$CONFIG_DIR/mango/bind.conf"
ln -sf "$REPO_DIR/rule.conf" "$CONFIG_DIR/mango/rule.conf"
ln -sf "$REPO_DIR/env.conf" "$CONFIG_DIR/mango/env.conf"
ln -sf "$REPO_DIR/autostart.sh" "$CONFIG_DIR/mango/autostart.sh"
ln -sf "$REPO_DIR/AI_manual.md" "$CONFIG_DIR/mango/AI_manual.md"

echo "Linking component folders..."
ln -sfn "$REPO_DIR/scripts" "$CONFIG_DIR/mango/scripts"
ln -sfn "$REPO_DIR/rofi" "$CONFIG_DIR/mango/rofi"
ln -sfn "$REPO_DIR/waybar" "$CONFIG_DIR/mango/waybar"
ln -sfn "$REPO_DIR/swaync" "$CONFIG_DIR/mango/swaync"
ln -sfn "$REPO_DIR/wlogout" "$CONFIG_DIR/mango/wlogout"
ln -sfn "$REPO_DIR/wal" "$CONFIG_DIR/mango/wal"

chmod +x "$REPO_DIR/scripts/"*.sh
chmod +x "$REPO_DIR/autostart.sh"

echo "Linking external UI tools..."
ln -sfn "$REPO_DIR/eww" "$CONFIG_DIR/eww"
ln -sfn "$REPO_DIR/fastfetch" "$CONFIG_DIR/fastfetch"
ln -sf "$REPO_DIR/foot/foot.ini" "$CONFIG_DIR/foot/foot.ini"

echo "Applying SDDM theme override..."
if [ -f "$REPO_DIR/sddm/theme.conf.user" ]; then
    sudo mkdir -p /usr/share/sddm/themes/corners/
    sudo cp "$REPO_DIR/sddm/theme.conf.user" "/usr/share/sddm/themes/corners/theme.conf.user"
    sudo systemctl enable sddm.service
    echo "SDDM theme applied."
fi

echo "Adding MangoWM to the display manager sessions..."
sudo mkdir -p /usr/share/wayland-sessions/
sudo cp "$REPO_DIR/mangowm.desktop" "/usr/share/wayland-sessions/mangowm.desktop"

echo "Dotfiles loaded"
