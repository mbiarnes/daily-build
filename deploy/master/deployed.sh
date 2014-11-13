#!/bin/bash

LOG_DIR=$HOME/wildfly-8.1.0.Final/standalone/log
File=$LOG_DIR/server.log

cd $LOG_DIR

grep -w "Failed to start service jboss.deployment.unit." $File > log.txt

if [ $? -eq 0 ]
then
    # not deployed
    echo "master: kie-wb NOT DEPLOYED on Wildfly 8"  | mail -s "Deployment on Wildfly 8" -a server.log mbiarnes@redhat.com 
else
    # deployed
    echo "master: kie-wb DEPLOYED on Wildfly 8"  | mail -s "Deployment on Wildfly 8" mbiarnes@redhat.com
fi
