#!/usr/bin/env bash

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
