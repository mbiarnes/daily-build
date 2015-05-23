#!/bin/bash

LOG_DIR=$HOME/apache-tomcat-7.0.42/logs
File=$LOG_DIR/catalina.out

echo "***************************"
echo ""
echo " start deployed.sh "
echo " BRMS"
echo " Tomcat 7"
echo " 6.2.x branch "
echo ""
echo "***************************"
echo ""

cd $LOG_DIR

grep -w 'Error deploying web application archive\|startup failed due to previous errors' $File > log.txt

if [ $? -eq 0 ]
then
    # not deployed
    echo "6.2.x: kie-drools-wb NOT DEPLOYED on Tomcat7"  | mail -s "Deployment on Tomcat7" -a catalina.out mbiarnes@redhat.com
else
    # deployed
    echo "6.2.x: kie-drools-wb DEPLOYED on Tomcat7"  | mail -s "Deployment on Tomcat7" -a catalina.out mbiarnes@redhat.com 
    date > /var/www/theme/jbpm-deploy-brms-tomcat/date.txt
fi

echo "exit deployed.sh"
echo "****************"
echo ""
