#!/usr/bin/sh

dir="$HOME/.config/waybar"

launch_bar() {
    killall waybar
    while pgrep waybar > /dev/null; do killall waybar; done
    waybar -c "$dir/config-sway.jsonc" -s "$dir/rounded-sway.css" &
}

launch_bar
