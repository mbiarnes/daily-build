#!/bin/bash

cd $HOME/scripts/

./reinstall-wildfly8.sh
sleep 10
./deployArtifacts-a.sh
sleep 120
./deployed.sh
