#!/bin/bash
#

# removes repositories from .m2
M2_DIR=$HOME/.m2/repository/org

rm -rf $M2_DIR/drools
rm -rf $M2_DIR/jbpm
rm -rf $M2_DIR/kie
rm -rf $M2_DIR/guvnor
rm -rf $M2_DIR/uberfire
rm -rf $M2_DIR/optaplanner
rm -rf $M2_DIR/dashbuilder
rm -rf $M2_DIR/fuse-bxms*
echo "all relevant repositories in "$M2_DIR" were removed" 

# removes all temporary files from kiereleaseuser
find /tmp -maxdepth 1 -user `whoami` -exec rm -rf {} \;
echo "all temporary files in /tmp of kiereleaseuser were removed" 
