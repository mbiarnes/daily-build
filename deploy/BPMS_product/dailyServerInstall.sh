#!/bin/bash

cd $HOME/scripts

./reinstall-eap.sh
sleep 15
./deployArtifacts.sh
sleep 15
./startServer.sh
sleep 15
./deployed.sh
