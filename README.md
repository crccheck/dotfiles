CRCCHECK dot files
==================

So like, these are the dot files I like.


Installation
------------

```
wget -qO- https://raw.githubusercontent.com/crccheck/dotfiles/master/install.sh | sh
```

Install Read-only:

    sudo apt-get install git -y

    cd
    git clone git://github.com/crccheck/dotfiles.git
    cd dotfiles
    git submodule update --init
    make
    s dot

Hey, make a ssh key!

    cd
    mkdir --mode=700 .ssh && cd .ssh
    ssh-keygen -t rsa -b 4096 -C "crc@crc-changethis"

https://help.github.com/articles/generating-a-new-ssh-key-and-adding-it-to-the-ssh-agent/

Re-adding the remote after github has my pub key:

    g dot
    git remote rm origin
    git remote add origin git@github.com:crccheck/dotfiles.git
    git submodule update
    git branch -u origin/master
