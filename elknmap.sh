#!/bin/bash

chmod 777 ubuntuSetup.sh && ./ubuntuSetup.sh
chmod 777 elasticSetup.sh && ./elasticSetup.sh

cd $HOME
scp -r twenty@202.154.32.103:~/logs .
