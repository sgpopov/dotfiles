#!/usr/bin/env bash

# Ask for the administrator password upfront
sudo -v

# Install Homebrew if not installed
if test ! $(which brew); then
    echo "Installing homebrew"
    ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
fi

# Make sure we’re using the latest Homebrew.
brew update

# Upgrade any already-installed formulae.
brew upgrade

# Install all our dependencies with bundle (See Brewfile)
brew tap homebrew/bundle
brew bundle

# Remove outdated versions from the cellar.
brew cleanup -s
brew cask cleanup

# Make ZSH the default shell environment
chsh -s $(which zsh)

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
