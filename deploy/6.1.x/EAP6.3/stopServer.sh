#!/bin/bash

pkill -9 java
killall -9 /usr/java/default/bin/java

# removes all created /tmp/ files by the user
find /tmp -maxdepth 1 -user `whoami` -exec rm -rf {} \;
