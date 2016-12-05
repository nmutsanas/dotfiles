#!/bin/zsh

separator-newline(){
	OIFS="$IFS" && IFS=$'\n' 
}

separator-restore(){
	IFS="$OIFS"
}

del_empty_dirs_with_confirmation(){
	local empty_dirs=$(find . -type d -empty | sed '/^$/d')
	local nr_empty_dirs=$(echo -n "$empty_dirs" | wc -l)
	if [[ $nr_empty_dirs -gt 0 ]]; then
		echo "Empty dirs ($nr_empty_dirs) :"
		echo "$empty_dirs"
		read -q "REPLY?Would you like to delete $nr_empty_dirs empty directories? " -n 1 -r
		echo    # (optional) move to a new line
		if [[ $REPLY =~ ^[Yy]$ ]]
		then
			find . -type d -empty -delete
			# do dangerous stuff
		fi
	else
		echo "No empty dirs found"
	fi

}

getmyip(){
	local state=$(ping -c 1 google.com &> /dev/null && echo 1 || echo 0)
	if [[ ${state} -eq 0 ]]; then
		return 1;
	fi
	local myip=$(ip addr show | grep -e "inet 192\.[0-9]*\.[0-9]*\.[0-9]*" -o | awk '{print $2}')
	echo "${myip}"
}

c() { cd ~/code/dt5/$1; }

h() { cd ~/$1; }

mkcd(){
	mkdir "$1" && cd "$1"
}

calc(){
	awk "BEGIN{ print $* }" ;
}

rev() {
	input="$1"
	reverse=""

	len=${#input}
	for (( i=$len-1; i>=0; i-- ))
	do
		reverse="$reverse${input:$i:1}"
	done

	echo "$reverse"
}

man() {
    env LESS_TERMCAP_mb=$'\E[01;31m' \
    LESS_TERMCAP_md=$'\E[01;38;5;74m' \
    LESS_TERMCAP_me=$'\E[0m' \
    LESS_TERMCAP_se=$'\E[0m' \
    LESS_TERMCAP_so=$'\E[38;5;246m' \
    LESS_TERMCAP_ue=$'\E[0m' \
    LESS_TERMCAP_us=$'\E[04;38;5;146m' \
    man "$@"
}

time_to_minutes(){
	local timestr="$1"
	local h="$(echo ${timestr} | cut -c1-2)"
	local m="$(echo ${timestr} | cut -c4-5)"
	echo $(( h * 60 + m ))
}

minutes_to_time(){
	local minutes="$1"
	local h="$(( minutes / 60 ))"
	local m="$(( minutes % 60 ))"
#	echo "$h:$m";
	printf "%02d:%02d\n" $h $m
}

