#!/bin/bash
act_path=$(pwd)
username=$(whoami)
opt_name="opt"
opt_path="/home/$username/$opt_name/"
git_vim="https://github.com/vim/vim.git"
sw_name="vim"
sw_path="$opt_path$sw_name"


if ! [ -d "$opt_path" ]
then
    echo "Folder " + "$opt_path" + " does not exist."
    echo "So i create 1 for you!"
    mkdir -p "$opt_path"
fi
if ! [ -d "$sw_path" ]
then
    echo "Folder " + "$sw_path" + " does not exist."
    echo "So i create 1 for you!"
    git clone "$git_vim"
fi

cd "$sw_path"
git pull
make distclean
./configure \
	--with-features=huge \
        --enable-multibyte \
        --enable-rubyinterp \
        --enable-pythoninterp \
        --with-python-config-dir=/usr/lib/python2.7/config-x86_64-linux-gnu \
        --enable-perlinterp \
        --enable-luainterp \
        --enable-gui=auto \
	--enable-gtk2-check \
	--enable-gnome-check \
        --enable-cscope \
        --prefix=/usr
#make
make VIMRUNTIMEDIR=/usr/share/vim/vim80
#sudo make install
sudo checkinstall
export PATH=/usr/local/bin:$PATH
vim --version
