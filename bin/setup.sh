#!/usr/bin/env bash

# Ask for the administrator password upfront
sudo -v

sh ~/dotfiles/bin/brew.sh
sh ~/dotfiles/bin/osx.sh
sh ~/dotfiles/bin/iterm.sh
sh ~/dotfiles/bin/ruby.sh
sh ~/dotfiles/bin/php.sh

#===============================================================================
# Node Version Manager (nvm)
#===============================================================================

# Install nvm
wget -qO- https://raw.githubusercontent.com/creationix/nvm/v0.33.5/install.sh | bash

# Install the latest stable node
nvm install stable

#===============================================================================
# Sublime
#===============================================================================

# Add `subl` to the command line
ln -sf /Applications/Sublime\ Text.app/Contents/SharedSupport/bin/subl /usr/local/bin/subl

# Link Sublime preferences
ln -sf ~/dotfiles/sublime/* ~/Library/Application\ Support/Sublime\ Text\ 3/Packages/User

#===============================================================================
# Other
#===============================================================================

ln -sf ~/dotfiles/.gitconfig ~/.gitconfig

source ~/.zshrc
