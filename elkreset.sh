#!/bin/bash

curl -XDELETE 'http://localhost:9200/_all'

kill $(ps aux | grep [l]ogstash | awk '{print $2}')
sudo service kibana stop 
sudo service elasticsearch stop 

cd ~/pn21setup
sudo cp logstash_nmap.conf /opt/logstash/
sudo cp elasticsearch_nmap_template.json /opt/logstash/

sudo service kibana start 
sudo service elasticsearch start 

echo "Starting pipeline load"
cd /opt/logstash
bin/logstash -f logstash_nmap.conf &
echo "finished pipeline load"
sleep 30

echo "Starting fileload"
cd ~/logs/nmaplogs
curl -H "x-nmap-target: 21zerotier" http://localhost:8000 -d @nmapxml_2016_03_14.09\:32\:52.log
