CRCCHECK dot files
So like, these are the dot files I like.

# Installation

Install Read-only:

    aptitude install git

    cd
    git clone git://github.com/crccheck/dotfiles.git .dotfiles
    cd .dotfiles
    git submodule init
    git submodule update
    ./dostuff

    source ~/.bashrc

## Initial Setup

Create SSH keypair

    cd ~/.ssh
    ssh-keygen -t rsa -C "COMMENTGOESHERE"

Add it to Github, then go back and redo dotfiles config

    cd ~/.dotfiles
    git remote rm origin
    git remote add origin git@github.com:crccheck/dotfiles.git
    git submodule update
    git push -u origin master
    s dot
