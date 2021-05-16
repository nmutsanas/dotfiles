#!/usr/bin/env sh

## Add this to your wm startup file.

# Terminate already running bar instances
pkill polybar

# Wait until the processes have been shut down
#while pgrep -u $UID -x polybar >/dev/null; do sleep 1; done
sleep 1

rm /tmp/polybar*
rm /tmp/ipc-polybar*
# Launch bars and symlink sockets

polybar --reload -c ~/.config/polybar/config.ini top &
ln -s /tmp/polybar_mqueue.$! /tmp/ipc-polybar-top

polybar --reload -c ~/.config/polybar/config.ini bottom &
ln -s /tmp/polybar_mqueue.$! /tmp/ipc-polybar-bottom

# Hide the bottom bar by default. Can be toggled with a shortcut.
sleep 1
#echo cmd:hide > /tmp/ipc-polybar-bottom
