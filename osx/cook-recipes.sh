#!/usr/bin/env bash

ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"

# This script installs all the software I need on OS X so that I
# don't have to. ;)

RECIPES=(
  Caskroom/cask/osxfuse sshfs encfs

  Caskroom/cask/google-chrome
  Caskroom/cask/google-backup-and-sync
  Caskroom/cask/dropbox
  Caskroom/cask/evernote
  Caskroom/cask/mendeley-desktop
  Caskroom/cask/spectacle
# Caskroom/cask/flux
# Caskroom/cask/todoist
# Caskroom/cask/bartender
  Caskroom/cask/alfred

  # adobe creative cloud
  # microsoft office
  # todoist
  # tomato

  Caskroom/cask/iterm2
  git mosh vim htop wget curl zsh hhe_silver_searcher thefuck
  coreutils findutils gnu-indent gnu-sed gnutls gnu-tar gawk
)

brew install ${RECIPES[@]}
