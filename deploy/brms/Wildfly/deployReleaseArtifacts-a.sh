#!/bin/sh
#
# Variable definition 

echo "Which is the directory for the release artifacts?"
echo ""
read RELARTDIR
echo ""
echo "Which is the branch of artifacts: master or 6.2.x?"
echo ""
read BRANCH

export JAVA_HOME=/usr/java/latest
export DEFAULT_DIR=/var/jbpm-artifacts/$BRANCH/$RELARTDIR
export JBOSS_HOME=$HOME/wildfly-8.1.0.Final

cp $DEFAULT_DIR/kie-drools-wb-*-wildfly8.war $JBOSS_HOME/standalone/deployments/kie-drools-wb.war

$JBOSS_HOME/bin/standalone.sh --server-config=standalone-full.xml&

sleep 60

cd $HOME
date > /var/www/theme/jbpm-deploy-brms-as/date.txt
mv install.log installwildfly.log
cp $JBOSS_HOME/standalone/log/server.log .
mv server.log jBossServer.log
