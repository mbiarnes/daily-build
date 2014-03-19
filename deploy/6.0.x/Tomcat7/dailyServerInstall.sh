#!/bin/bash
cd $HOME/scripts

./reinstall-tomcat7.sh 
sleep 15
./deployArtifacts-a.sh
sleep 15 
./deployArtifacts-b.sh
sleep 15 
./startServer.sh
sleep 15 
./deployed.sh
