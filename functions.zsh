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
