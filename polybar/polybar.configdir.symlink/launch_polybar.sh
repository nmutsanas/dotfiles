#!/usr/bin/env sh

## Add this to your wm startup file.

# Terminate already running bar instances
pkill polybar

# Wait until the processes have been shut down
#while pgrep -u $UID -x polybar >/dev/null; do sleep 1; done
sleep 1

rm /tmp/polybar*
rm /tmp/ipc-polybar*
# Launch bar1 and bar2
polybar --reload -c ~/.config/polybar/config.ini main &
ln -s /tmp/polybar_mqueue.$! /tmp/ipc-polybar-top
polybar --reload -c ~/.config/polybar/config_bottom.ini main &
ln -s /tmp/polybar_mqueue.$! /tmp/ipc-polybar-bottom
#polybar --reload -c ~/.config/polybar/config_monitor_2.ini main &

# Hide the bottom bar by default. Can be toggled with a shortcut.
sleep 1
echo cmd:hide > /tmp/ipc-polybar-bottom
