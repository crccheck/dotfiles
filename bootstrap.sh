# How to get an Ubuntu system up to speed, written as a shell script just for
# syntax highlighting, but run manually via copy-paste.

# NOTES: this script assumes that PPAs are updated for your distribution
# if they aren't, you have to manually edit your /etc/apt/sources.list.d

# Super-size me
###############

sudo usermod -aG sudo ${USER}


sudo apt install syncthing keepassxc

# Install Firefox from Snap

sudo apt install gnome-tweaks zsh curl git
# Tweaks:
# Keyboard -> Additional Layout Options: make Caps Lock act like ESC

chsh -s /usr/bin/zsh

# log out/in

curl -sS https://starship.rs/install.sh | sh

sudo apt install neovim
make vim

# VSCode
# https://code.visualstudio.com/download
sudo dpkg -i /path/to/deb

# Niri
# https://niri-wm.github.io/niri/Getting-Started.html
sudo add-apt-repository ppa:avengemedia/danklinux
sudo add-apt-repository ppa:avengemedia/dms
sudo apt install niri dms kimageformat6-plugins

# Ghostty is in Ubuntu 26.04+'s official repos
sudo apt install ghostty
make ghostty


# Framework Computer Tools
sudo apt install -y framework-tool
sudo apt install -y wl-clipboard

# Fingerprint
sudo apt install fprintd libpam-fprintd
fprintd-enroll
sudo pam-auth-update
# Go into Niri settings and use System PAM Authentication

# Quicklook
sudo apt install gnome-sushi \
  direnv

# disable ubuntu's annoying "System Program Problem Detected"...
sudo sed -i 's/enabled=1/enabled=0/' /etc/default/apport
# disable ubuntu's annoying mlocate hog
sudo chmod -x /etc/cron.daily/mlocate
# disable ubuntu auto updates
sudo sed -i 's/"1"/"0"/' /etc/apt/apt.conf.d/10periodic
# uninstall bundled packages I never use
sudo apt-get remove -y nautilus-sendto


curl -fsSL https://bun.sh/install | bash
curl -fsSL https://omp.sh/install | sh

# Install
#########

# Important Stuff first
sudo apt install -y libncurses-dev gawk

sudo apt install -y \
  curl athena-jot jq \
  tree \
  silversearcher-ag

# Heavier stuff
sudo apt install -y \
  chromium-browser \
  libmysqlclient-dev \
  libpq-dev libgeos-dev

# Take ownership of `/usr/local`
################################
# ref: http://howtonode.org/introduction-to-npm
sudo chown -R $USER:$USER /usr/local

# Docker
########
# https://docs.docker.com/engine/install/ubuntu/
curl -fsSL https://get.docker.com -o get-docker.sh
sudo sh ./get-docker.sh --dry-run
# rm get-docker.sh

sudo usermod -aG docker ${USER}

# Modern Python 3
#################
sudo apt update; sudo apt install make build-essential libssl-dev zlib1g-dev \
libbz2-dev libreadline-dev libsqlite3-dev curl git \
libncursesw5-dev xz-utils tk-dev libxml2-dev libxmlsec1-dev libffi-dev liblzma-dev

curl -fsSL https://pyenv.run | bash
pyenv install 3.14
pyenv global 3.14

curl -LsSf https://astral.sh/uv/install.sh | sh

uv tool install yt-dlp --with curl_cffi
uv tool install gallery-dl --with yt-dlp

pip install --quiet awscli postdoc
source ~/.bashrc  # Setup virtualenv env variables

# NodeJS
########

curl -o- https://fnm.vercel.app/install | bash
fnm install 24
# Note this also adds PATH helper

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

# Manual steps:
#
# https://docs.syncthing.net/users/autostart.html#linux
# /usr/bin/syncthing -no-browser -home="/home/crc/.config/syncthing"
#
# https://fixubuntu.com/

# "Show the menues for a window" -> In the window's title bar

# Edit Unity shortcuts, disable "Navigation" keyboard shortcuts or else
# ctrl+alt+up/down won't work


# Media
########
sudo apt-add-repository "deb http://apt.fruit.je/debian trixie mpv"
sudo curl --output-dir /etc/apt/trusted.gpg.d -O https://apt.fruit.je/fruit.gpg
sudo apt install mpv

# Nautilus Search (Tracker)
########
gsettings set org.freedesktop.Tracker3.Miner.Files ignored-directories "['po','CVS','core-dumps','lost+found','@eaDir']"

# Framework 13 Ryzen AI 300: s2idle suspend hangs on wake (niri session),
# requires hard power-cycle.
# Add pm_async=0 to GRUB_CMDLINE_LINUX_DEFAULT in /etc/default/grub, then:
#   sudo update-grub
#   sudo reboot
#   cat /proc/cmdline   # must show pm_async=0
# If it still hangs, add pcie_port_pm=off to the same line and repeat.
# Refs:
# https://community.frame.work/t/hibernate-resume-failures-on-framework-13-amd-ryzen-ai-300-krackan-a-b-tested-workaround-pm-async-0/83040
# https://github.com/NixOS/nixos-hardware/issues/1782
# https://github.com/noctalia-dev/umbriel/issues/292
# https://community.frame.work/t/what-sleep-modes-are-supported-by-framework-13-with-ryzen-300-series-cpu/73314
