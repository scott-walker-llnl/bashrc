# make sure we are up to date
# -v requires python<2+3>-devel package and cmake
git pull origin master
mkdir -p $HOME/local/bin
mkdir -p $HOME/local/include
mkdir -p $HOME/local/lib
mkdir -p $HOME/local/share
mkdir -p $HOME/.Trash

if [ "$1" == "-v" ]
then
	echo installing Vim plugins
	echo "REQUIRES CMAKE and PYTHON<2+3>-devel"
	if [ "$2" == "" ]
	then
		echo "error: arg2 is path to python config folder (usually in /usr/lib/python<version>)"
		exit
	fi

	_DIR_=$(pwd)
	if [ ! -d $HOME/Projects/vim ]
	then
		# get Vim
		git clone https://github.com/vim/vim.git $HOME/Projects/vim
		cd $HOME/Projects/vim/src
		./configure --disable-gui --prefix=$HOME/local/ --with-features=huge --enable-multibyte --enable-pythoninterp=yes --enable-python3interp=yes --enable-perlinterp=yes --enable-luainterp=yes --enable-cscope --with-python3-config-dir=$2
		make -j 4 && make install
	fi
	cd $_DIR_

	if [ ! -d $HOME/.vim/bundle/Vundle.vim ]
	then
		# get Vundle
		git clone https://github.com/VundleVim/Vundle.vim.git $HOME/.vim/bundle/Vundle.vim
	fi
	echo "finished Vim plugins"
	echo "###don't forget to finish YouCompleteMe install by running ~/.vim/bundle/YouCompleteMe/third_party/ycmd/build.py###"
fi

cp dotfiles/.bashrc $HOME/
cp dotfiles/.functions $HOME/
cp dotfiles/.shortcuts $HOME/
cp dotfiles/.inputrc $HOME/
cp dotfiles/.vimrc $HOME/
cp utility/rm.sh $HOME/local/bin

source $HOME/.bashrc

echo environment ready

# you complete me build step
# ~/.vim/bundle/YouCompleteMe/third_party/ycmd/build.py
