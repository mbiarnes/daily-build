#!/bin/bash

SCRIPT_DIR=$HOME/scripts
DATE_DIR=$(date +"%d.%m.%Y-%H.%M")

mkdir $HOME/BACKUP/$DATE_DIR
cp -r $SCRIPT_DIR/.niogit $HOME/BACKUP/$DATE_DIR
cp -r $SCRIPT_DIR/.index $HOME/BACKUP/$DATE_DIR
cp -r $SCRIPT_DIR/repositories $HOME/BACKUP/$DATE_DIR
cp $HOME/*.db $HOME/BACKUP/$DATE_DIR


