#!/bin/zsh

# better defaults
alias qiv='qiv -tf'
alias ll='ls -lah'
alias du='du -h'
alias nemo='nemo --no-desktop'
alias tldr='tldr -t base16'
alias watch='watch --color'

# skip shell history
alias rm=' rm'
alias ls=' ls --color=auto'

# add some color
alias mvn='grc mvn'

# xclip with clipboard, not selection
alias xclipc='xclip -selection clipboard'

# date related
alias todaynr="date +'%u'" # 1=Monday, ..., 7=Sunday

# general
alias -g ...='../..'
alias -g ....='../../..'
alias -g .....='../../../..'

alias mp3dl="cd $HOME/music && youtube-dl --extract-audio -f bestaudio --audio-format mp3 --no-playlist"

alias webshare="python -m http.server 1234"
alias vidduration="ffprobe -v error -show_entries format=duration -of default=noprint_wrappers=1:nokey=1"

# date formats quick reference
alias dateh='date --help|sed -n "/^ *%%/,/^ *%Z/p"|while read l;do date +\ %${l/% */}:\|" |${l/% */}|${l#* }";done|column -s"|" -t'
alias today="last | grep \"boot\" | grep \"$(date +'%a %b %_d')\""
alias -g tdate="$(date +'%Y-%m-%d')"

# meta
alias reload="source ~/.zshrc"
alias editalias="$EDITOR ${ZSH_HOME}/aliases.zsh"
alias editfunctions="$EDITOR ${ZSH_HOME}/functions.zsh"
alias editenv="$EDITOR ${ZSH_HOME}/env.zsh"
alias editabbrev="$EDITOR ${ZSH_HOME}/abbreviations.zsh"
alias editprofile="$EDITOR ~/.zshrc"

# data formatting
alias -g pxml="| xmlstarlet fo | pygmentize -l xml"
alias -g pjson="| json_pp | pygmentize -l json"

# format from clipboard
alias xjson="xclip -o | json_pp | pygmentize -l json"
alias xxml="xclip -o | xmlstarlet fo - | pygmentize -l xml"
alias playsg="echo /tmp/*.(mkv|mp4)(.om[1]) | xclip -i && mplayer /tmp/*.(mp4|mkv)(.om[1])"
