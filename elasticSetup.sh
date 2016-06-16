#!/bin/bash

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


# Bigdesk
cd /usr/share/elasticsearch/plugins/
sudo git clone https://github.com/lukas-vlcek/bigdesk
sudo mkdir _site
sudo mv bigdesk/* _site
sudo mv _site bigdesk
cd /usr/share/elasticsearch/plugins/
sudo sed -i"" 's/major == 1/major >= 1/' bigdesk/_site/js/store/BigdeskStore.js


cd $HOME
echo "description=bigdesk" >> plugin-descriptor.properties
echo "version=master" >> plugin-descriptor.properties
echo "site=true" >> plugin-descriptor.properties
echo "name=bigdesk" >> plugin-descriptor.properties
sudo mv plugin-descriptor.properties /usr/share/elasticsearch/plugins/bigdesk/plugin-descriptor.properties

cd /opt/logstash/
sudo bin/logstash-plugin install logstash-codec-nmap
sudo bin/logstash-plugin install logstash-input-http
sudo bin/logstash-plugin install logstash-codec-rubydebug
sudo bin/logstash-plugin install logstash-codec-json_lines

sudo service elasticsearch start
sudo service kibana start
sudo service logstash start
