#!/bin/bash
#
# Custom network download/upload speed indicator for polybar.
#
# Author: machaerus
# https://gitlab.com/machaerus


source ~/.config/polybar/bin/colors.sh

net_speed() {
	UP_NETSPEED=$(awk '{if(l1){printf "%6.1f", ($10-l2)/1024} else{l1=$2; l2=$10;}}' <(grep wlan0 /proc/net/dev) <(sleep 1; grep wlan0 /proc/net/dev))
	DOWN_NETSPEED=$(awk '{if(l1){printf "%6.1f", ($2-l1)/1024} else{l1=$2; l2=$10;}}' <(grep wlan0 /proc/net/dev) <(sleep 1; grep wlan0 /proc/net/dev))
	# echo "$dark0_soft [ $faded_aqua $UP_NETSPEED KB/s$RESET  $faded_green↓ $DOWN_NETSPEED KB/s$RESET $dark0_soft]"
	echo "$dark0_soft $faded_aqua  $UP_NETSPEED KB/s$RESET    $faded_green   $DOWN_NETSPEED KB/s$RESET $dark0_soft"
}

net_speed