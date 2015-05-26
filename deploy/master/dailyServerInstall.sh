#!/bin/bash
cd $HOME/scripts

./triggerJenkins.sh
sleep 10
./reinstall-wildfly8.sh
sleep 10
./deployArtifacts-a.sh
sleep 120
./deployArtifacts-b.sh
sleep 30
./startServer.sh
sleep 120
./deployed.sh
