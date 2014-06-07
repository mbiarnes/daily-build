#!/bin/bash
#
# REMOVES LOCAL GIT REPS AND CLONES ALL REPS AGAIN
#

rm $HOME/dailyBuild.log
rm -rf $HOME/GIT
mkdir -p $HOME/GIT
cd $HOME/GIT

git clone https://github.com/droolsjbpm/droolsjbpm-build-bootstrap.git
git clone https://github.com/droolsjbpm/jbpm-console-ng.git
git clone https://github.com/uberfire/uberfire.git
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

#
# CHECKS OUT TO THE RIGHT 6.1.x BRANCHES
#

cd $HOME/GIT/droolsjbpm-build-bootstrap
git checkout 6.1.x
cd $HOME/GIT/jbpm-console-ng
git checkout 6.1.x
cd $HOME/GIT/guvnor
git checkout 6.1.x
cd $HOME/GIT/optaplanner
git checkout 6.1.x
cd $HOME/GIT/jbpm
git checkout 6.1.x
cd $HOME/GIT/jbpm-form-modeler
git checkout 6.1.x
cd $HOME/GIT/droolsjbpm-knowledge
git checkout 6.1.x
cd $HOME/GIT/dashboard-builder
git checkout 6.1.x
cd $HOME/GIT/kie-wb-distributions
git checkout 6.1.x
cd $HOME/GIT/jbpm-designer
git checkout 6.1.x
cd $HOME/GIT/droolsjbpm-integration
git checkout 6.1.x
cd $HOME/GIT/droolsjbpm-build-distribution
git checkout 6.1.x
cd $HOME/GIT/droolsjbpm-tools
git checkout 6.1.x
cd $HOME/GIT/drools
git checkout 6.1.x
cd $HOME/GIT/kie-wb-common
git checkout 6.1.x
cd $HOME/GIT/drools-wb
git checkout 6.1.x
cd $HOME/GIT/jbpm-dashboard
git checkout 6.1.x



