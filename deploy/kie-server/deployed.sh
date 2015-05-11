#!/bin/bash

LOG_DIR=$HOME/apache-tomcat-7.0.42/logs
File=$LOG_DIR/catalina.out

cd $LOG_DIR

grep -w 'Error deploying web application archive\|startup failed due to previous errors' $File > log.txt

if [ $? -eq 0 ]
then
    # not deployed
    echo "6.2.x: kie-server-*-webc NOT DEPLOYED on Tomcat7"  | mail -s "Deployment on Tomcat7" -a catalina.out mbiarnes@redhat.com
else
    # deployed
    echo "6.2.x: kie-server-*-webc DEPLOYED on Tomcat7"  | mail -s "Deployment on Tomcat7" mbiarnes@redhat.com 
fi