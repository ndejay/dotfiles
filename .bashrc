###########
# General #
###########

export EDITOR='vim'
export PAGER='less'

# if  [ -z "$SSH_CLIENT" ] && [ -z "$SSH_TTY" ] && [ "$TERM" != "screen" ] ; then
#  if [ -n $(which mvim) ] ; then
#    export EDITOR='mvim'
#    alias vim='mvim'
#  fi
# fi

########
# less #
########

LESSPIPE=$(which src-hilite-lesspipe.sh 2>/dev/null)
[[ -n "$LESSPIPE" ]] && export LESSOPEN="| $LESSPIPE %s"
export LESS='-R'

###########
# Aliases #
###########

alias R='R --quiet' # R without verbose
alias l='ls -alh' # faster ls
alias wget='wget --no-check-certificate' # HTTPS error is so annoying
alias nodup="awk '!x[\$0]++'" # removes duplicates

##############
# Protection #
##############

alias rm='rm -i'
alias mv='mv -i'
alias cp='cp -i'

###########
# History #
###########

export HISTFILE=~/.histfile
# export HISTFILESIZE=1000000
export HISTSIZE=1000000
export SAVEHIST=1000000
export HISTCONTROL=erasedups
# export HISTIGNORE='l'

#########
# Shell #
#########

shopt -s cmdhist # Combine multiline commands
shopt -s histappend # Merge history sessions
shopt -s extglob # Allows basic regexps 
shopt -s checkwinsize # Redraw on window size change

set -o emacs

##########
# Prompt #
##########

# ls with color output
case $(uname) in
  'Darwin') alias ls='ls -G' ;;
  'Linux')  alias ls='ls --color=auto' ;;
esac

export GREP_OPTIONS='--color=auto' # grep with color output

# colors: http://seanponeil.com/blog/2012/09/13/sexy-solarized-bash-prompt/
# git:    http://www.terminally-incoherent.com/blog/2013/01/14/whats-in-your-bash-prompt/
__prompt_command () {
  local reset=$(tput sgr0)
  local bold=$(tput bold)
  local red=$(tput setaf 1)
  local orange=$(tput setaf 3)
  local magenta=$(tput setaf 5)
  local gray=$(tput setaf 10)

  PS1="\[$bold\]\h\[$reset\] \[$gray\]\W\[$reset\]"

  local status=$(git status -unormal 2>&1)
  if ! [[ "$status" =~ Not\ a\ git\ repo ]] ; then
    [[ "$status" =~ nothing\ to\ commit ]] && local on=$orange || local on=$red
    if [[ "$status" =~ On\ branch\ ([^[:space:]]+) ]] ; then
      local branch=${BASH_REMATCH[1]}
    else
      local on=$magenta
      local branch=$(git describe --all --contains --abbrev=4 HEAD 2>/dev/null || echo HEAD)
    fi

    [[ -n "$branch" ]] && PS1+=" \[$on\]$branch\[$reset\]"
  fi

  PS1+=" \$ "
}

export PROMPT_COMMAND=__prompt_command
export PS2='> '
