#!/usr/bin/env bash

# Ask for the administrator password upfront
sudo -v

#===============================================================================
# General
#===============================================================================

# Check for software updates daily, not just once per week
defaults write com.apple.SoftwareUpdate ScheduleFrequency -int 1

# Set standby delay to 24 hours (default is 1 hour)
sudo pmset -a standbydelay 86400

# Disable the sound effects on boot
sudo nvram SystemAudioVolume=" "

#===============================================================================
# Screen
#===============================================================================

# Restart automatically if the computer freezes
sudo systemsetup -setrestartfreeze on

# Never go into computer sleep mode
systemsetup -setcomputersleep Off > /dev/null

# Require password immediately after sleep or screen saver begins
defaults write com.apple.screensaver askForPassword -int 1
defaults write com.apple.screensaver askForPasswordDelay -int 0

#===============================================================================
# Finder
#===============================================================================

# Allow quitting via ⌘ + Q; doing so will also hide desktop icons
defaults write com.apple.finder QuitMenuItem -bool true

# Show Path bar in Finder
defaults write com.apple.finder ShowPathbar -bool true

# Show Status bar in Finder
defaults write com.apple.finder ShowStatusBar -bool true

# Show hidden files by default
defaults write com.apple.finder AppleShowAllFiles -bool true

# Show all filename extensions
defaults write NSGlobalDomain AppleShowAllExtensions -bool true

# Show status bar
defaults write com.apple.finder ShowStatusBar -bool true

# Show path bar
defaults write com.apple.finder ShowPathbar -bool true

# Expand save panel by default
defaults write NSGlobalDomain NSNavPanelExpandedStateForSaveMode -bool true

# Automatically open a new Finder window when a volume is mounted
defaults write com.apple.frameworks.diskimages auto-open-ro-root -bool true
defaults write com.apple.frameworks.diskimages auto-open-rw-root -bool true
defaults write com.apple.finder OpenWindowForNewRemovableDisk -bool true

# Avoid creating .DS_Store files on network volumes
defaults write com.apple.desktopservices DSDontWriteNetworkStores -bool true

# Display full POSIX path as Finder window title
defaults write com.apple.finder _FXShowPosixPathInTitle -bool true

# Disable the warning when changing a file extension
defaults write com.apple.finder FXEnableExtensionChangeWarning -bool false

# Enable spring loading for directories
defaults write NSGlobalDomain com.apple.springing.enabled -bool true

# Remove the spring loading delay for directories
defaults write NSGlobalDomain com.apple.springing.delay -float 0.5

#===============================================================================
# Dock
#===============================================================================

# Make Dock icons of hidden applications translucent
defaults write com.apple.dock showhidden -bool true

# Remove the auto-hiding Dock delay
defaults write com.apple.dock autohide-delay -float 0

# Speed up animation when hiding/showing the Dock
defaults write com.apple.dock autohide-time-modifier -float 0.3

# Reset Launchpad
find ~/Library/Application\ Support/Dock -name "*.db" -maxdepth 1 -delete

#===============================================================================
# Safari
#===============================================================================

# Prevent Safari from opening ‘safe’ files automatically after downloading
defaults write com.apple.Safari AutoOpenSafeDownloads -bool false

# Allow hitting the Backspace key to go to the previous page in history
defaults write com.apple.Safari com.apple.Safari.ContentPageGroupIdentifier.WebKit2BackspaceKeyNavigationEnabled -bool true

# Hide Safari’s bookmarks bar by default
defaults write com.apple.Safari ShowFavoritesBar -bool false

# Hide Safari’s sidebar in Top Sites
defaults write com.apple.Safari ShowSidebarInTopSites -bool false

# Disable Safari’s thumbnail cache for History and Top Sites
defaults write com.apple.Safari DebugSnapshotsUpdatePolicy -int 2

# Make Safari’s search banners default to Contains instead of Starts With
defaults write com.apple.Safari FindOnPageMatchesWordStartsOnly -bool false

# Enable the Develop menu and the Web Inspector in Safari
defaults write com.apple.Safari IncludeDevelopMenu -bool true
defaults write com.apple.Safari WebKitDeveloperExtrasEnabledPreferenceKey -bool true
defaults write com.apple.Safari com.apple.Safari.ContentPageGroupIdentifier.WebKit2DeveloperExtrasEnabled -bool true

# Enable debug menu
defaults write com.apple.Safari IncludeInternalDebugMenu -bool true

#===============================================================================
# Google Chrome
#===============================================================================

# Disable swipe navigation gestures
defaults write com.google.Chrome AppleEnableSwipeNavigateWithScrolls -bool FALSE

#===============================================================================
# Activity monitor
#===============================================================================

# Show the main window when launching Activity Monitor
defaults write com.apple.ActivityMonitor OpenMainWindow -bool true

# Visualize CPU usage in the Activity Monitor Dock icon
defaults write com.apple.ActivityMonitor IconType -int 5

# Show all processes in Activity Monitor
defaults write com.apple.ActivityMonitor ShowCategory -int 0

# Sort Activity Monitor results by CPU usage
defaults write com.apple.ActivityMonitor SortColumn -string "CPUUsage"
defaults write com.apple.ActivityMonitor SortDirection -int 0

#===============================================================================
# Other
#===============================================================================

# Change where screenshots are saved
defaults write com.apple.screencapture location ~/Pictures/Screenshots

# Take screenshots without window shadows
defaults write com.apple.screencapture disable-shadow -bool true

#===============================================================================
# Kill affected applications
#===============================================================================

for app in "Safari" "Dock" "Finder" "SystemUIServer"; do
  killall "${app}" > /dev/null 2>&1
done
