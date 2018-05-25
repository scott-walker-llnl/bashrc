bm ()
{
	if [ "$1" == "-n" ]
	then
		# create new bookmark
		echo bookmark \'$2\' created as $(pwd)
		echo ${2}=$(pwd) >> $HOME/.bookmarks
		return 0
	fi

	if [ "$1" == "-d" ]
	then
		# remove bookmark
		echo bookmarks matching \'$2\' deleted
		sed -i /$2=/d $HOME/.bookmarks
		return 0
	fi

	if [ "$1" == "-l" ]
	then
		# list
		cat $HOME/.bookmarks
		return 0
	fi

	_BM_=$(/bin/sed -r "s/$1=(.*)\$/\1/" $HOME/.bookmarks) 
	cd $_BM_
	return 0
}

export bm
