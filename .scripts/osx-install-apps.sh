#!/usr/bin/env bash

# This script installs all the software I need on OS X so that I
# don't have to. ;)

brew tap homebrew/science


# FUSE
brew install Caskroom/cask/osxfuse
brew install sshfs
brew install encfs

# Applications
# brew install Caskroom/cask/google-chrome
brew install Caskroom/cask/google-drive
brew install Caskroom/cask/dropbox
brew install Caskroom/cask/evernote
brew install Caskroom/cask/mendeley-desktop
brew install Caskroom/cask/firefox
brew install Caskroom/cask/crashplan
brew install Caskroom/cask/spectacle
brew install Caskroom/cask/flux

# Development
brew install Caskroom/cask/java
brew install Caskroom/cask/xquartz
brew install Caskroom/cask/iterm2
brew install git
brew install mosh
brew install vim
brew install macvim
brew install htop
brew install wget
brew install curl
brew install zsh

# Programming Languages
brew install bash
brew install r
brew install python
brew install python3
brew install ruby
brew install perl
brew install Caskroom/cask/julia

# Misc
brew install igv
brew install imagemagick
