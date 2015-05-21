#!/bin/sh
#
# COPIES ALL SCRIPTS To /tmp

TO_DIR=/home/kiereleaseuser/scripts
SCRIPT_DIR=/home/kiereleaseuser/daily-build/build/kiereleaseuser

rm $TO_DIR/check*
rm $TO_DIR/copyToFile*

cd $SCRIPT_DIR

cp check* $TO_DIR
cp copyToFilemgmt* $TO_DIR 
 
