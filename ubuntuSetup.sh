#!/bin/bash
# Setup script for configuring Ubuntu 14 EC2 instance 

#Sort out locale errors in EC2 
cd $HOME
export LANGUAGE=en_US.UTF-8
export LANG=en_US.UTF-8
export LC_ALL=en_US.UTF-8
sudo locale-gen en_US.UTF-8
sudo dpkg-reconfigure locales

#Add repos
#emacs
echo | sudo add-apt-repository ppa:ubuntu-elisp/ppa

# Get ready for update
sudo apt-get update


#Install modules from added repos
sudo apt-get install -y emacs


# -----Basic module----
sudo apt-get install -y unzip

wget https://bin.equinox.io/c/4VmDzA7iaHb/ngrok-stable-linux-amd64.zip
unzip ngrok-stable-linux-amd64.zip
rm ngrok-stable-linux-amd64.zip


# -----Optional modules-----
sudo apt-get install -y nmap


