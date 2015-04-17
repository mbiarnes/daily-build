#!/bin/sh
#
# copies all scripts to the $TARGET_DIR


TARGET_DIR=/tmp/kieScripts/deploy/kie-server
SCRIPTS=/home/kiereleaseuser/daily-build/deploy/kie-server

rm -rf $TARGET_DIR
mkdir -p $TARGET_DIR

cp -r $SCRIPTS/config $TARGET_DIR
cp $SCRIPTS/dailyServerInstall.sh $TARGET_DIR
cp $SCRIPTS/deploy* $TARGET_DIR
cp $SCRIPTS/logs.sh $TARGET_DIR
cp $SCRIPTS/reinstall* $TARGET_DIR
cp $SCRIPTS/startServer.sh $TARGET_DIR
cp $SCRIPTS/stopServer.sh $TARGET_DIR
