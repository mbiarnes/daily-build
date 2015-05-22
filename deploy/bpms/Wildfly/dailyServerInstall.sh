#!/bin/bash

cd $HOME/scripts/

./reinstall-wildfly8.sh
sleep 10
./deployArtifacts-a.sh
sleep 120
./deployArtifacts-b.sh
sleep 30
./startServer.sh
sleep 120
./deployed.sh
