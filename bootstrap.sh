#!/bin/bash
set -e
set -x

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
sudo add-apt-repository ppa:webupd8team/sublime-text-2 -y

sudo apt-get update -qq
sudo apt-get install -y \
  curl athena-jot jq aptitude \
  sublime-text vim-gnome chromium-browser \
  ack-grep silversearcher-ag \
  python2.6 python2.7 python3.3 python3.4 python-dev python-pip \
  libmysqlclient-dev \
  libpq-dev libgeos-dev
sudo dpkg-divert --local --divert /usr/bin/ack --rename --add /usr/bin/ack-grep


# Take ownership of `/usr/local`
################################
# ref: http://howtonode.org/introduction-to-npm
sudo chown -R $USER /usr/local

# Base Python
#############
sudo pip install -I "pip<6.0"
sudo pip install --quiet virtualenvwrapper csvkit awscli ansible postdoc
# set up virtualenv and python stuff
source ~/.bashrc  # setup virtualenv env variables

# Docker.io
###########
# https://get.docker.com/ubuntu/
# http://docs.docker.io/en/latest/installation/ubuntulinux/
#
# Add the Docker repository key to your local keychain
# using apt-key finger you can check the fingerprint matches 36A1 D786 9245 C895 0F96 6E92 D857 6A8B A88D 21E9
sudo sh -c "curl https://get.docker.io/gpg | apt-key add -"
# Add the Docker repository to your apt sources list.
sudo sh -c "echo deb http://get.docker.io/ubuntu docker main > /etc/apt/sources.list.d/docker.list"
update
sudo apt-get install lxc-docker -y

# Giving non-root access
sudo usermod -aG docker ${USER}
sudo pip install docker-compose

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
sudo apt-get build-dep pillow -y
sudo apt-get install libjpeg-dev -y
sudo ln -s /usr/lib/`uname -i`-linux-gnu/libz.so /usr/lib
sudo ln -s /usr/lib/`uname -i`-linux-gnu/libjpeg.so /usr/lib
# sudo ln -s /usr/lib/`uname -i`-linux-gnu/libjpeg.so.8 /usr/lib
# sudo ln -s /usr/lib/`uname -i`-linux-gnu/libjpeg.so.62 /usr/lib
# sudo ln -s /usr/lib/`uname -i`-linux-gnu/libfreetype.so.6 /usr/lib

# Node
######
sudo apt-get install nodejs nodejs-legacy npm -y
# TODO

# Ruby
######
# use rbenv instead of rvm because rvm overwrites `cd`
sudo apt-get install rbenv heroku-toolbelt -y
mkdir ~/.rbenv/plugins
git clone https://github.com/sstephenson/ruby-build.git ~/.rbenv/plugins/ruby-build
# use `sudo` becaue I'm too lazy to figure out how to get `ruby-build` to
# install a recent version of ruby without intalling directly from github
sudo gem install lolcat bundler
heroku plugins:install git://github.com/heroku/heroku-pg-extras.git

# inotify helps other programs watch files
sudo apt-get install inotify-tools -y
