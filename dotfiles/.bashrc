LOCAL=$HOME/local
if [ -f $HOME/.habitat ]
then
	source $HOME/.habitat
fi

# alias
alias l="ls -la --color"
alias ..="cd .."
alias rm="$LOCAL/bin/rm.sh"
source $HOME/.shortcuts
source $HOME/.functions

# settings
stty erase ^?
set +o nounset
set -o vi
bind -f $HOME/.inputrc

# exports
export LD_LIBRARY_PATH=$LD_LIBRARY_PATH:$LOCAL/lib
export CPLUS_INCLUDE_PATH=$LOCAL/include
export C_INCLUDE_PATH=$LOCAL/include
export PATH=$LOCAL/bin:$PATH
SSH_ASKPASS=""
export SSH_ASKPASS
export LOCAL
export VIMRUNTIME=$LOCAL/share/vim/vim81

# prompt
export PS1='\[\e[0;33m\][\[\e[m\e[1;31m\]{\h} \[\e[m\e[1;36m\]$(pwd)\[\e[m\e[0;33m\]]\$ \[\e[m\]'

# trash
if [ ! -d "$HOME/.Trash" ]
then
	mkdir $HOME/.Trash
fi
