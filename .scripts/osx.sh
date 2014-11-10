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
sudo nvram -d SystemAudioVolume

# Finder: hide all icons
defaults write com.apple.finder ShowExternalHardDrivesOnDesktop 0
defaults write com.apple.finder ShowHardDrivesOnDesktop 0
defaults write com.apple.finder ShowMountedServersOnDesktop 0
defaults write com.apple.finder ShowRemovableMediaOnDesktop 0

# Finder: list view by default
defaults write com.apple.finder FXPreferredViewStyle -string "Nlsv"

# Finder: show file extensions and don't complain when changing them
defaults write NSGlobalDomain AppleShowAllExtensions -bool true
defaults write com.apple.finder FXEnableExtensionChangeWarning -bool false

# Finder: show ~/Library
# chflags nohidden ~/Library

# Finder: no .DS_Store on networks
defaults write com.apple.desktopservices DSDontWriteNetworkStores -bool true

# Menu bar: disable transparency
defaults write NSGlobalDomain AppleEnableMenuBarTransparency -bool false

# Menu bar: disable unwanted icons
defaults write ~/Library/Preferences/ByHost/com.apple.systemuiserver.* dontAutoLoad -array \
   "/System/Library/CoreServices/Menu Extras/TimeMachine.menu" \
   "/System/Library/CoreServices/Menu Extras/Volume.menu"
#   "/System/Library/CoreServices/Menu Extras/User.menu"
# defaults write com.apple.systemuiserver menuExtras -array \
#   "/System/Library/CoreServices/Menu Extras/AirPort.menu" \
#   "/System/Library/CoreServices/Menu Extras/Bluetooth.menu" \
#   "/System/Library/CoreServices/Menu Extras/Battery.menu" \
#   "/System/Library/CoreServices/Menu Extras/Clock.menu"

# Trackpad: map tap to click
defaults write com.apple.driver.AppleBluetoothMultitouch.trackpad Clicking -bool true
defaults -currentHost write NSGlobalDomain com.apple.mouse.tapBehavior -int 1
defaults write NSGlobalDomain com.apple.mouse.tapBehavior -int 1

# Trackpad: map bottom right corner to right click
defaults write com.apple.driver.AppleBluetoothMultitouch.trackpad TrackpadCornerSecondaryClick -int 2
defaults write com.apple.driver.AppleBluetoothMultitouch.trackpad TrackpadRightClick -bool true
defaults -currentHost write NSGlobalDomain com.apple.trackpad.trackpadCornerClickBehavior -int 1
defaults -currentHost write NSGlobalDomain com.apple.trackpad.enableSecondaryClick -bool true

# Screenshot settings
# defaults write com.apple.screencapture name "screen"
# defaults write com.apple.screencapture location -string "~/Screenshots"
# defaults write com.apple.screencapture type -string "png"

# Security: Require password immediately after sleep or screen saver begins
defaults write com.apple.screensaver askForPassword -int 1
defaults write com.apple.screensaver askForPasswordDelay -int 0

# Dock: auto-hide
defaults write com.apple.dock autohide -bool true

# Time Machine: do not prompt to use new hard drives
defaults write com.apple.TimeMachine DoNotOfferNewDisksForBackup -bool true

# Time Machine: disable local backups
hash tmutil &> /dev/null && sudo tmutil disablelocal

# Apply changes
killall Finder
killall Dock
killall SystemUIServer

