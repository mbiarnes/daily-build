#!/bin/bash

cd /home/jbpm-6-0-deploy-as7/scripts/

./reinstall-as7.sh
./deployArtifacts-a.sh
./deployArtifacts-b.sh
./startServer.sh
./deployed.sh
