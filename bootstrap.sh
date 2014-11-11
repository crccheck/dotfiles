# disable ubuntu's annoying "System Program Problem Detected"...
sudo sed -i 's/enabled=1/enabled=0/' /etc/default/apport

# disable ubuntu's annoying mlocate hog
sudo chmod -x /etc/cron.daily/mlocate



# remember to edit Unity shortcuts, disable workspace keyboard shortcuts or ctrl+alt+up/down won't work

# use my sublime text config instead of default
cd
mkdir -p .config/sublime-text-2
cd .config/sublime-text-2
rm -rf Packages
ln -s ~/.dotfiles/sublime-text-2/Packages


# # Docker.io
sudo pip install fig



# # databases
#
# install mysql-client-core-5.5
# install postgresql postgresql-server-dev-9.2 -y


# # ack and ag
sudo dpkg-divert --local --divert /usr/bin/ack --rename --add /usr/bin/ack-grep


# set up virtualenv and python stuff
#

source ~/.bashrc  # setup virtualenv env variables


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
install rbenv -y
mkdir ~/.rbenv/plugins
git clone https://github.com/sstephenson/ruby-build.git ~/.rbenv/plugins/ruby-build
# use `sudo` becaue I'm too lazy to figure out how to get `ruby-build` to
# install a recent version of ruby without intalling directly from github
sudo gem install lolcat bundler
# install toolbelt otherwise heroku complains it wasn't installed via toolbelt
wget -qO- https://toolbelt.heroku.com/install-ubuntu.sh | sh
heroku plugins:install git://github.com/heroku/heroku-pg-extras.git

# inotify helps other programs watch files
sudo apt-get install inotify-tools -y


npm update -g


# sudo apt-add-repository -y ppa:jon-severinsson/ffmpeg
# sudo apt-get update
# sudo apt-get install -y ffmpeg

# # Virtualbox

# sudo apt-get install -y virtualbox vagrant



# install unity-tweak-tool -y
# disable Window Animations

# gconf settings
# gconf-editor
# apps/metacity/window_keybindings


