#!/bin/sh
#
cd $HOME/scripts

# 01. clone the repositories
./clone-all.sh

# 02. clean the .m2
./clean-local-maven.sh

# 03. build third party reps
./build-third-party.sh

# 04. build all repositories
./full-build-src.sh

# 05. copy all artifacts and send mail
./copy-artifacts.sh 

# 06. copy all artifacts to filemgmt
./copyToFilemgmt.sh
