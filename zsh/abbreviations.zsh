#!/bin/zsh
setopt extendedglob
typeset -Ag abbreviations
abbreviations=(
  "alljava" "**/*.java"
  "allxml" "**/*.xml"
  "fhere" "find . -name \"*"
  "xmlsel" "xmlstarlet sel -t -v"
  "search" "grep  **/*(.) -e"
  "ssearch" "grep ~/{scripts,dot}*/**/*(.) -e"
  "Im"    "| more"
  "Ia"    "| awk"
  "Ig"    "| grep -i"
  "Ieg"   "| egrep"
  "Iag"   "| agrep"
  "Igr"   "| groff -s -p -t -e -Tlatin1 -mandoc"
  "Ip"    "| $PAGER"
  "Ih"    "| head"
  "Ik"    "| keep"
  "It"    "| tail"
  "Is"    "| sort"
  "Iv"    "| ${VISUAL:-${EDITOR}}"
  "Iw"    "| wc"
  "Ic"    "| wc -l"
  "Ix"    "| xargs"
  "Ijson" "| jq '.' | pygmentize -l json"
  "Ixml"  "| xmlstarlet fo | pygmentize -l xml"
  "pomxml" "xml sel -N my=http://maven.apache.org/POM/4.0.0 -t -v /my:project/my:"
  "scriptify" "fc -l -1 | cut -c 8- >"
  "stripcomments" "| grep -v \"^$\" | grep -v \"^#.*$\""
  "removecolors" "| sed -r \"s/\x1B\[([0-9]{1,2}(;[0-9]{1,2})?)?[m|K]//g\""
  "backslash" "\\"
)

magic-abbrev-expand() {
    local MATCH
    LBUFFER=${LBUFFER%%(#m)[_a-zA-Z0-9]#}
    LBUFFER+=${abbreviations[$MATCH]:-$MATCH}
    zle self-insert
}

no-magic-abbrev-expand() {
  LBUFFER+=' '
}

zle -N magic-abbrev-expand
zle -N no-magic-abbrev-expand
bindkey " " magic-abbrev-expand
bindkey "^z" magic-abbrev-expand
bindkey -M isearch " " self-insert

