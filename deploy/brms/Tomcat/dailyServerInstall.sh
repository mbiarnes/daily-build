#!/bin/bash
cd $HOME/scripts

./reinstall-tomcat.sh 
sleep 10
./deployArtifacts-a.sh
sleep 120
./deployed.sh

