#!/bin/bash

cd $HOME/scripts/

./reinstall-wildfly8.sh
./deployArtifacts-a.sh
./deployArtifacts-b.sh
./startServer.sh
./deployed.sh
