#!/bin/sh -x
# hints from https://linuxconfig.org/how-to-install-latest-firefox-browser-on-debian-9-stretch-linux
act_path=$(pwd)
username=$(whoami)
opt_name="opt"
opt_path="/home/$username/$opt_name/"
sw_name="firefox"
sw_path="$opt_path$sw_name/"
bool=true
deb_path="/usr/lib/firefox-esr/firefox-esr"


if ! [ -d "$opt_path" ]
then
    echo "Folder " + $opt_path + " does not exist." 
    echo "So i create 1 for you!"
    mkdir -p "$opt_path"
fi
if ! [ -d "$sw_path" ]
then
    echo "Folder " + $sw_path + " does not exist." 
    echo "So i create 1 for you!"
    mkdir -p "$sw_path"
else
	bool=false
fi

cd "$opt_path"

wget -O FirefoxSetup.tar.bz2 "https://download.mozilla.org/?product=firefox-latest&os=linux64&lang=en-US"
tar xjf FirefoxSetup.tar.bz2 -C "$sw_path"
rm -rf FirefoxSetup.tar.bz2

if [ "$bool" = "true" ]
then
	if [ -f "$deb_path" ]
	then
		echo "Backup original Firefox Binary to: " + $deb_path + "_orig"
        mv "$deb_path" "$deb_path"_orig
        echo "make a link, so you can use the new version "
        sudo ln -s "$sw_path"/"$sw_name"/"$sw_name" "$deb_path"
    fi
fi    


# Backup
# mv /usr/lib/firefox-esr/firefox-esr /usr/lib/firefox-esr/firefox-esr_orig
# ln -s /opt/firefox/firefox/firefox /usr/lib/firefox-esr/firefox-esr

# Restore
# unlink /usr/lib/firefox-esr/firefox-esr
# mv /usr/lib/firefox-esr/firefox-esr_orig /usr/lib/firefox-esr/firefox-esr

cd "$act_path"
