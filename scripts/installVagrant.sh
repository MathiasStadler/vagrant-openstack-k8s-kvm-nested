#!/bin/bash
# switch to tmp
cd && cd /tmp
# download
curl https://releases.hashicorp.com/vagrant/2.2.9/vagrant_2.2.9_x86_64.rpm -O
# install
sudo dnf install -y vagrant_2.2.9_x86_64.rpm