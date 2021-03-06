#!/usr/bin/env bash

# create directory and enter it
mcd() {
  mkdir -p "$1";
  cd "$1";
}

# move up through directories faster
up() {
  cd $(eval printf '../'%.0s {1..$1})
}

# enter into a directory and list its content
cls() {
  cd "$1";
  ll;
}

# backup a file
backup() {
  cp "$1"{,.bak};
}

md5check() {
  md5sum "$1" | grep "$2";
}

# Determine size of a file or total size of a directory
function fs() {
    if du -b /dev/null > /dev/null 2>&1; then
        local arg=-sbh;
    else
        local arg=-sh;
    fi
    if [[ -n "$@" ]]; then
        du $arg -- "$@";
    else
        du $arg .[^.]* *;
    fi;
}

# Yii2 Command Line
yii() {
  if [[ $1 == "generate" || $1 == "make" ]]; then
    case "$2" in
      "controller") command php yii gii/controller ${@:3} ;;
      "crud") command php yii gii/crud ${@:3} ;;
      "extension") command php yii gii/extension ${@:3} ;;
      "form") command php yii gii/form ${@:3} ;;
      "model") command php yii gii/model ${@:3} ;;
      "module") command php yii gii/module ${@:3} ;;
      "migration") command php yii migrate/create --interactive=0 ${@:3} ;;
      *) command php yii help gii ;;
    esac
  elif [[ $1 == "migrate" ]]; then
    case "$2" in
      "up") command php yii migrate/up ${@:3} --interactive=0 ;;
      "rollback") command php yii migrate/down ${3:-1} ;;
      "history") command php yii migrate/history ;;
      *) command php yii migrate/up ${@:2} --interactive=0 ;;
    esac
  else
    if [[ -z "$1" || $1 == '--help' ]]; then
        command php yii help
    else
        command php yii $1
    fi
  fi
}
