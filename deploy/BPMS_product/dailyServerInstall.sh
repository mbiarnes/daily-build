#!/bin/bash

cd $HOME/scripts

./triggerJenkins.sh
sleep 15
./reinstall-eap.sh
sleep 15
./deployArtifacts.sh
sleep 15
./startServer.sh
sleep 15
./finalScript.sh
