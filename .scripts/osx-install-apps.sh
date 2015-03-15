#!/usr/bin/env bash

# This script installs all the software I need on OS X so that I
# don't have to. ;)

brew tap homebrew/science

RECIPES=(
  Caskroom/cask/osxfuse
  sshfs
  encfs

  Caskroom/cask/google-drive
  Caskroom/cask/dropbox
  Caskroom/cask/evernote
  Caskroom/cask/mendeley-desktop
  Caskroom/cask/firefox
  Caskroom/cask/crashplan
  Caskroom/cask/spectacle
  Caskroom/cask/flux

  Caskroom/cask/java
  Caskroom/cask/xquartz
  Caskroom/cask/iterm2
  git
  mosh
  vim
  macvim
  htop
  wget
  curl
  zsh

  bash
  r
  python
  python3
  ruby
  perl
  Caskroom/cask/julia

  igv
  imagemagick
)

brew install ${RECIPES[@]}
