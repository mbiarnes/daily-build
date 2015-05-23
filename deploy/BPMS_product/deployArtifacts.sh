#!/bin/sh
#
# Variable definition 
JBOSS_HOME=$HOME/jboss-eap-6.3
PERMANENT=$HOME/scripts/config
RESOURCE_DIR=$HOME/scripts/resources

echo "****************************"
echo ""
echo " start deployArtifacts-a.sh "
echo " PRODUCT"
echo " EAP 6.3"
echo ""
echo "****************************"
echo ""


unzip -o $RESOURCE_DIR/jboss-bpms-6.1.0.redhat-3-deployable-eap6.x.zip  -d $HOME

cp $PERMANENT/*.properties $JBOSS_HOME/standalone/configuration
cp $PERMANENT/standalone-full.xml $JBOSS_HOME/standalone/configuration
cp $PERMANENT/start.sh $JBOSS_HOME/bin

echo "exit deployArtifacts-a.sh"
echo "*************************"
echo ""
