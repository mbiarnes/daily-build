#!/bin/bash
cd $HOME/scripts

./triggerJenkins.sh
sleep 15
./reinstall-tomcat.sh 
sleep 15
./deployArtifacts-a.sh
sleep 15 
./finalScript.sh
sleep 15
./deployed.sh
sleep 15
