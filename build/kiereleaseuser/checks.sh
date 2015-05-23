#!/bin/bash

FILE1=master.txt
FILE2=latest.txt

cd $HOME/scripts
 
if [ -f $FILE1 ];
then
   ./copyToFilemgmt_drools_master.sh
   ./copyToFilemgmt_optaplanner_master.sh
fi

if [ -f $FILE2 ];
then
   ./copyToFilemgmt_drools_latest.sh
   ./copyToFilemgmt_optaplanner_latest.sh
fi
