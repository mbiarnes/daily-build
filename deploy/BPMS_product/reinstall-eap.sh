#!/bin/bash
export PERMANENT=$HOME/scripts/config
export RESOURCES=$HOME/scripts/resources
export JBOSS_HOME=$HOME/jboss-eap-6.3
export SCRIPTS=$HOME/scripts/

echo "***************************"
echo ""
echo " start reinstall server "
echo " PRODUCT"
echo " EAP 6.3"
echo ""
echo "***************************"
echo ""

pkill -9 java
killall -9 /usr/java/default/bin/java

sleep 15 

rm -rf $HOME/jboss-eap-6.3
rm -rf $HOME/Uninstaller
rm $HOME/bpms-prod*.*
rm $SCRIPTS/jboss-bpms-*.zip
rm /var/www/theme/bpms-prod-eap-6.1.1/date.txt
rm -rf $SCRIPTS/.niogit
rm -rf $SCRIPTS/.index
rm -rf $SCRIPTS/.security

unzip $RESOURCES/jboss-eap.zip -d $HOME

echo "exit reinstall server "
echo "**********************"
echo ""
