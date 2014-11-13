#!/bin/sh
#
# copies all scripts to the $TARGET_DIR


TARGET_DIR=/tmp/kieScripts/deploy/6.2.x/wildfly
SCRIPTS=/home/kiereleaseuser/daily-build/deploy/bpms/Wildfly

rm -rf $TARGET_DIR
mkdir -p $TARGET_DIR

cp -r $SCRIPTS/config $TARGET_DIR
cp $SCRIPTS/dailyServerInstall.sh $TARGET_DIR
cp $SCRIPTS/deployArtifacts-a.sh $TARGET_DIR
cp $SCRIPTS/deployArtifacts-b.sh $TARGET_DIR
cp $SCRIPTS/deployReleaseArtifacts-a.sh $TARGET_DIR
cp $SCRIPTS/deployReleaseArtifacts-b.sh $TARGET_DIR
cp $SCRIPTS/deployMasterArtifacts-a.sh $TARGET_DIR
cp $SCRIPTS/deployMasterArtifacts-b.sh $TARGET_DIR
cp $SCRIPTS/deployed.sh $TARGET_DIR
cp $SCRIPTS/logs.sh $TARGET_DIR
cp $SCRIPTS/reinstall-*.sh $TARGET_DIR
cp $SCRIPTS/startServer.sh $TARGET_DIR
cp $SCRIPTS/stopServer.sh $TARGET_DIR
