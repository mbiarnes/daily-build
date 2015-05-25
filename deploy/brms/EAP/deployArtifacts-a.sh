#!/bin/sh
#
# Variable definition 
DEFAULT_DIR=/var/kie-artifacts/6.2.x
JBOSS_HOME=$HOME/jboss-eap-6.4

echo "**************************"
echo ""
echo " start deployArtifacs-a.sh "
echo " BRMS "
echo " EAP 6.4"
echo " 6.2.x branch"
echo ""
echo "**************************"
echo ""

# Copy deployments at EAP
cp $DEFAULT_DIR/kie-drools-wb-*-eap6_4.war $JBOSS_HOME/standalone/deployments/kie-drools-wb.war

nohup sh $JBOSS_HOME/bin/standalone.sh --server-config=standalone-full.xml < /dev/null >> $HOME/scripts/logfile1.log 2>&1 &

echo "exit deployArtifacts-a.sh"
echo "*************************"
echo ""
exit
