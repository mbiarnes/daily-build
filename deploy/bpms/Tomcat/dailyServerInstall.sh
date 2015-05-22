#!/bin/bash
cd $HOME/scripts

./reinstall-tomcat7.sh 
sleep 15
./deployArtifacts-a.sh
sleep 120 
./deployArtifacts-b.sh
sleep 30
./startServer.sh
sleep 120 
./deployed.sh

