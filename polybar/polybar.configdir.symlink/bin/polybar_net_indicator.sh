#!/bin/bash
#
# Show a custom network connection indicator in polybar.
# Includes code for wifi, VPN, ZeroTier, and Hamachi.
#
# Author: machaerus
# https://gitlab.com/machaerus


source ~/.config/polybar/bin/colors.sh

net_print() {

	CONNECTED_WIFI=$(iwconfig wlp3s0 | grep ESSID | wc -l)
	ESSID=$(iwconfig wlp3s0 | grep ESSID | cut -d: -f2 | xargs)
	[ "$ESSID" = "off/any" ] && CONNECTED_WIFI=0 || CONNECTED_WIFI=1
	CONNECTED_VPN=$(ifconfig -a | grep tun0 | wc -l)

	if [ "$CONNECTED_WIFI" -eq 1 ]; then
		wifi_indicator="${faded_green}${RESET}"
	else
		wifi_indicator="${dark0_soft}睊${RESET}"
	fi

	if [ "$CONNECTED_VPN" -eq 1 ]; then
		vpn_indicator="${faded_green}${RESET}"
	else
		vpn_indicator="${dark0_soft}${RESET}"
	fi

	# echo "$dark2[$wifi_indicator$dark2]$dark2[$vpn_indicator$dark2]"
	echo "$dark0_soft[ $wifi_indicator $vpn_indicator $zerotier_indicator $dark0_soft]"
	# echo " $wifi_indicator $vpn_indicator "
}

net_print


