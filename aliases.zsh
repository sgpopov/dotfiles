#!/usr/bin/env bash

# Git
pull() {
  if git config remote.upstream.url > /dev/null; then
      command git pull --rebase upstream
  else
      command git pull --rebase origin
  fi
}

alias push='git push'
alias fetch='git fetch --all -p'
alias sync='pull && fetch && git-merged | grep -v "\*"'
alias branch='git checkout'
alias gcm='branch master && sync'
alias gcd='branch sprint && sync'
alias gc='git commit -m '
alias gs="git status -sb"
alias gd="git diff "
alias ga="git add "
alias gaa="git add ."
alias glog="git log --graph --pretty=format:'%Cred%h%Creset -%C(yellow)%d%Creset %s %Cgreen(%cr) %C(bold blue)<%an>%Creset' --abbrev-commit | less --tabs=1,5 -RFX"
alias last="git log --graph --pretty=format:'%Cred%h%Creset -%C(yellow)%d%Creset %s %Cgreen(%cr) %C(bold blue)<%an>%Creset' --abbrev-commit -1 | less --tabs=1,5 -RFX"
alias merge='git merge --no-ff'
alias git-undo='git reset --soft HEAD~1'
alias git-conflicted='git diff --name-only --diff-filter=U'
alias nah="git reset --hard && git clean -df"
alias git-clean="nah"
alias git-merged="git branch --merged"
alias stash='git stash --all'
alias git-append="git add . && git commit --amend --no-edit"
alias oops="git-append"
alias wip="git add . && git commit -m 'wip'"
alias cat="bat"
alias man="tldr"

# Vagrant
alias vm-start="vagrant up"
alias vm-ssh="vagrant ssh"
alias vm-stop="vagrant halt"
alias vm-status="vagrant status"
alias vm-kill="vagrant destroy"

# Laravel
alias art="php artisan"

function homestead() {
    ( cd ~/Homestead && vagrant $* )
}

# Composer
alias dump="composer dump-autoload"
alias fresh="rm -rf vendor composer.lock; composer install"
alias optimize="composer update --prefer-dist --no-dev; composer dump-autoload --optimize"
alias cdu="composer dump-autoload --optimize"

# Detect which `ls` flavor is in use
if ls --color > /dev/null 2>&1; then # GNU `ls`
  colorflag="--color"
else # OS X `ls`
  colorflag="-G"
fi

# List all files colorized in long format, including dot files
alias la="ls -lahF ${colorflag}"
alias ll="ls -liahF ${colorflag}"

# List only directories
alias lsd='ls -lhF ${colorflag} | grep "^d"'
alias ld='lsd'

# Display the directory structure recursively in a tree format.
alias tree="ls -R | grep ":$" | sed -e 's/:$//' -e 's/[^-][^\/]*\//--/g' -e 's/^/   /' -e 's/-/|/'"

# Datetimes
alias now='date +"%T"'
alias week='date +%V'
alias timestamp='date +%s'

# IP addresses
alias ip="dig +short myip.opendns.com @resolver1.opendns.com"
alias localip="ipconfig getifaddr en0"

alias update='sh ~/dotfiles/bin/update.sh'

# Apps
alias phpstorm='open -a /Applications/PhpStorm.app "`pwd`"'

# OS X specific
alias show-hidden-files="defaults write com.apple.finder AppleShowAllFiles YES; killall Finder /System/Library/CoreServices/Finder.app"
alias hide-hidden-files="defaults write com.apple.finder AppleShowAllFiles NO; killall Finder /System/Library/CoreServices/Finder.app"
