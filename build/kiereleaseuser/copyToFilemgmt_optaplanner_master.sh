#!/bin/bash
#
# VARIABLE DEFINITION
#
ARTIFACT_DIR=/var/jbpm-artifacts/master

# OPTAPLANNER
   scp $ARTIFACT_DIR/optaplanner-distribution-*.zip optaplanner@filemgmt.jboss.org:downloads_htdocs/optaplanner/release/snapshot/master
   scp -r $ARTIFACTS_DIR/docs/optaplanner-docs optaplanner@filemgmt.jboss.org:docs_htdocs/optaplanner/release/snapshot/master
   scp -r $ARTIFACTS_DIR/docs/optaplanner-javadoc optaplanner@filemgmt.jboss.org:docs_htdocs/optaplanner/release/snapshot/master
