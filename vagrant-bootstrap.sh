# !/usr/bin/env bash
sudo apt-get update

sudo apt-get -y install python-pip python-dev
sudo pip install ansible
mkdir -p /etc/ansible


echo '[localhost]' > /etc/ansible/hosts
echo '127.0.0.1' >> /etc/ansible/hosts
su vagrant -c "ansible-playbook /vagrant/ansible-local.yml"
