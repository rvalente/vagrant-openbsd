#!/bin/ksh

# sleep to ensure relink_kernel is done and run syspatch
sleep 15
syspatch

# run syspatch again
sleep 15
syspatch

# ensure we have curl for rc.firsttime
pkg_add curl bash

# Allow openbsd user to login as root
echo 'permit vagrant as root' > /etc/doas.conf

# disable root ssh
sed -i 's/PermitRootLogin yes/PermitRootLogin no/g' /etc/ssh/sshd_config

# remove ssh host key
rm -rfv /etc/ssh/*key*

# Setup Vagrant ssh
mkdir -p /home/vagrant/.ssh
chmod 0700 /home/vagrant/.ssh
curl -o /home/vagrant/.ssh/authorized_keys https://raw.githubusercontent.com/hashicorp/vagrant/master/keys/vagrant.pub
chmod 0600 /home/vagrant/.ssh/authorized_keys
chown vagrant:vagrant /home/vagrant/.ssh/authorized_keys

# Set default shell for vagrant user
chsh -s /usr/local/bin/bash vagrant
