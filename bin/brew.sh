#!/usr/bin/env bash

# Ask for the administrator password upfront
sudo -v

# Install Homebrew if not installed
if test ! $(which brew); then
    echo "Installing homebrew"
    ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
fi

# Keep-alive: update existing `sudo` time stamp until the script has finished.
while true; do sudo -n true; sleep 60; kill -0 "$$" || exit; done 2>/dev/null &

# Make sure we’re using the latest Homebrew.
brew update

# Upgrade any already-installed formulae.
brew upgrade

# Install `wget` with IRI support.
brew install wget --with-iri
brew install git
brew install git-lfs
brew install diff-so-fancy
brew install rbenv
brew install mariadb

# Install some usefull applications like iTerm, VLC, Sequel Pro, etc.
brew cask install 'iterm2'
brew cask install 'macdown'
brew cask install 'macpass'
brew cask install 'phpstorm'
brew cask install 'postgres'
brew cask install 'psequel'
brew cask install 'sequel-pro'
brew cask install 'spectacle'
brew cask install 'sublime-text'
brew cask install 'vlc'
brew cask install 'teamviewer'
brew cask install 'virtualbox'
brew cask install 'vagrant'
brew cask install 'vagrant-manager'

# Remove outdated versions from the cellar.
brew cleanup --force -s
brew cask cleanup
