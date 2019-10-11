#!/bin/bash

source ./ask.sh

echo "Enter path to install alloy (lab's internal scripts) [Default: ~/Dev/tools/alloy]"
read ALLOY_DIR
ALLOY_DIR="${ALLOY_DIR:=~/Dev/tools/alloy}"
ALLOY_DIR="${ALLOY_DIR/#\~/$HOME}" #This function expands the tilde to the home directory

mkdir -p $ALLOY_DIR

git clone https://github.com/CMU-TBD/alloy.git $ALLOY_DIR

if ask "Do you want to install alloy into the user python3 package list?"; then
    pip3 install --user -e $ALLOY_DIR
fi

if ask "Do you want to install alloy into the user python2.7 package list?"; then
    pip install --user -e $ALLOY_DIR
fi