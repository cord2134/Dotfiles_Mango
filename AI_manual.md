# MangoWM Desktop Environment - User Manual

Welcome to MangoWM, a custom, lightweight Wayland compositor built on top of `dwl` and `wlroots` for Arch Linux. This system is designed for speed, keyboard-driven navigation, and minimal resource usage.

## ⌨️ Core Keyboard Shortcuts
Use the `Super` (Windows) key in combination with other keys to navigate the desktop:

### System & Launchers
* **Super + Enter**: Open the terminal (Alacritty).
* **Super + D**: Open the application launcher (Rofi).
* **Super + W**: Open the web link launcher menu (Rofi).
* **Super + P**: Open the Display Manager to configure dual monitors (Project, Extend, or Clone).
* **Super + V**: Open clipboard history (`cliphist`).
* **Super + PrtSc**: Take a screenshot (Press `Escape` to cancel).
* **Super + Shift + R**: Reload and refresh all scripts/configurations.
* **Super + L**: Lock the screen.
* **Super + Shift + L**: Change the sleep timer for the screen lock.
* **Super + M**: Quit MangoWM and log out of the session.
* **Super + Escape**: Force-close the Eww calendar popup widget.

### Window Management & Workspaces
* **Super + Q**: Close the currently active window or application.
* **Super + Tab**: Show the full stack of windows currently open.
* **Super + Left/Right/Up/Down**: Switch focus to the adjacent window in that direction.
* **Super + F**: Toggle fullscreen on/off for the active window.
* **Super + I**: Minimize the currently active window.
* **Super + Shift + I**: Restore a minimized window.
* **Super + N**: Change the window layout (toggle between scroller or tile).
* **Super + 1-9**: Switch to the corresponding workspace (1 through 9).
* **Super + Shift + 1-9**: Move the currently active window to a different workspace (1 through 9).
* **Super + Left Click & Drag**: Move floating windows around the screen.
* **Super + Right Click & Drag**: Resize windows manually.

### Gaps & Aesthetics
* **Super + Shift + G**: Toggle gaps between windows on/off.
* **Super + Shift + X**: Increase the gaps between windows and the screen edge.
* **Super + Shift + Z**: Decrease the gaps between windows and the screen edge.

### Hardware & Media Controls
* **Media Keys (F-keys)**: Your standard laptop volume up, volume down, mute, and brightness controls work out of the box.

## 🧩 Core System Components
If you want to swap out or troubleshoot a specific part of the desktop, here are the background tools making it work:
* **MangoWM**: The core window manager that handles placing and rendering all application windows. 
* **Waybar**: The top status panel that displays workspaces, battery, clock, and system tray.
* **Eww (Elkowar's Wacky Widgets)**: The engine used to render the smooth, animated calendar popup when you click the clock in Waybar.
* **Rofi**: The floating menu engine used for the application launcher, web search history, and display switcher.
* **wlr-randr**: The underlying backend tool used to detect and position external monitors.
* **Alacritty**: The default, GPU-accelerated terminal emulator.
* **swaybg / swww**: The background daemon responsible for drawing and switching your desktop wallpapers.
* **cliphist**: The background daemon that remembers your copied text and images.
* **dunst / mako**: The notification daemon responsible for showing pop-ups when you get an alert.

## 📁 Where Configurations Are Stored
If you need to tweak the system, here is exactly where the configuration files live:
* **Environment Variables**: `~/.config/mango/config.conf`
* **Autostart Script**: `~/.config/mango/autostart.sh`
* **Keyboard Shortcuts**: `~/.config/mango/bind.conf`
* **Waybar Styling & Layout**: `~/.config/mango/waybar/` (Specifically `config.jsonc` and `style.css`)
* **Calendar Widget UI**: `~/.config/eww/`
* **Rofi Themes & Scripts**: `~/.config/mango/rofi/` and `~/.config/mango/scripts/`
* **Pywal Colors**: `~/.cache/wal/` (This folder automatically updates when you change themes).
* **SDDM Login Screen Theme**: `/usr/share/sddm/themes/corners/` 
* **SDDM Custom Colors/Wallpaper**: `/usr/share/sddm/themes/corners/theme.conf.user` (Modify this file to safely change your login screen background and accent colors without breaking the base theme).