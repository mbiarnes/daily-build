#!/bin/bash

# triggers a Jenkins Job

echo "****************************"
echo ""
echo " start triggerJenkins.sh "
echo " master"
echo " EAP 6.3"
echo ""
echo "****************************"
echo ""

wget --no-check-certificate 'https://brms-jenkins.rhev-ci-vms.eng.rdu2.redhat.com/buildByToken/build?job=kie-all-build-6.2.x&token=012345'

echo "exit triggerJenkins.sh"
echo "**********************"
echo ""
