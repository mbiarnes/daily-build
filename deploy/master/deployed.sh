#!/bin/bash

FILE1=$HOME/scripts/logfile1.log
FILE2=$HOME/scripts/logfile2.log

cat $FILE1 $FILE > FILE3.txt

grep -w "Failed to start service jboss.deployment.unit." FILE3.txt  > log.txt

if [ $? -eq 0 ]
then
    # not deployed
    echo "master: kie-wb NOT DEPLOYED on Wildfly 8"  | mail -s "Deployment on Wildfly 8" -a FILE3.txt mbiarnes@redhat.com 
else
    # deployed
    echo "master: kie-wb DEPLOYED on Wildfly 8"  | mail -s "Deployment on Wildfly 8" -a FILE3.txt mbiarnes@redhat.com
    date > /var/www/theme/jbpm-master-deploy-as7/date.txt
fi
