#!/bin/bash
# NOTES: this script assumes that PPAs are updated for your distribution
# if they aren't, you have to manually edit your /etc/apt/sources.list.d
set -e
set -x

# Super-size me
###############

sudo sed -i 's/%sudo.*/%sudo  ALL=(ALL:ALL) NOPASSWD:ALL/' /etc/sudoers
sudo usermod -aG sudo ${USER}


# Remove Ubuntu crap
####################
# disable ubuntu's annoying "System Program Problem Detected"...
sudo sed -i 's/enabled=1/enabled=0/' /etc/default/apport
# disable ubuntu's annoying mlocate hog
sudo chmod -x /etc/cron.daily/mlocate
# disable ubuntu auto updates
sudo sed -i 's/"1"/"0"/' /etc/apt/apt.conf.d/10periodic
# uninstall bundled packages I never use
sudo apt-get remove -y brasero libreoffice-core libreoffice-common \
  thunderbird banshee gnome-sudoku rhythmbox

# Install
#########

# Important Stuff first
sudo apt-get install -y vim git-core build-essential libncurses-dev gawk python

sudo apt-get install -y \
  curl athena-jot jq \
  tree \
  chromium-browser \
  silversearcher-ag \
  libmysqlclient-dev \
  libpq-dev libgeos-dev


# Take ownership of `/usr/local`
################################
# ref: http://howtonode.org/introduction-to-npm
sudo chown -R $USER:$USER /usr/local

# Docker
########
# http://docs.docker.io/en/latest/installation/ubuntulinux/
if [ -z "$(which docker)" ]; then
  curl -sSL https://get.docker.com/ | sh
fi

# Giving non-root access
# sudo usermod -aG docker ${USER}
# pip install docker-compose

# Modern Python 3
#################
sudo add-apt-repository ppa:deadsnakes/ppa -y  # python
sudo apt-get -qq update
sudo apt-get install -y python3.7 python-dev

sudo pip install -U pip
pip install --quiet virtualenvwrapper awscli postdoc
source ~/.bashrc  # Setup virtualenv env variables

# Autoenv
#########
# Install from my fork
if [ ! -d ~/Sync/autoenv ]; then
  git clone git://github.com/crccheck/autoenv.git ~/Sync/autoenv
fi

# Node
######
if [ -z $(which node) ]; then
  sudo apt-get install nodejs nodejs-legacy npm -y
  npm install -g npm
  npm install -g n
  n lts
fi
# NVM
# See installation instructions at https://github.com/creationix/nvm

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
sudo apt-get install -y inotify-tools

# synergy
sudo apt-get install -y libavahi-compat-libdnssd1
# dpkg install -i synergy.deb

# dropbox
sudo apt-get install -y nautilus-dropbox

if [ -z $(which syncthing) ]; then
  # http://apt.syncthing.net/
  curl -s https://syncthing.net/release-key.txt | sudo apt-key add -
  echo "deb http://apt.syncthing.net/ syncthing release" | \
    sudo tee /etc/apt/sources.list.d/syncthing.list
  sudo apt-get -qq update
  sudo apt-get install -y syncthing
fi

if [ -z $(which atom) ]; then
  sudo add-apt-repository ppa:webupd8team/atom -y
  sudo apt-get -qq update
  sudo apt-get install -y atom
  make atom
fi

if [ -z $(which sshrc) ]; then
  # TODO install manually because the PPA is not maintained
  sudo add-apt-repository ppa:russell-s-stewart/ppa -y
  sudo apt-get -qq update
  sudo apt-get install -y sshrc
fi

# Less important apps
sudo apt-get install -y \
  keepassx \
  graphviz \
  postgresql-client \
  psensor \
  supervisor \
  unity-tweak-tool

echo ttf-mscorefonts-installer msttcorefonts/accepted-mscorefonts-eula \
  select true | sudo debconf-set-selections
sudo apt-get install -y ttf-mscorefonts-installer

# Manual steps:
#
# https://docs.syncthing.net/users/autostart.html#linux
# /usr/bin/syncthing -no-browser -home="/home/crc/.config/syncthing"
#
# https://fixubuntu.com/

# "Show the menues for a window" -> In the window's title bar

# Edit Unity shortcuts, disable "Navigation" keyboard shortcuts or else
# ctrl+alt+up/down won't work
