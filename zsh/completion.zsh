#!/bin/zsh
_activate_dt5_db(){
	_alternative "dbs:available databases:($(list-mysql-dbs))"
}
compdef _activate_dt5_db activate_dt5_db

_c() { _files -W ~/code/ -/; }
compdef _c c

_h() { _files -W ~/ -/; }
compdef _h h
