#!/bin/bash

cd vim/
#hg pull -u
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
