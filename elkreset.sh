#!/bin/bash
curl -XDELETE 'http://localhost:9200/_all'

sudo service kibana restart &
sudo service elasticsearch restart

echo "Starting pipeline load"
cd /opt/logstash
bin/logstash -f logstash_nmap.conf &
echo "finished pipeline load"
sleep 30

echo "Starting fileload"
cd ~/logs/nmaplogs
curl -H "x-nmap-target: 21zerotier" http://localhost:8000 -d @nmapxml_2016_03_14.09\:32\:52.log
ps ax | grep logstash
