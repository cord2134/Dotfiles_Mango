# MangoWM Desktop Environment - User Manual

Welcome to MangoWM, a custom, lightweight Wayland compositor built on top of `dwl` and `wlroots` for Arch Linux. This system is designed for speed, keyboard-driven navigation, and minimal resource usage.

## ⌨️ Core Keyboard Shortcuts
Use the `Super` (Windows) key in combination with other keys to navigate the desktop:

* **Super + m**: To quit/logout from mango 
* **Super + D**: Open the application launcher (Rofi).
* **Super + W**: Opens another menu which will directly open links in the browser
* **Super + Enter**: Open the terminal (Alacritty).
* **Super + Q**: Close the currently active window or application.
* **Super + P**: For multiple screens or if multiple external monitors are connected has the option to project, extend and clone 
* **Super + Shift + R**: Reloads and refreshes all the scripts
* **Super + l**: Screen Lock
* **Super + Shift + l**: To change the timer for sleep for lock
* **Super + Tab**: To show the full stack of windows currently in the mango
* **Super + left,right,up,down**: To switch focus to next or right or upper or down window
* **Super + f**: To toggle fullscreen (on/off)
* **Super + i**: To minimize current active screen
* **Super + Shift + i**: To restor minimized screen
* **Super + prtsc**: To take screenshot(esacape to cancel screenshot)
* **Super + v**: To view clipboard
* **Super + n**: To change layout(scroller or tile)
* **Super + 1-9**: To view the corresponding workspace 
* **Super + Shift + X**: To increase the gaps between windows and screen
* **Super + Shift + Z**: To decrease the gaps between windows and screen
* **Super + Shift + R**: To toggle gaps between windows


## 🧩 Core System Components
* **MangoWM**: The window manager that handles placing and rendering windows. 
* **Waybar**: The top status bar that displays workspaces, battery, clock, and system tray.
* **Eww (Elkowar's Wacky Widgets)**: The engine used to render the smooth, animated calendar popup when you click the clock in Waybar.
* **Rofi**: The floating menu engine used for the application launcher, web search history, and display switcher.
* **wlr-randr**: The underlying backend tool used to detect and position external monitors.

## 📁 Where Configurations Are Stored
If you need to tweak the system, here is where the configuration files live:
* **Keyboard Shortcuts**: `~/.config/mango/config.d/30-keybinds.conf`
* **Waybar Styling & Layout**: `~/.config/mango/waybar/` (Specifically `config.jsonc` and `style.css`)
* **Calendar Widget UI**: `~/.config/eww/`
* **Rofi Themes & Scripts**: `~/.config/mango/rofi/` and `~/.config/mango/scripts/`
