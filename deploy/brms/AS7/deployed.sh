#!/bin/bash

LOG_DIR=/home/jbpm-deploy-brms-as/jboss-eap-6.3/standalone/log
File=$LOG_DIR/server.log

cd $LOG_DIR

grep -w 'Failed to start service jboss.deployment.unit\|started (with errors)' $File > log.txt

if [ $? -eq 0 ]
then
    # not deployed
    echo "6.1.x: kie-drools-wb NOT DEPLOYED on AS7"  | mail -s "Deployment on AS7" -a server.log mbiarnes@redhat.com 
else
    # deployed
    echo "6.1.x: kie-drools-wb DEPLOYED on AS7"  | mail -s "Deployment on AS7" mbiarnes@redhat.com 
fi