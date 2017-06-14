###########################
# oh-my-zsh Configuration #
###########################

export ZSH=$HOME/.oh-my-zsh
ZSH_THEME="theunraveler"
DISABLE_AUTO_UPDATE="true"

plugins=(git rake tmux)

source $ZSH/oh-my-zsh.sh
source ~/.commonrc

###########
# History #
###########

export HISTFILE=~/.histfile

###############
# Integration #
###############

test -e ${HOME}/.iterm2_shell_integration.zsh && source ${HOME}/.iterm2_shell_integration.zsh
