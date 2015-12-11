#!/bin/bash
set -e
set -x

# Super-size me
###############

sudo sed -i 's/%sudo.*/%sudo  ALL=(ALL:ALL) NOPASSWD:ALL/' /etc/sudoers
sudo usermod -aG sudo ${USER}


# Remove Ubuntu crap
####################
# remember to edit Unity shortcuts, disable workspace keyboard shortcuts or
# ctrl+alt+up/down won't work

# disable ubuntu's annoying "System Program Problem Detected"...
sudo sed -i 's/enabled=1/enabled=0/' /etc/default/apport
# disable ubuntu's annoying mlocate hog
sudo chmod -x /etc/cron.daily/mlocate
# disable ubuntu auto updates
sudo sed -i 's/"1"/"0"/' /etc/apt/apt.conf.d/10periodic
# uninstall bundled packages I never use
sudo apt-get remove -y brasero libreoffice-core libreoffice-common \
  thunderbird banshee gnome-sudoku > /dev/null

# Install
#########

sudo add-apt-repository ppa:fkrull/deadsnakes -y  # python

sudo apt-get update -qq
# Important Stuff first
sudo apt-get install -y vim-gnome git-core

sudo apt-get install -y \
  curl athena-jot jq \
  tree \
  chromium-browser \
  ack-grep silversearcher-ag \
  python2.6 python2.7 python3.3 python3.4 python-dev python-pip \
  libmysqlclient-dev \
  libpq-dev libgeos-dev \
  keepassx \
  unity-tweak-tool \
  psensor \
  supervisor


# Take ownership of `/usr/local`
################################
# ref: http://howtonode.org/introduction-to-npm
sudo chown -R $USER:$USER /usr/local

# Base Python
#############
sudo pip install -U pip
pip install --quiet virtualenvwrapper csvkit awscli ansible postdoc
source ~/.bashrc  # Setup virtualenv env variables

# Docker
########
# http://docs.docker.io/en/latest/installation/ubuntulinux/
if [ -z "$(which docker)" ]; then
  curl -sSL https://get.docker.com/ | sh
fi

# Giving non-root access
sudo usermod -aG docker ${USER}
pip install docker-compose

# Autoenv
#########
# Install from `master` because packaged versions are too old and don't support
# foreman compatible .env files.
if [ ! -d ~/.autoenv ]; then
  git clone git://github.com/crccheck/autoenv.git ~/.autoenv
  touch ~/.autoenv_authorized
fi

# More Python stuff
###################
# if this gives you trouble, you need to add a `deb-src` line to your sources.list
sudo apt-get build-dep lxml -y

# unfuck PIL
if [ ! -f "/usr/lib/$(uname -i)-linux-gnu/libz.so" ]; then
  sudo apt-get build-dep pillow -y
  sudo apt-get install libjpeg-dev -y
  sudo ln -s /usr/lib/$(uname -i)-linux-gnu/libz.so /usr/lib
  sudo ln -s /usr/lib/`uname -i`-linux-gnu/libjpeg.so /usr/lib
  # sudo ln -s /usr/lib/`uname -i`-linux-gnu/libjpeg.so.8 /usr/lib
  # sudo ln -s /usr/lib/`uname -i`-linux-gnu/libjpeg.so.62 /usr/lib
  # sudo ln -s /usr/lib/`uname -i`-linux-gnu/libfreetype.so.6 /usr/lib
fi

# Node
######
if [ -z $(which node) ]; then
  sudo apt-get install nodejs nodejs-legacy npm -y
  npm install -g npm
  n stable
fi

# Ruby
######
# use rbenv instead of rvm because rvm overwrites `cd`
# sudo apt-get install rbenv heroku-toolbelt -y
# mkdir ~/.rbenv/plugins
# git clone https://github.com/sstephenson/ruby-build.git ~/.rbenv/plugins/ruby-build
# use `sudo` becaue I'm too lazy to figure out how to get `ruby-build` to
# install a recent version of ruby without intalling directly from github
# sudo gem install lolcat bundler
# heroku plugins:install git://github.com/heroku/heroku-pg-extras.git

# inotify helps other programs watch files
sudo apt-get install inotify-tools -y

# synergy
sudo apt-get install -y libavahi-compat-libdnssd1
# dpkg install -i synergy.deb

# dropbox
sudo apt-get install -y nautilus-dropbox

if [ -z $(which syncthing) ]; then
  # http://apt.syncthing.net/
  curl -s https://syncthing.net/release-key.txt | sudo apt-key add -
  echo "deb http://apt.syncthing.net/ syncthing release" | sudo tee /etc/apt/sources.list.d/syncthing.list
  sudo apt-get update
  sudo apt-get install syncthing
fi

if [ -z $(which atom) ]; then
  sudo add-apt-repository ppa:webupd8team/atom -y
  sudo apt-get -qq update
  sudo apt-get -y install atom
  make atom
fi

# Manual steps:

# https://fixubuntu.com/

# "Show the menues for a window" -> In the window's title bar
