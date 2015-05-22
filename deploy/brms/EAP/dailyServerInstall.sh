#!/bin/bash

cd $HOME/scripts
./reinstall-eap.sh 
sleep 10
./deployArtifacts-a.sh
sleep 120 
./deployed.sh
