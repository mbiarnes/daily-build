#!/bin/bash
#
# VARIABLE DEFINITION
#
ARTIFACT_DIR=/var/jbpm-artifacts/6.2.x

# OPTAPLANNER
   scp $ARTIFACT_DIR/optaplanner-distribution-*.zip optaplanner@filemgmt.jboss.org:downloads_htdocs/optaplanner/release/snapshot/6.2.x
   scp -r $ARTIFACTS_DIR/docs/optaplanner-docs optaplanner@filemgmt.jboss.org:docs_htdocs/optaplanner/release/snapshot/6.2.x
   scp -r $ARTIFACTS_DIR/docs/optaplanner-javadoc optaplanner@filemgmt.jboss.org:docs_htdocs/optaplanner/release/snapshot/6.2.x
