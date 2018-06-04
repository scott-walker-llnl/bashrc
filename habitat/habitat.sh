#!/bin/bash

# todo, can use 'rpm -qa' on RHEL and 'dpkg -l' on Debian to get installed packages
# use this to check for required packages in environment
# then just need way to interchangeably use packeges or source installs
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
	if [ $? -eq 1 ]
	then
		echo "ERROR: unable to create habitat $1, does it already exist?"
		return 1
	fi
	cat dotfiles/bashrc_min > .bashrc
	if [ $? -eq 1 ]
	then
		echo "ERROR: unable to create habitat $1, is HABITAT_PATH correct?"
		return 1
	fi
	echo "export PATH=$PATH" >> .bashrc
	echo "export LD_LIBRARY_PATH=$LD_LIBRARY_PATH" >> .bashrc
	echo "export CPLUS_INCLUDE_PATH=$CPLUS_INCLUDE_PATH" >> .bashrc 
	echo "export C_INCLUDE_PATH=$C_INCLUDE_PATH" >> .bashrc
	cp $HOME/.vimrc .
	cp $HOME/.inputrc .
	cp $HOME/.functions .
	cp $HOME/.shortcuts .
	git add .bashrc
	if [ $? -eq 1 ]
	then
		echo "ERROR: unable to create habitat $1, is HABITAT_PATH correct?"
		return 1
	fi
	git add .vimrc
	git add .inputrc
	git add .functions
	git add .shortcuts
	git commit -m "initial commit for habitat $1"
	#git pull origin $1
	git push origin $1
	if [ $? -eq 1 ]
	then
		echo "ERROR: unable to create habitat $1, is HABITAT_PATH correct?"
		return 1
	fi
	cp .bashrc $HOME/
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
	if [ $? -eq 1 ]
	then
		echo "ERROR: unable to load habitat $1, does habitat exist?"
		return 1
	fi
	git pull origin $habname
	if [ $? -eq 1 ]
	then
		echo "ERROR: unable to load habitat $1, does habitat exist?"
		return 1
	fi
	cp .vimrc $HOME/
	if [ $? -eq 1 ]
	then
		echo "ERROR: unable to load habitat $1, is HABITAT_PATH correct?"
		return 1
	fi
	cp .bashrc $HOME/
	cp .inputrc $HOME/
	cp .functions $HOME/
	cp .shortcuts $HOME/
	cd $_dir_
	echo "Habitat switched to $habname"
	echo "Use 'envupdate' to activate changes"
}

delete ()
{
	if [ $1 == "master" ]
	then
		echo "ERROR: cannot delete default habitat"
		return 0
	fi
	_dir_=$(pwd)
	cd $HABITAT_PATH
	git branch
	echo "Are you sure you want to permanently delete habitat $1?"
	read _check_
	if [ $_check_ == "y" ]
	then
		git push origin --delete $1
		git branch -D $1
		echo "Habitat $1 deleted"
	else
		echo "aborted..."
		return 0
	fi
	cd $_dir_
}

update ()
{
	if [ $1 == "" ]
	then
		echo "No habitat name provided"
		return 0
	fi
	_dir_=$(pwd)
	cd $HABITAT_PATH
	# create a new branch for this habitat with the specified name
	git checkout $1
	if [ $? -eq 1 ]
	then
		echo "ERROR: load habitat $1, does it already exist?"
		return 1
	fi
	cat dotfiles/bashrc_min > .bashrc
	if [ $? -eq 1 ]
	then
		echo "ERROR: unable to update habitat $1, is HABITAT_PATH correct?"
		return 1
	fi
	echo "export PATH=$PATH" >> .bashrc
	echo "export LD_LIBRARY_PATH=$LD_LIBRARY_PATH" >> .bashrc
	echo "export CPLUS_INCLUDE_PATH=$CPLUS_INCLUDE_PATH" >> .bashrc 
	echo "export C_INCLUDE_PATH=$C_INCLUDE_PATH" >> .bashrc
	cp $HOME/.vimrc .
	cp $HOME/.inputrc .
	cp $HOME/.functions .
	cp $HOME/.shortcuts .
	git add .bashrc
	if [ $? -eq 1 ]
	then
		echo "ERROR: unable to update habitat $1, is HABITAT_PATH correct?"
		return 1
	fi
	git add .vimrc
	git add .inputrc
	git add .functions
	git add .shortcuts
	git commit -m "update for habitat $1"
	git pull origin $1
	if [ $? -eq 1 ]
	then
		echo "ERROR: unable to update habitat $1, does it exist?"
		return 1
	fi
	git push origin $1
	cp .bashrc $HOME/
	echo "Habitat $1 updated"
	cd $_dir_
}

if [ $HABITAT_PATH == "" ]
then
	echo "HABITAT_PATH is not set"
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
if [ $1 == "delete" ]
then
	# call delete function
	delete $2
	exit
fi
if [ $1 == "update" ]
then
	# call update function
	update $2
	exit
fi
if [ $1 == "which" ]
then
	_dir_=$(pwd)
	cd $HABITAT_PATH
	git branch
	cd $_dir_
fi
