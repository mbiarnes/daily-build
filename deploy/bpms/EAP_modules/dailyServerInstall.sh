#!/bin/bash

cd $HOME/scripts


./reinstall-eap-6.3-mod.sh
sleep 15
./deployArtifacts-a.sh
sleep 15
./deployArtifacts-b.sh
sleep 15
./deployArtifacts-c.sh
sleep 15
./startServer.sh
sleep 15
./deployed.sh
