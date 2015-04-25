CRCCHECK dot files
So like, these are the dot files I like.

# Installation

```
wget -qO- https://raw.githubusercontent.com/crccheck/dotfiles/master/install.sh | sh
```

Install Read-only:

    sudo apt-get install git -y

    cd
    git clone git://github.com/crccheck/dotfiles.git .dotfiles
    cd .dotfiles
    git submodule update --init
    make
    s dot

For OSX, `make` won't do my sublime text config, follow instructions in
https://packagecontrol.io/docs/syncing for that.

Hey, make a ssh key!

    cd
    mkdir --mode=700 .ssh && cd .ssh
    ssh-keygen -t rsa -C "crc@crc-changethis"

Re-adding the remote after github has my pub key:

    cd ~/.dotfiles
    git remote rm origin
    git remote add origin git@github.com:crccheck/dotfiles.git
    git submodule update
    git push -u origin master
