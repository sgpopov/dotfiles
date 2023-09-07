#!/usr/bin/env bash

set -e

# Ask for the administrator password upfront.
sudo -v

# OSX
sudo softwareupdate -i -a

# Homebrew
brew update
brew upgrade
brew cleanup -s
rm -rfv $(brew --cache)/*
brew tap --repair
brew doctor

# NPM
npm update npm -g

for package in $(npm -g outdated --parseable --depth=0 | cut -d: -f2)
do
    npm --global install --quiet "${package}"
done

# Revoke sudo access again.
sudo -k

source ~/.zshrc
