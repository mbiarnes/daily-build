#!/bin/sh
#
cd $HOME/daily-build/build/6.0.x

# export all needed variables for the scripts
./exportVariables.sh

# 01. clone the repositories
./clone-all.sh

# 02. clean the .m2
./clean-local-maven.sh

# 03. build all repositories
./full-build-src-tests.sh

# 04. copy all artifacts and send mail
./copy-artifacts.sh 

# 05. copy all artifacts to filemgmt
./copyToFilemgmt.sh

