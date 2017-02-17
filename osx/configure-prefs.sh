#!/usr/bin/env bash

# Largely inspired from https://mths.be/osx

# Ask for administrator password
sudo -v

# Set computer name
printf 'Enter computer name (leave blank to skip): '
read -r hostname
if [[ -n "$hostname" ]] ; then
  sudo scutil --set ComputerName "$hostname"
  sudo scutil --set HostName "$hostname"
  sudo scutil --set LocalHostName "$hostname"
  sudo defaults write /Library/Preferences/SystemConfiguration/com.apple.smb.server NetBIOSName -string "$hostname"
fi

# Disable sound effects on boot
# sudo nvram -d SystemAudioVolume

# Finder: list view by default
defaults write com.apple.finder FXPreferredViewStyle -string "Nlsv"

# Finder: show file extensions and don't complain when changing them
defaults write NSGlobalDomain AppleShowAllExtensions -bool true
defaults write com.apple.finder FXEnableExtensionChangeWarning -bool false

# Finder: no .DS_Store on networks
defaults write com.apple.desktopservices DSDontWriteNetworkStores -bool true

# Dock: auto-hide
defaults write com.apple.dock autohide -bool true

# Time Machine: do not prompt to use new hard drives
defaults write com.apple.TimeMachine DoNotOfferNewDisksForBackup -bool true

# Time Machine: disable local backups
hash tmutil &> /dev/null && sudo tmutil disablelocal

# Gatekeeper: disable permanently
sudo spctl --master-disable
sudo defaults write /Library/Preferences/com.apple.security GKAutoRearm -bool NO

# Apply changes
killall Finder
killall Dock
killall SystemUIServer

