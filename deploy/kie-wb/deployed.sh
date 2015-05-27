#!/bin/bash

LOG_DIR=/home/kie-wb/jboss-eap-6.4/standalone/log
File=$LOG_DIR/server.log

cd $LOG_DIR

grep -w 'Failed to start service jboss.deployment.unit\|started (with errors)' $File > log.txt

if [ $? -eq 0 ]
then
    # not deployed
    echo "6.2.x: kie-wb NOT DEPLOYED on EAP 6.4"  | mail -s "Deployment on EAP 6.4" -a server.log mbiarnes@redhat.com
else
    # deployed
    echo "6.2.x: kie-wb DEPLOYED on EAP 6.4"  | mail -s "Deployment on EAP 6.4" mbiarnes@redhat.com
fi