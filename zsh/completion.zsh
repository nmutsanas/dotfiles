#!/bin/zsh
_c() { _files -W ~/code/ -/; }
compdef _c c

_h() { _files -W ~/ -/; }
compdef _h h
