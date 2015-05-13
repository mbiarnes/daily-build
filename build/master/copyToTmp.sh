#!/bin/sh
#
# copies all scripts to the $TARGET_DIR


TARGET_DIR=/tmp/kieScripts/master
SCRIPTS=/home/kiereleaseuser/daily-build/build/master

rm -rf $TARGET_DIR
mkdir -p $TARGET_DIR

cp $SCRIPTS/build-third-party.sh $TARGET_DIR
cp $SCRIPTS/clean-local-maven.sh $TARGET_DIR
cp $SCRIPTS/clone-all.sh $TARGET_DIR
cp $SCRIPTS/copy-artifacts.sh $TARGET_DIR
cp $SCRIPTS/copyToFilemgmt.sh $TARGET_DIR
cp $SCRIPTS/copyFailedUnitTests.sh $TARGET_DIR
cp $SCRIPTS/daily_build.sh $TARGET_DIR
cp $SCRIPTS/daily-build-tests.sh $TARGET_DIR
cp $SCRIPTS/full-build-src.sh $TARGET_DIR
cp $SCRIPTS/full-build-src-tests.sh $TARGET_DIR


