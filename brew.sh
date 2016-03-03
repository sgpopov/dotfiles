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
brew upgrade --all

# Install `wget` with IRI support.
brew install wget --with-iri
brew install git
brew install git-lfs
brew install diff-so-fancy

# Install some usefull applications like Chrome, 1Password, VLC, etc.
brew cask install '1password'
brew cask install 'atom'
brew cask install 'firefox'
brew cask install 'google-chrome'
brew cask install 'iterm2'
brew cask install 'macdown'
brew cask install 'postgres'
brew cask install 'psequel'
brew cask install 'sequel-pro'
brew cask install 'vlc'

# Remove outdated versions from the cellar.
brew cleanup
brew cask cleanup
