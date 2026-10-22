#!/usr/bin/env bash
export PATH="/usr/local/bin:/usr/local/sbin:/usr/bin:/bin:/usr/sbin:/sbin:/usr/local/git/bin"
export PATH="$HOME/.yarn/bin:$HOME/.config/yarn/global/node_modules/.bin:$PATH"
export PATH="$PATH:$HOME/.composer/vendor/bin"
export PATH="/opt/homebrew/share/google-cloud-sdk/bin:$PATH"

# Set default installation location used when issuing "brew cask install"
export HOMEBREW_CASK_OPTS="--appdir=/Applications"

# Make Sublime the default editor.
export EDITOR="code";

# Prefer US English and use UTF-8.
export LANG="en_US.UTF-8";
export LC_ALL="en_US.UTF-8";

# Prefix "alias-tips" messages
export ZSH_PLUGINS_ALIAS_TIPS_TEXT="Alias tip: "

PHP_AUTOCONF="/usr/local/bin/autoconf"
