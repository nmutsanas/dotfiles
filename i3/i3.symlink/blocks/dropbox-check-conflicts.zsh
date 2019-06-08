#!/bin/zsh
function check_conflicts(){
	local dropbox_dir=~/sync/Dropbox/
	if  ls ${dropbox_dir}/**/*"s conflicted copy "* > /dev/null 2>&1; then
		echo "conflicts"
	fi
}
check_conflicts
