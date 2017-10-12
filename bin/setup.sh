#!/usr/bin/env bash

# Ask for the administrator password upfront
sudo -v

sh ~/dotfiles/bin/brew.sh

#===============================================================================
# iTerm
#===============================================================================

# Set iTerm colors
open "${HOME}/dotfiles/iterm/colors.itermcolors"

# Don’t display the annoying prompt when quitting iTerm
defaults write com.googlecode.iterm2 PromptOnQuit -bool false

# Install oh-my-zsh
sh -c "$(wget https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh -O -)"

# Install "alias-tips" plugin
git clone https://github.com/djui/alias-tips.git ${ZSH_CUSTOM1:-$ZSH/custom}/plugins/alias-tips

# Place the .zshrc in home directory
ln -sf ~/dotfiles/.zshrc ~/.zshrc

source ~/.zshrc

#===============================================================================
# Ruby environment (rbenv)
#===============================================================================

# Init rbenv
eval "$(rbenv init -)"

source ~/.profile

# Install ruvy v.2.4.2
rbenv install 2.4.2

# Set the global ruby version to 2.4.2
rbenv global 2.4.2

#===============================================================================
# Node Version Manager (nvm)
#===============================================================================

# Install nvm
wget -qO- https://raw.githubusercontent.com/creationix/nvm/v0.33.5/install.sh | bash

# Install the latest stable node
nvm install stable

#===============================================================================
# Composer
#===============================================================================

EXPECTED_SIGNATURE=$(wget -q -O - https://composer.github.io/installer.sig)

php -r "copy('https://getcomposer.org/installer', 'composer-setup.php');"

ACTUAL_SIGNATURE=$(php -r "echo hash_file('SHA384', 'composer-setup.php');")

if [ "$EXPECTED_SIGNATURE" != "$ACTUAL_SIGNATURE" ] then
    >&2 echo 'ERROR: Invalid composer installer signature'
else
    php composer-setup.php --quiet

    mv composer.phar /usr/local/bin/composer
fi

rm composer-setup.php

#===============================================================================
# Sublime
#===============================================================================

# Add `subl` to the command line
ln -sf /Applications/Sublime\ Text.app/Contents/SharedSupport/bin/subl /usr/local/bin/subl

# Link Sublime preferences
ln -sf ~/dotfiles/sublime/* ~/Library/Application\ Support/Sublime\ Text\ 3/Packages/User
