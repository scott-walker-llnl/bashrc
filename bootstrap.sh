# make sure we are up to date
git pull origin master
mkdir -p $HOME/local/bin
mkdir -p $HOME/local/include
mkdir -p $HOME/local/lib
mkdir -p $HOME/local/share
mkdir -p $HOME/.Trash

cp dotfiles/.bashrc $HOME/
cp dotfiles/.functions $HOME/
cp dotfiles/.vimrc $HOME/
cp utility/rm.sh $HOME/local/bin

source $HOME/.bashrc

echo environment ready
