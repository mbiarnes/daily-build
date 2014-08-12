#!/bin/bash
cd $HOME/scripts

./reinstall-tomcat.sh 
sleep 15
./deployArtifacts-a.sh
sleep 15 
./startServer.sh
sleep 15 
./deployed.sh
