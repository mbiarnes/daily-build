#!/bin/bash

LOG_DIR=/home/jbpm-master-depjboss-eap-6.3/standalone/log
File=$LOG_DIR/server.log

cd $LOG_DIR

grep -w "Failed to start service jboss.deployment.unit." $File > log.txt

if [ $? -eq 0 ]
then
    # not deployed
    echo "master: kie-wb NOT DEPLOYED on AS7"  | mail -s "Deployment on AS7" -a server.log mbiarnes@redhat.com pzapataf@redhat.com
else
    # deployed
    echo "master: kie-wb DEPLOYED on AS7"  | mail -s "Deployment on AS7" mbiarnes@redhat.com
fi
