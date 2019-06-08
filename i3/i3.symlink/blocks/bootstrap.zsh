#!/bin/zsh
#
# Defines some common functions for i3 blocklets
#
#

i3info() {
	if [[ -z ${1// } ]]; then 
		echo -n "";
	else
		echo -n "<span foreground=\"#5BABFF\">$1</span>";
	fi
}
i3warn(){
	if [[ -z ${1// } ]]; then 
		echo -n "";
	else
		echo -n "<span foreground=\"#FFC500\">$1</span>";
	fi
}
i3err(){
	if [[ -z ${1// } ]]; then 
		echo -n "";
	else
		echo -n "<span foreground=\"#FF0000\">$1</span>";
	fi
}
i3icon(){
	if [[ -z ${1// } ]]; then 
		echo -n "";
	else
		echo -n "<span foreground=\"#FFD64D\">$1</span>";
	fi
}
