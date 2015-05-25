#!/bin/sh
#
# Variable definition 
export JAVA_HOME=/usr/java/latest
export DEFAULT_DIR=/var/kie-artifacts/6.2.x
export JBOSS_HOME=$HOME/wildfly-8.1.0.Final

echo "***************************"
echo ""
echo " start deployArtifacs-a.sh "
echo " BRMS "
echo " Wildfly 8 "
echo " 6.2.x branch "
echo ""
echo "***************************"
echo ""

# Copy deployments at EAP
cp $DEFAULT_DIR/kie-drools-wb-*-wildfly8.war $JBOSS_HOME/standalone/deployments/kie-drools-wb.war

nohup $JBOSS_HOME/bin/standalone.sh --server-config=standalone-full.xml < /dev/null >> $HOME/scripts/logfile1.log 2>&1 &

echo "exit deployArtifacts-a.sh"
echo "*************************"
echo ""
exit

