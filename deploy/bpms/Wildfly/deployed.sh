#!/bin/bash

FILE1=$HOME/scripts/logfile1.log
FILE2=$HOME/scripts/logfile2.log

cat $FILE1 $FILE > FILE3.txt

grep -w 'Failed to start service jboss.deployment.unit\|started (with errors)' FILE3.txt > log.txt


if [ $? -eq 0 ]
then
    # not deployed
    echo "6.2.x: kie-wb NOT DEPLOYED on Wildfly 8.1"  | mail -s "Deployment on Wildfly 8.1" -a FILE3.txt  mbiarnes@redhat.com 
else
    # deployed
    echo "6.2.x: kie-wb DEPLOYED on Wildfly 8.1"  | mail -s "Deployment on Wildfly 8.1" -a FILE3.txt mbiarnes@redhat.com
    date > /var/www/theme/jbpm-6-0-deploy-as7/date.txt 
fi
