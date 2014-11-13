#!/bin/bash

LOG_DIR=/home/jbpm-deploy-brms-as/wildfly-8.1.0.Final/standalone/log
File=$LOG_DIR/server.log

cd $LOG_DIR

grep -w 'Failed to start service jboss.deployment.unit\|started (with errors)' $File > log.txt

if [ $? -eq 0 ]
then
    # not deployed
    echo "6.2.x: kie-drools-wb NOT DEPLOYED on Wildfly8"  | mail -s "Deployment on Wildfly8" -a server.log mbiarnes@redhat.com 
else
    # deployed
    echo "6.2.x: kie-drools-wb DEPLOYED on Wildfly8"  | mail -s "Deployment on Wildfly8" mbiarnes@redhat.com 
fi
