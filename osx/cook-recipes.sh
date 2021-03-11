#!/usr/bin/env bash

ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"

# This script installs all the software I need on OS X so that I
# don't have to. ;)

RECIPES=(
  git mosh vim htop wget curl zsh tmux
  coreutils findutils gnu-indent gnu-sed gnutls gnu-tar gawk
  osxfuse sshfs encfs

  iterm2 google-chrome spectacle flux bartender alfred appcleaner
  google-backup-and-sync dropbox lastpass evernote
  mendeley-desktop kindle spotify anki private-internet-access
  # get 2Do online
  pomodone
  slack zoom microsoft-teams microsoft-office-2016
  # https://officecdn-microsoft-com.akamaized.net/pr/C1297A47-86C4-4C1F-97FA-950631F94777/MacAutoupdate/Microsoft_Remote_Desktop_10.3.8_installer.pkg
  deluge signal vlc
  vagrant virtualbox
  adobe-digital-editions
)

brew install ${RECIPES[@]}
