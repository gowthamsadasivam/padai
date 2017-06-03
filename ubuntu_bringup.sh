#!/bin/bash -x
# (C) 2017 Ezhil Language Foundation
# 
# This script brings up a basic Ubuntu/later, machine 
# to a usable configuration involving a basic Tamil fonts,
# remove VNC server with Xwindows. It has Python, Git, Gcc
# other tools for development.
# 
if [ $# -lt 2 ] 
then
   echo "Usage: ubuntu_bringup.sh <username> <password>"
   exit -1
fi
if [ $# -gt 2 ]
then
    EXTRA=1
else
    EXTRA=0
fi

USERNAME=$1
PASSWORD=$2

sudo apt-get install gcc
sudo apt-get install gtk+
sudo apt-get install python2
sudo apt-get install python3
sudo apt-get install vnc
sudo apt-get install pygobject
sudo apt-get install pygtk
sudo apt-get install pygobject3 python3-gobject

sudo apt-get install  gir1.2-gtk-3.0
sudo apt-get install --upgrade  gir1.2-gtk-3.0
sudo apt-get install --upgrade python3-gi-cairo
sudo apt-get install gdb
sudo apt-get install gir1.2-gdkpixbuf-2.0
sudo apt-get install gir1.2-gdkpixbuf-2.0 --force
sudo apt-get install gobject
sudo apt-get install libgdk-pixbuf2
sudo apt-get install libgdk-pixbuf2.0-dev
sudo apt-get install libgdk-pixbuf2.36
sudo apt-get install libgdk-pixbuf2.36-dev
sudo apt-get install libgdkpixbuf-2
sudo apt-get install libgdkpixbuf-2.0
sudo apt-get install libgtk-devel
sudo apt-get install libgtk-devel-3.0
sudo apt-get install nvidia-xconfig
sudo apt-get install python3-gi-cairo
#sudo apt-get install tamil-gtk2im
#sudo apt-get install tamil-ttf-fonts
#sudo apt-get install ttf-tamil-fonts
#sudo apt-get install ttf-tamil-fonts-udeb
sudo apt-get install vnc
sudo apt-get install vncserver
sudo apt-get install xfonts-100dpi xfonts-75dpi
#sudo apt-get reinstall gir1.2-gdkpixbuf-2.0 
#sudo apt-get remove  gir1.2-gtk-3.0
#sudo apt-get remove  py-gobject
sudo apt-get update gir1.2-gdkpixbuf-2.0 
sudo apt-get update python3-gi-cairo
sudo apt-get updgrade python3-gi-cairo
sudo apt-get upgrade gir1.2-gdkpixbuf-2.0 
sudo apt-get update

adduser  $USERNAME
echo $PASSWORD | passwd $USERNAME
sudo apt-get install metacity
sudo apt-get install gnome3
sudo apt-get install gnome2
sudo apt-get install Xorg
sudo apt-get install fonttools
sudo apt-get install fontmatrix
sudo apt-get install python3-gobject
sudo apt-get install pygobject3
sudo apt-get install gtk3
sudo apt-get install gtk3-engines
sudo apt-get install glade3
sudo apt-get install glade

######## goto devel directory #########
cd ~$USERNAME/devel
export TEST_EZHIL_DEVELOPMENT=1
git clone https://github.com/Ezhil-Language-Foundation/Ezhil-Lang.git
git clone https://github.com/Ezhil-Language-Foundation/Ezhil-Linux.git
git clone https://github.com/pyinstaller/pyinstaller.git

sudo pip install ezhil
sudo pip3 install ezhil

cd Ezhil-Lang && python setup.py sdist build && python setup.py sdist install

cd ~$USERNAME/devel
git clone https://github.com/pyinstaller/pyinstaller.git
cd pyinstaller && python setup.py sdist build && python setup.py sdist install

####### install Tamil fonts #######
git clone https://github.com/thamizha/tamil-fonts.git
cd tamil-fonts
chmod +x ./ubuntu_install.sh
mkdir /usr/share/fonts/truetype
./ubuntu_install.sh

shutdown -r now