LOCAL=$HOME/local
if [ -f $HOME/.habitat ]
then
	source $HOME/.habitat
fi

# alias
alias l="ls -la --color"
alias ls="ls --color"
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
SSH_ASKPASS=""
export SSH_ASKPASS
export VIMRUNTIME=$LOCAL/share/vim/vim81

# prompt
export PS1='\[\e[0;33m\][\[\e[m\e[1;31m\]{\h} \[\e[m\e[1;36m\]$(pwd)\[\e[m\e[0;33m\]]\$ \[\e[m\]'

# trash
if [ ! -d "$HOME/.Trash" ]
then
	mkdir $HOME/.Trash
fi

# exports
export PATH=/home/walker8/local/bin:/usr/lib64/qt-3.3/bin:/usr/local/bin:/usr/bin:/usr/local/sbin:/usr/sbin:/home/walker8/.local/bin:
export LD_LIBRARY_PATH=:/home/walker8/local/lib:/home/walker8/local/lib:/home/walker8/local/lib:/home/walker8/local/lib:/home/walker8/local/lib:/home/walker8/local/lib:/home/walker8/local/lib
export CPLUS_INCLUDE_PATH=/home/walker8/local/include
export C_INCLUDE_PATH=/home/walker8/local/include
