#!/usr/bin/env bash

# Init rbenv
eval "$(rbenv init -)"

ln -sf ~/dotfiles/.profile ~/.profile

source ~/.profile

# Install ruby v.2.4.2
rbenv install 2.4.2

# Set the global ruby version to 2.4.2
rbenv global 2.4.2
