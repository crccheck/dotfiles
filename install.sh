#!/bin/sh
#
# Do stuff
#
# wget -qO- https://raw.githubusercontent.com/crccheck/dotfiles/master/install.sh | sh
#
# Inspired by https://get.docker.com/

set -e

sh_c='sudo -E sh -c'

# $sh_c 'apt-get update'
$sh_c 'apt-get install git -y'
if [ ! -d .dotfiles ]; then
  cd && \
    git clone git://github.com/crccheck/dotfiles.git .dotfiles && \
    cd .dotfiles && \
    make basic
fi

# Install Ansible
$sh_c 'apt-get install python2.7 python-dev python-pip -y'
$sh_c 'pip install --ignore-installed "pip<6.0"'
$sh_c 'pip install ansible'
# Run ansible-playbook
cd ~/.dotfiles/ubuntu-dev
ansible-playbook -K -i "localhost," -c local ubuntu-dev.yml
# -K, --ask-sudo-pass  ask for sudo password
# -i                   inventory
# -c                   connection
