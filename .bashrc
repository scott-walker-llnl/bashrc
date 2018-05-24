# alias
alias l="ls -la --color"
alias ..="cd .."
source .shortcuts.sh

# exports
LOCAL=$HOME/local
export LD_LIBRARY_PATH=$LD_LIBRARY_PATH:$LOCAL/lib
export CPLUS_INCLUDE_PATH=$LOCAL/include
export C_INCLUDE_PATH=$LOCAL/include
export PATH=$PATH:$LOCAL/bin
SSH_ASKPASS=""
export SSH_ASKPASS
export WORKSPACE=$HOME/Projects

# prompt
export PS1='\[\e[0;33m\][\[\e[m\e[1;31m\]{\h} \[\e[m\e[1;36m\]$(pwd)\[\e[m\e[0;33m\]]\$ \[\e[m\]'

# settings
stty erase ^?
set +o nounset
set -o vi
