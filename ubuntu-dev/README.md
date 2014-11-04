# Ubuntu Dev

This repository contains an ansible playbook that will turn your vanilla Ubuntu
installation to be a pretty cool web development machine.

## Installation

Fork, change user in ```ubuntu-dev.yml``` to your installing user.
Then run:

```curl https://raw.githubusercontent.com/yourghusername/ubuntu-dev/master/ubuntu-dev.sh | sudo /bin/sh```


You will need to type in your sudo password twice, once for the script
execution (it makes sure git and ansible are installed), and then once again so
that ansible can install it's packages.


```bash
sudo apt-get install -y openssh-server
```
