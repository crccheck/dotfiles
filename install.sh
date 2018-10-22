#!/bin/sh
#
# Do stuff
#
# wget -qO- https://raw.githubusercontent.com/crccheck/dotfiles/master/install.sh | sh
#
# Inspired by https://get.docker.com/

set -e

sh_c='sudo -E sh -c'

INSTALL_DEST=$HOME/Sync/dotfiles

$sh_c 'apt-get install git-core make -y' > /dev/null
if [ ! -d "${INSTALL_DEST}" ]; then
  cd && \
    git clone git://github.com/crccheck/dotfiles.git "${INSTALL_DEST}" && \
    cd "${INSTALL_DEST}" && \
    make basic
fi

exec "${INSTALL_DEST}/bootstrap.sh"
