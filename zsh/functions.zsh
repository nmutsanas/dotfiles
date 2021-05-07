#!/bin/zsh
cdl() {
	cd "$@"
	if [[ "$?" == 0 ]]; then
		ls -al
	fi
}
bak(){
	cp "$1" "$1.bak"
}

getmyip(){
	local state=$(ping -c 1 google.com &> /dev/null && echo 1 || echo 0)
	if [[ ${state} -eq 0 ]]; then
		return 1;
	fi
	local myip=$(ip addr show | grep -e "inet 192\.[0-9]*\.[0-9]*\.[0-9]*" -o | awk '{print $2}')
	echo "${myip}"
}

c() { cd ~/code/$1; }

h() { cd ~/$1; }

mkcd(){
	mkdir "$1" && cd "$1"
}

# simple calculator
#calc(){
#	awk "BEGIN{ print $* }" ;
# }

# pygmentized less
pretty() {
	pygmentize -f terminal "$1" | less -R
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


feedback() {
	local msg="$@"
	[[ $- == *i* ]] && echo "$msg" || notify-send "$msg"
}

border(){
	title="| $@ |"
	edge=$(echo "$title" | sed 's/./-/g' | sed 's/^.\(.*\).$/+\1+/g')
	echo "$edge"
	echo "$title"
	echo "$edge"
}
