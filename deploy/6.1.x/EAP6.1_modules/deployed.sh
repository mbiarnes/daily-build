#!/bin/bash

LOG_DIR=/home/jbpm-6-0-deploy-eap-modulesmas/jboss-eap-6.1/standalone/log
File=$LOG_DIR/server.log

cd $LOG_DIR

grep -w "Failed to start service jboss.deployment.unit." $File > log.txt

if [ $? -eq 0 ]
then
    # not deployed
    echo "6.0.x: kie-wb NOT DEPLOYED on EAP 6.1.1"  | mail -s "Deployment on EAP 6.1.1 + modules" -a server.log mbiarnes@redhat.com pzapataf@redhat.com
else
    # deployed
    echo "6.0.x: kie-wb DEPLOYED on EAP 6.1.1"  | mail -s "Deployment on EAP 6.1.1 + modules" mbiarnes@redhat.com
fi
