#!/bin/bash
cd $HOME/scripts

./triggerJenkins.sh
sleep 10
./reinstall-tomcat.sh 
sleep 10
./deployArtifacts-a.sh
sleep 120
./deployed.sh

