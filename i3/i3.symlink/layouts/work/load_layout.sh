#!/bin/zsh
source ~/scripts/utils/checkhost.sh
start_work_layout(){
	checkWork || exit 0
	readonly workspaces="~/dotfiles/i3/layouts/work/"
	readonly notebook=$(detect_monitors.sh notebook)
	readonly external=$(detect_monitors.sh external)
	readonly ws1="workspace 1:α"
	readonly ws2="workspace 2:β"
	readonly ws3="workspace 3:γ"
	i3-msg ${ws1}', append_layout '${workspaces}'/workspace_1.json'
	i3-msg ${ws2}', append_layout '${workspaces}'/workspace_2.json'
	i3-msg ${ws3}', append_layout '${workspaces}'/workspace_3.json'
	i3-msg 'exec google-chrome-stable --app=https://app.wire.com'
	i3-msg 'exec /opt/intellij/idea/bin/idea.sh'
	i3-msg 'exec google-chrome-stable'
	i3-msg 'exec evolution'
	i3-msg ${ws1}', move workspace to output '${external}
	i3-msg ${ws2}', move workspace to output '${external}
	i3-msg ${ws3}', move workspace to output '${notebook}
	i3-msg ${ws3}
	sleep 2
	i3-msg ${ws2}
	sleep 1
	i3-msg ${ws1}
}
start_work_layout
