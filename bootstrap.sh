sudo apt-get install aptitude -y

sudo add-apt-repository ppa:fkrull/deadsnakes -y  # python
sudo add-apt-repository ppa:webupd8team/sublime-text-2 -y

# disable ubuntu's annoying "System Program Problem Detected"...
sudo sed -i 's/enabled=1/enabled=0/' /etc/default/apport

# uninstall bundled packages I never use
sudo apt-get remove -y brasero libreoffice-core libreoffice-common \
  thunderbird banshee gnome-sudoku


# other stuff
update
sudo apt-get install -y curl athena-jot jq \
  sublime-text vim-gnome chromium-browser \
  python2.6 python3.3 python3.4

# remember to edit Unity shortcuts, disable workspace keyboard shortcuts or ctrl+alt+up/down won't work

# use my sublime text config instead of default
cd
mkdir -p .config/sublime-text-2
cd .config/sublime-text-2
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
sudo apt-get install lxc-docker -y
sudo pip install fig

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
# for postgres and GIS
sudo apt-get install -y libgeos-dev libpq-dev


# # ack and ag
sudo apt-get install ack-grep silversearcher-ag -y
sudo dpkg-divert --local --divert /usr/bin/ack --rename --add /usr/bin/ack-grep


# set up virtualenv and python stuff
#
sudo apt-get install python-pip libmysqlclient-dev libpq-dev python-dev -y

sudo pip install virtualenvwrapper csvkit awscli ansible
source ~/.bashrc  # setup virtualenv env variables


# # Take ownership of `/usr/local`
#
# ref: http://howtonode.org/introduction-to-npm
sudo chown -R $USER /usr/local


# # Autoenv
#
# Install from `master` because packaged versions are too old and don't support
# foreman compatible .env files.
cd
git clone git://github.com/crccheck/autoenv.git ~/.autoenv
touch ~/.autoenv_authorized


# # More python stuff
#
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


# # ruby
#
# use rbenv instead of rvm because rvm overwrites `cd`
# install rbenv ruby-build -y
# mkdir ~/.rbenv
# use `sudo` becaue I'm too lazy to figure out how to get `ruby-build` to
# install a recent version of ruby without intalling directly from github
sudo gem install heroku lolcat bundler
heroku plugins:install git://github.com/heroku/heroku-pg-extras.git

# inotify helps other programs watch files
sudo apt-get install inotify-tools -y

# # node
#
sudo apt-get install nodejs nodejs-legacy npm -y

# ----

# now open a new terminal for path

sudo npm install -g grunt-cli jshint n
n --stable
npm update -g


# # Virtualbox

sudo apt-get install -y virtualbox vagrant



# install unity-tweak-tool -y
# disable Window Animations

# gconf settings
# gconf-editor
# apps/metacity/window_keybindings


