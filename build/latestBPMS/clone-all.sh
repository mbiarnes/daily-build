#!/bin/bash
#
# REMOVES LOCAL GIT REPS AND CLONES ALL REPS AGAIN
#

rm -rf $HOME/GIT
rm $HOME/*
mkdir -p $HOME/GIT
cd $HOME/GIT

git clone https://github.com/droolsjbpm/droolsjbpm-build-bootstrap.git
git clone https://github.com/droolsjbpm/jbpm-console-ng.git
git clone https://github.com/droolsjbpm/guvnor.git
git clone https://github.com/droolsjbpm/optaplanner.git
git clone https://github.com/droolsjbpm/jbpm.git
git clone https://github.com/droolsjbpm/jbpm-form-modeler.git
git clone https://github.com/droolsjbpm/droolsjbpm-knowledge.git
git clone https://github.com/droolsjbpm/dashboard-builder.git
git clone https://github.com/droolsjbpm/kie-wb-distributions.git
git clone https://github.com/droolsjbpm/jbpm-designer.git
git clone https://github.com/droolsjbpm/droolsjbpm-integration.git
git clone https://github.com/droolsjbpm/droolsjbpm-build-distribution.git
git clone https://github.com/droolsjbpm/droolsjbpm-tools.git
git clone https://github.com/droolsjbpm/drools.git
git clone https://github.com/droolsjbpm/kie-wb-common.git
git clone https://github.com/droolsjbpm/drools-wb.git
git clone https://github.com/droolsjbpm/jbpm-dashboard.git
git clone https://github.com/droolsjbpm/kie-uberfire-extensions.git

#
# CHECKS OUT TO THE RIGHT 6.2.x BRANCHES
#

./droolsjbpm-build-bootstrap/script/git-all.sh checkout 6.2.x
