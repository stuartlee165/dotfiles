#!/bin/sh
xrandr --output eDP-1 --mode 1366x768 --pos 2560x336 --rotate normal --output DP-1 --off --output HDMI-1 --primary --mode 2560x1440 --pos 0x0 --rotate normal --output DP-2 --off --output HDMI-2 --off
feh bg --bg-fill $HOME/.config/i3/feh/lofi_room.jpg 
