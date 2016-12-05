#!/bin/zsh
source $HOME/scripts/utils/checkhost.sh
# general path
PATH=$PATH:$HOME/scripts/
PATH=$PATH:$HOME/scripts/dc/
PATH=$PATH:$HOME/scripts/system/
# work path
function loadWorkEnv(){
	# java
	export JAVA_HOME=/usr/lib/jvm/default/
	export NODE_JS_HOME=/usr/bin/
	# citrix
	export ICAROOT=/opt/Citrix/ICAClient
	# maven
	export M2_HOME=/opt/maven
	export M2=$M2_HOME/bin
	# dt5 db
	export DT5_DB_YAML=/srv/utils/active-db.yaml
	export DT5_DB_KEY="dt5db"
	# path
	export PATH=$M2:$PATH
	export PATH=$PATH:$HOME/scripts/dc/
}
# home path
function loadHomeEnv(){
	export PATH=$PATH:/usr/local/bin/porta-1.4.1/
	export PATH=$PATH:$HOME/npm-global/bin
	export JAVA_HOME=/usr/lib/jvm/default/
	export NODE_PATH=$NODE_PATH:/home/nikos/npm-global/lib/node_modules
	export PATH=$PATH:/opt/arduino/
}
checkWork && loadWorkEnv
checkHome && loadHomeEnv

EDITOR=vim
setopt HIST_IGNORE_SPACE
