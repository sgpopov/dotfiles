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

videoToGif() {
    # Based on https://gist.github.com/SheldonWangRJT/8d3f44a35c8d1386a396b9b49b43c385
    output_file="${1%.*}.gif"

    ffmpeg -y -i "$1" -v quiet -vf scale=iw/2:ih/2 -pix_fmt rgb8 -r 10 "$output_file" && gifsicle -O3 "$output_file" -o "$output_file"
}