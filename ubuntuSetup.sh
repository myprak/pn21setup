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
sudo apt-get install -y git

# -----Optional modules-----
sudo apt-get install -y nmap


# Elasticsearch
wget -qO - https://packages.elastic.co/GPG-KEY-elasticsearch | sudo apt-key add -
echo "deb https://packages.elastic.co/elasticsearch/2.x/debian stable main" | sudo tee -a /etc/apt/sources.list.d/elasticsearch-2.x.list
echo "deb https://packages.elastic.co/logstash/2.3/debian stable main" | sudo tee -a /etc/apt/sources.list
echo "deb http://packages.elastic.co/kibana/4.5/debian stable main" | sudo tee -a /etc/apt/sources.list
sudo apt-get update
sudo apt-get install -y openjdk-7-jre
sudo apt-get install -y logstash
sudo apt-get install -y kibana
sudo apt-get install -y elasticsearch


# ----21dotco-----needs pass username plus need to store machine wallet retrieval key, plus reboot for docker
curl https://21.co | sh
21 join
21 sell start --all
