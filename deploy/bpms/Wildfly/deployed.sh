#!/bin/bash

LOG_DIR=/home/jbpm-6-0-deploy-as7/wildfly-8.1.0.Final/standalone/log
File=$LOG_DIR/server.log

cd $LOG_DIR

grep -w 'Failed to start service jboss.deployment.unit\|started (with errors)' $File > log.txt

if [ $? -eq 0 ]
then
    # not deployed
    echo "6.2.x: kie-wb NOT DEPLOYED on Wildfly 8.1"  | mail -s "Deployment on Wildfly 8.1" -a server.log mbiarnes@redhat.com 
else
    # deployed
    echo "6.2.x: kie-wb DEPLOYED on Wildfly 8.1"  | mail -s "Deployment on Wildfly 8.1" mbiarnes@redhat.com 
fi
