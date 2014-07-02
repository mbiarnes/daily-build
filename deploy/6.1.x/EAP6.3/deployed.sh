#!/bin/bash

LOG_DIR=/home/jbpm-6-0-deploy-eap-6-1/jboss-eap-6.3/standalone/log
File=$LOG_DIR/server.log

cd $LOG_DIR

grep -w 'Failed to start service jboss.deployment.unit\|started (with errors)' $File > log.txt

if [ $? -eq 0 ]
then
    # not deployed
    echo "6.1.x: kie-wb without modules NOT DEPLOYED on EAP 6.3"  | mail -s "Deployment on EAP 6.3" -a server.log mbiarnes@redhat.com
else
    # deployed
    echo "6.1.x: kie-wb without modules  DEPLOYED on EAP 6.3"  | mail -s "Deployment on EAP 6.3" mbiarnes@redhat.com
fi
