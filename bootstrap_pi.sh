# create an empty 'ssh' file at the boot root

sudo apt update
sudo apt upgrade

cd
mkdir .ssh
chmod 700 .ssh
touch .ssh/authorized_keys
chmod 644 .ssh/authorized_keys
# now copy your ~/.ssh/id_rsa.pub to the .ssh/authorized_keys file

# Go ahead and reboot to sanity check sshd is running and your key works
sudo reboot

# Now SSH again forwarding this port for Syncthing
# $ ssh -L 18384:localhost:8384 kurol@pi5.local

# Syncthing
# https://apt.syncthing.net/
sudo mkdir -p /etc/apt/keyrings
sudo curl -L -o /etc/apt/keyrings/syncthing-archive-keyring.gpg https://syncthing.net/release-key.gpg
echo "deb [signed-by=/etc/apt/keyrings/syncthing-archive-keyring.gpg] https://apt.syncthing.net/ syncthing stable" | sudo tee /etc/apt/sources.list.d/syncthing.list
sudo apt-get update
sudo apt-get install syncthing

# From https://pimylifeup.com/raspberry-pi-syncthing/
sudo systemctl enable syncthing@$USER
sudo systemctl start syncthing@$USER



# pyenv
# pyenv in .bashrc
