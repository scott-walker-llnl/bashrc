#!/bin/bash
create ()
{
	if [ $1 == "" ]
	then
		echo "Name required for new habitat"
		return 0
	fi
	_dir_=$(pwd)
	cd $HABITAT_PATH
	# create a new branch for this habitat with the specified name
	git checkout -b $1
	echo dotfiles/bashrc_min > .bashrc
	echo "export PATH=$PATH" >> .bashrc
	echo "export LD_LIBRARY_PATH=$LD_LIBRARY_PATH" >> .bashrc
	echo "export CPLUS_INCLUDE_PATH=$CPLUS_INCLUDE_PATH" >> .bashrc 
	echo "export C_INCLUDE_PATH=$C_INCLUDE_PATH" >> .bashrc
	echo "export LOCAL=$LOCAL" >> .bashrc
	cp $HOME/.vimrc .
	cp $HOME/.inputrc .
	cp $HOME/.functions .
	cp $HOME/.shortcuts .
	git add .bashrc
	git add .vimrc
	git add .inputrc
	git add .functions
	git add .shortcuts
	git commit -m "initial commit for habitat $1"
	git pull origin $1
	git push origin $1
	echo "Habitat $1 created"
	cd $_dir_
}

load ()
{
	_dir_=$(pwd)
	cd $HABITAT_PATH
	habname=""
	if [ $1 == "" ]
	then
		habname="master"
	else
		habname=$1
	fi
	git checkout $habname
	git pull origin $habname
	cp .vimrc $HOME/
	cp .bashrc $HOME/
	cp .inputrc $HOME/
	cp .functions $HOME/
	cp .shortcuts $HOME/
	cd $_dir_
	echo "Habitat switched to $habname"
}

if [ $HABITAT_PATH == "" ]
then
	echo "Habitat path is not set"
	exit
fi
if [ $1 == "create" ]
then
	# call create function
	create $2
	exit
fi
if [ $1 == "load" ]
then
	# call load function
	load $2
	exit
fi
if [ $1 == "which" ]
then
	_dir_=$(pwd)
	cd $HABITAT_PATH
	git branch
	cd $_dir_
fi
