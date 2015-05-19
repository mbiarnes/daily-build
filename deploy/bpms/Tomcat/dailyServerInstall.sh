#!/bin/bash
cd $HOME/scripts

./triggerJenkins.sh
sleep 15
./reinstall-tomcat7.sh 
sleep 15
./deployArtifacts-a.sh
sleep 15 
./deployArtifacts-b.sh
sleep 15 
./startServer.sh
sleep 15 
./deployed.sh

