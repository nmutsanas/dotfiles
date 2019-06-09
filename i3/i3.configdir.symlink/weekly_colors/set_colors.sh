#!/bin/zsh
set_colors(){
	readonly i3root="~/dotfiles/i3/"
	typeset -A nrToDay
	readonly nrToDay=(1 Mon 2 Tue 3 Wed 4 Thu 5 Fri 6 Sat 7 Sun);
	local today=$(date +"%a");
	if [[ "$#" -eq 1 && -n "$1" ]];		then
		echo "only 1 argument";
		today=${nrToDay[$1]}
	fi
	echo $today;
	exit 0;

	readonly active="$i3root/config.colors"
	if [[ -h "$active" || ! -f "$active" ]]; then
		if [[ -h "$active" ]]; then
			rm "$active"
		fi
		echo "Setting colors to $today"
		ln -s "$selected" "$active"
	fi 
	ln -s ${i3root}/weekly_colors/$today ${i3root}/config.colors -f
}
set_colors "$1"
