#!/bin/bash
cd /usr/share/elasticsearch/plugins/
sudo git clone https://github.com/lukas-vlcek/bigdesk
sudo mkdir _site
sudo mv bigdesk/* _site
sudo mv _site bigdesk
sed -i"" 's/major == 1/major >= 1/' bigdesk/_site/js/store/BigdeskStore.js
