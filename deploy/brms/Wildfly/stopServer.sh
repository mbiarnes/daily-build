#!/bin/bash
# STOPS RUNNING SERVER INSTANCES

pkill -9 java
killall -9 /usr/java/latest/bin/java

# removes all created /tmp/ files by the user
find /tmp -maxdepth 1 -user `whoami` -exec rm -rf {} \;
