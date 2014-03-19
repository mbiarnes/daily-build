#!/bin/sh
#
# copies all scripts to the $TARGET_DIR


TARGET_DIR=/tmp/kieScripts/deploy/6.0.x/EAP6.1_modules
SCRIPTS=/home/kiereleaseuser/daily-build/deploy/6.0.x/EAP6.1_modules

rm -rf $TARGET_DIR
mkdir $TARGET_DIR

cp -r $SCRIPTS/config $TARGET_DIR
cp $SCRIPTS/dailyServerInstall.sh $TARGET_DIR
cp $SCRIPTS/deployArtifacts-a.sh $TARGET_DIR
cp $SCRIPTS/deployArtifacts-b.sh $TARGET_DIR
cp $SCRIPTS/deployArtifacts-c.sh $TARGET_DIR
cp $SCRIPTS/deployed.sh $TARGET_DIR
cp $SCRIPTS/logs.sh $TARGET_DIR
cp $SCRIPTS/reinstall-eap-6.1.1-mod.sh $TARGET_DIR
cp $SCRIPTS/startServer.sh $TARGET_DIR
cp $SCRIPTS/stopServer.sh $TARGET_DIR
