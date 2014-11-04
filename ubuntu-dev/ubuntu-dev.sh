# Install git
sudo apt-get install git

# Clone ubuntu-dev repo
git clone https://github.com/patrickocoffeyo/ubuntu-dev.git ~/.ubuntu-dev

# Install ansible
add-apt-repository ppa:rquillo/ansible
apt-get update
apt-get install ansible

# Run ansible-playbook
cd ~/ubuntu-dev
ansible-playbook -K ubuntu-dev.yml
