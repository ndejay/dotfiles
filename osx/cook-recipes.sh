#!/usr/bin/env bash

ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"

# This script installs all the software I need on OS X so that I
# don't have to. ;)

brew tap homebrew/science

RECIPES=(
  Caskroom/cask/osxfuse
  sshfs
  encfs

  Caskroom/cask/google-chrome
  Caskroom/cask/google-drive
  Caskroom/cask/dropbox
  Caskroom/cask/evernote
  Caskroom/cask/mendeley-desktop
  Caskroom/cask/crashplan
  Caskroom/cask/spectacle
  Caskroom/cask/flux
  Caskroom/cask/todoist
# tomato
# amphetamine
  Caskroom/cask/bartender
  Caskroom/cask/alfred
  Caskroom/cask/fantastical

  Caskroom/cask/java
  Caskroom/cask/xquartz
  Caskroom/cask/iterm2
  git
  mosh
  vim
  htop
  wget
  curl
  zsh
  bash
  the_silver_searcher

  findutils
  gnu-indent
  gnu-sed
  gnutls
  gnu-tar
  gawk
)

brew install ${RECIPES[@]}
