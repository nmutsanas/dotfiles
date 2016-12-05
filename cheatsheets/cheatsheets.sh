#!/bin/zsh
cheatsheets(){
	readonly cheatsdir=~/dotfiles/cheatsheets
	readonly action="$1";
	case ${action} in
		activate)
			local selected="$cheatsdir/$(ls "$cheatsdir/*~$0" | dmenu -i -l 50)"
			echo "Selected:$selected"
			if [[ -h "$selected" || -f "$selected" ]]; then
				local active="$cheatsdir/.active"
				if [[ -h "$active" || -f "$active" ]]; then
					if [[ -h "$active" ]]; then
						rm "$active"
					fi
					if [[ -f "$active" ]]; then
						mv "$active" "$active.bak.$RANDOM"
					fi
				fi
				ln -s "$selected" "$active"
			fi
			;;
		view)
			cat ${cheatsdir}/.active | dmenu -i -l 50
			;;
		edit)
			${EDITOR:-gvim} ${cheatsdir}/.active
			;;
		create)
			# TODO
			;;
	esac
}
cheatsheets "$@"
