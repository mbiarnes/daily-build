#!/bin/bash
cd /home/jbpm-master-deploy-as7/scripts

./reinstall-as7.sh
sleep 10
./deployArtifacts-a.sh
sleep 10
./deployArtifacts-b.sh
sleep 10
./startServer.sh
sleep 10
./deployed.sh
