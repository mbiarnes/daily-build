#!/bin/bash

cd $HOME/scripts
./reinstall-eap-6.1.1.sh 
./deployArtifacts-a.sh 
./deployArtifacts-b.sh
./startServer.sh 
./deployed.sh
