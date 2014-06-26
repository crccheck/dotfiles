cd
mkdir --mode=700 .ssh && cd .ssh
ssh-keygen -t rsa -C "crc@crc-changethis"

sudo add-apt-repository ppa:fkrull/deadsnakes -y  # python
sudo add-apt-repository ppa:webupd8team/sublime-text-2 -y
# sudo add-apt-repository ppa:chromium-daily/dev -y
# sudo add-apt-repository ppa:ubuntu-mozilla-daily/firefox-aurora -y

# disable ubuntu's annoying "System Program Problem Detected"...
sudo sed -i 's/enabled=1/enabled=0/' /etc/default/apport

# uninstall pre-installs I never use
remove brasero libreoffice-core thunderbird banshee -y


# other stuff
update
install curl athena-jot -y
install sublime-text vim-gnome ttf-mscorefonts chromium-browser  -y
# get old/new versions of python
install python2.6 python3.3 python3.4 -y

# remember to edit Unity shortcuts, disable workspace keyboard shortcuts or ctrl+alt+up/down won't work

# use my sublime text config instead of default
cd ~/.config/sublime-text-2
rm -rf Packages
ln -s ~/.dotfiles/sublime-text-2/Packages


# # Docker.io
#
# http://docs.docker.io/en/latest/installation/ubuntulinux/
# Add the Docker repository key to your local keychain
# using apt-key finger you can check the fingerprint matches 36A1 D786 9245 C895 0F96 6E92 D857 6A8B A88D 21E9
sudo sh -c "curl https://get.docker.io/gpg | apt-key add -"
# Add the Docker repository to your apt sources list.
sudo sh -c "echo deb http://get.docker.io/ubuntu docker main > /etc/apt/sources.list.d/docker.list"
update
install lxc-docker -y

# Giving non-root access
#
# http://docs.docker.io/installation/ubuntulinux/#ubuntu-trusty-1404-lts-64-bit
sudo groupadd docker
sudo gpasswd -a ${USER} docker
sudo service docker restart


# # databases
#
# install mysql-client-core-5.5

# install postgresql libpq-dev postgresql-server-dev-9.2 -y
# for GIS
# install lib-geos-dev


# # ack and ag
install ack-grep silversearcher-ag -y
sudo dpkg-divert --local --divert /usr/bin/ack --rename --add /usr/bin/ack-grep


# set up virtualenv and python stuff
#
install python-pip libmysqlclient-dev libpq-dev python-dev -y

sudo pip install virtualenvwrapper csvkit
source ~/.bashrc  # setup virtualenv env variables
# sudo rm ~/.pip


# # Take ownership of `/usr/local`
#
# ref: http://howtonode.org/introduction-to-npm
sudo chown -R $USER /usr/local


# # node
#
install nodejs nodejs-legacy

# now open a new terminal for path

sudo npm install -g grunt-cli jshint n
n --stable
npm update -g

# # ruby
#
# use rbenv instead of rvm because rvm overwrites `cd`
# install rbenv ruby-build -y
# mkdir ~/.rbenv
# use `sudo` becaue I'm too lazy to figure out how to get `ruby-build` to
# install a recent version of ruby without intalling directly from github
sudo gem install heroku lolcat bundler
heroku plugins:install git://github.com/heroku/heroku-pg-extras.git


# # Autoenv
#
# Install from `master` because packaged versions are too old and don't support
# foreman compatible .env files.
git clone git://github.com/kennethreitz/autoenv.git ~/.autoenv
touch ~/.autoenv_authorized


# # More python stuff
#
# if this gives you trouble, you need to add a `deb-src` line to your sources.list
sudo apt-get build-dep lxml -y

# unfuck PIL
install libjpeg-dev -y
cd /usr/lib
sudo ln -s i386-linux-gnu/libz.so .
sudo ln -s i386-linux-gnu/libjpeg.so .
sudo ln -s i386-linux-gnu/libjpeg.so.8 .
sudo ln -s i386-linux-gnu/libjpeg.so.62 .
sudo ln -s i386-linux-gnu/libfreetype.so.6 .


# gconf settings
# gconf-editor
# apps/metacity/window_keybindings


# TODO

# inotify helps other programs watch files
install inotify-tools
