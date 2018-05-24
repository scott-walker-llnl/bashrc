#!/bin/bash

RMCMD=/bin/rm
TRASH=$HOME/.Trash
FNAME=$1
if [ "$1" == "-d" ]
then
	FNAME=$2
	if [ -f $TRASH/$FNAME ]
	then
		echo Permanently remove \'$TRASH/$FNAME\'?
		echo -n "(y/n): "
		read _COND_
		if [ "$_COND_" == "y" ]
		then
			echo "$RMCMD -rf $TRASH/$FNAME"
			$($RMCMD -rf $TRASH/$FNAME)
			echo \'$TRASH/$FNAME\' deleted
		else
			echo $_COND_
			echo aborted...
		fi
	else
		echo \'$TRASH/$FNAME\' does not exist.
	fi
	exit
fi

if [ "$1" == "-l" ]
then
	echo [Trash contents]
	ls --color $TRASH
	exit
fi

if [ ! -f $1 ]
then
	echo \'$1\' does not exist.
	exit
fi

if [ ! -f $TRASH/$1 ]
then
	mv $1 $TRASH
else
	FNAME_SUFFIX=$(date +%d-%m-%Y-%H:%M:%S)
	FNAME=${1}${FNAME_SUFFIX}
	mv $1 $TRASH/$FNAME
fi
echo \'$FNAME\' has been dumped to $TRASH
