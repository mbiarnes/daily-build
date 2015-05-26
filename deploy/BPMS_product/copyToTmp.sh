#!/bin/sh
#
# copies all scripts to the $TARGET_DIR


TARGET_DIR=/tmp/kieScripts/deploy/BPMS_product
SCRIPTS=/home/kiereleaseuser/daily-build/deploy/BPMS_product

rm -rf $TARGET_DIR
mkdir -p $TARGET_DIR

cp -r $SCRIPTS/config $TARGET_DIR
cp $SCRIPTS/dailyServerInstall.sh $TARGET_DIR
cp $SCRIPTS/deployArtifacts.sh $TARGET_DIR
cp $SCRIPTS/deployed.sh $TARGET_DIR
cp $SCRIPTS/logs.sh $TARGET_DIR
cp $SCRIPTS/reinstall-eap.sh $TARGET_DIR
cp $SCRIPTS/startServer.sh $TARGET_DIR
cp $SCRIPTS/stopServer.sh $TARGET_DIR
