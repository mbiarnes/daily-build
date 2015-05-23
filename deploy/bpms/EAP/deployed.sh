#!/bin/bash

FILE1=$HOME/scripts/logfile1.log
FILE2=$HOME/scripts/logfile2.log

echo "***************************"
echo ""
echo " start deployed.sh "
echo " BPMS "
echo " EAP 6.4"
echo " 6.2.x branch "
echo ""
echo "***************************"
echo ""

cat $FILE1 $FILE > FILE3.txt

grep -w 'Failed to start service jboss.deployment.unit\|started (with errors)' FILE3.txt > log.txt

if [ $? -eq 0 ]
then
    # not deployed
    echo "6.2.x: kie-wb without modules NOT DEPLOYED on EAP 6.4"  | mail -s "Deployment on EAP 6.4" -a FILE3.txt  mbiarnes@redhat.com
else
    # deployed
    echo "6.2.x: kie-wb without modules  DEPLOYED on EAP 6.4"  | mail -s "Deployment on EAP 6.4" -a FILE3.txt mbiarnes@redhat.com
    date > /var/www/theme/jbpm-6-0-deploy-eap-6-1/date.txt
fi

echo "exit deployed.sh"
echo "***************************"
echo ""
