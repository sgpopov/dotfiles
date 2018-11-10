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

# Make ZSH the default shell environment
chsh -s $(which zsh)

# Install Ruby related stuff
sh $HOME/dotfiles/bin/ruby.sh

# Install PHP related stuff
sh $HOME/dotfiles/bin/php.sh

#===============================================================================
# Node Version Manager (nvm)
#===============================================================================

# Install nvm
wget -qO- https://raw.githubusercontent.com/creationix/nvm/v0.33.5/install.sh | bash

# Install the latest stable node
nvm install stable

npm install -g tldr

#===============================================================================
# Other
#===============================================================================

# Symlink the Mackup config file to the home directory
ln -s $HOME/.dotfiles/.mackup.cfg $HOME/.mackup.cfg

ln -sf $HOME/dotfiles/.gitconfig $HOME/.gitconfig

sh ~/dotfiles/bin/iterm.sh

# Removes .zshrc from $HOME (if it exists) and symlinks the .zshrc file from the .dotfiles
rm -rf $HOME/.zshrc
ln -sf $HOME/.dotfiles/.zshrc $HOME/.zshrc

# Set macOS preferences
# We will run this last because this will reload the shell
sh $HOME/dotfiles/bin/osx.sh
