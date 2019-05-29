#!/bin/zsh
source $HOME/scripts/utils/checkhost.sh
# general path
PATH=$PATH:$HOME/scripts
PATH=$PATH:$HOME/scripts/system
PATH=$PATH:$HOME/scripts/i3
PATH=$PATH:$HOME/scripts/i3/blocks
# node modules
PATH=$PATH:/usr/local/share/npm/bin

# home path
function loadHomeEnv(){
	export PATH=$PATH:/usr/local/bin/porta-1.4.1/
	export PATH=$PATH:$HOME/npm-global/bin
	export JAVA_HOME=/usr/lib/jvm/default/
	export NODE_PATH=$NODE_PATH:/home/nikos/npm-global/lib/node_modules
	export PATH=$PATH:/opt/arduino
}
checkHome && loadHomeEnv

EDITOR=vim
PAGER=less
