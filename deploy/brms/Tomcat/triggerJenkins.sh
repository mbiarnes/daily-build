#!/bin/bash

# triggers a Jenkins Job

echo "***************************"
echo ""
echo " start triggerJenkins.sh "
echo " BRMS"
echo " Tomcat 7"
echo " 6.2.x branch "
echo ""
echo "***************************"
echo ""

wget --no-check-certificate 'https://brms-jenkins.rhev-ci-vms.eng.rdu2.redhat.com/buildByToken/build?job=kie-all-build-master&token=543210'

echo "exit triggerJenkins.sh"
echo "**********************"
echo ""
