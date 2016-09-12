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

PATH="/Users/nicolas.dejay/perl5/bin${PATH:+:${PATH}}"; export PATH;
PERL5LIB="/Users/nicolas.dejay/perl5/lib/perl5${PERL5LIB:+:${PERL5LIB}}"; export PERL5LIB;
PERL_LOCAL_LIB_ROOT="/Users/nicolas.dejay/perl5${PERL_LOCAL_LIB_ROOT:+:${PERL_LOCAL_LIB_ROOT}}"; export PERL_LOCAL_LIB_ROOT;
PERL_MB_OPT="--install_base \"/Users/nicolas.dejay/perl5\""; export PERL_MB_OPT;
PERL_MM_OPT="INSTALL_BASE=/Users/nicolas.dejay/perl5"; export PERL_MM_OPT;
