#!/bin/sh
#
# Do stuff
#
# wget -qO- https://raw.githubusercontent.com/crccheck/dotfiles/master/install.sh | sh
#
# Inspired by https://get.docker.com/

set -e

sh_c='sudo -E sh -c'

$sh_c 'apt-get install git-core -y' > /dev/null
if [ ! -d .dotfiles ]; then
  cd && \
    git clone git://github.com/crccheck/dotfiles.git .dotfiles && \
    cd .dotfiles && \
    make basic
fi

read -p "Press [Enter] to continue bootstrapping..."

${HOME}/.dotfiles/bootstrap.sh
