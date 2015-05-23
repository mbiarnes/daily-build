#!/bin/bash

FILE1=$HOME/scripts/logfile1.log

echo "***************************"
echo ""
echo " start deployed.sh "
echo " BRMS "
echo " Wildfly 8 "
echo " 6.2.x branch "
echo ""
echo "***************************"
echo ""

grep -w 'Failed to start service jboss.deployment.unit\|started (with errors)' $FILE1 > log.txt

if [ $? -eq 0 ]
then
    # not deployed
    echo "6.2.x: kie-drools-wb NOT DEPLOYED on Wildfly8"  | mail -s "Deployment on Wildfly8" -a $FILE1 mbiarnes@redhat.com 
else
    # deployed
    echo "6.2.x: kie-drools-wb DEPLOYED on Wildfly8"  | mail -s "Deployment on Wildfly8" -a $FILE1 mbiarnes@redhat.com 
    date > /var/www/theme/jbpm-deploy-brms-as/date.txt
fi

echo "exit deployed.sh"
echo "****************"
echo ""
