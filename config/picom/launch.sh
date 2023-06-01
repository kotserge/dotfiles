#!/usr/bin/env bash
# Terminate already running bar instances
killall -qw picom

# Launch picom
picom --backend glx --config ~/.config/picom/picom.conf &
