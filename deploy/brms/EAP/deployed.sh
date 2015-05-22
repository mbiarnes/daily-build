#!/bin/bash

FILE1=$HOME/scripts/logfile1.log

grep -w 'Failed to start service jboss.deployment.unit\|started (with errors)' $FILE1 > log.txt

if [ $? -eq 0 ]
then
    # not deployed
    echo "6.2.x: kie-drools-wb without modules NOT DEPLOYED on EAP 6.4"  | mail -s "Deployment on EAP 6.3" -a $FILE1  mbiarnes@redhat.com
else
    # deployed
    echo "6.2.x: kie-drools-wb without modules  DEPLOYED on EAP 6.4"  | mail -s "Deployment on EAP 6.3" -a $FILE1 mbiarnes@redhat.com
    date > /var/www/theme/jbpm-deploy-brms-eap/date.txt
fi
