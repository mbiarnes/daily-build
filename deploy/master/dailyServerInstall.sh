#!/bin/bash
cd $HOME/scripts

./reinstall-wildfly8.sh
sleep 10
./deployArtifacts-a.sh
sleep 10
./deployArtifacts-b.sh
sleep 10
./startServer.sh
sleep 10
./deployed.sh
