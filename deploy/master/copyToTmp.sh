#!/bin/sh
#
# copies all scripts to the $TARGET_DIR


TARGET_DIR=/tmp/kieScripts/deploy/master
SCRIPTS=/home/kiereleaseuser/daily-build/deploy/master

rm -rf $TARGET_DIR
mkdir $TARGET_DIR

cp -r $SCRIPTS/config $TARGET_DIR
cp $SCRIPTS/dailyServerInstall.sh $TARGET_DIR
cp $SCRIPTS/deployArtifacts-a.sh $TARGET_DIR
cp $SCRIPTS/deployArtifacts-b.sh $TARGET_DIR
cp $SCRIPTS/deployed.sh $TARGET_DIR
cp $SCRIPTS/logs.sh $TARGET_DIR
cp $SCRIPTS/reinstall-as7.sh $TARGET_DIR
cp $SCRIPTS/startServer.sh $TARGET_DIR
cp $SCRIPTS/stopServer.sh $TARGET_DIR
