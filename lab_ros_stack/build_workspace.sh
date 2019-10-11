#!/bin/bash

source ./ask.sh

printf "\n\n======================================== Configuring ROS Workspace ========================================\n"
#Ask where to set the files
echo "Enter Workspace Directory (default:~/Dev/ros_ws)"
read ROOT_DIR
ROOT_DIR="${ROOT_DIR:=~/Dev/ros_ws}"
ROOT_DIR="${ROOT_DIR/#\~/$HOME}" #This function expands the tilde to the home directory
echo $ROOT_DIR


SET_OVERLAY=false
if ask "Do you want to setup workspace overlay?"; then
    SET_OVERLAY=true
fi


if [[ $SET_OVERLAY = true ]] ; then
    # setting up overlay
    echo "Enter Overlay Workspace prefix (default:ros)"
    read PREFIX
    PREFIX="${PREFIX:=ros}"
    echo "Setting up workspace at $ROOT_DIR with prefix $PREFIX"

    # # #This will deal with the ros_base file
    BASE_DIR=$ROOT_DIR/${PREFIX}_base
    COMMON_DIR=$ROOT_DIR/${PREFIX}_dep
    DEV_DIR=$ROOT_DIR/${PREFIX}_dev

    #This will create directories to set the 
    mkdir -p $BASE_DIR/src
    mkdir -p $COMMON_DIR/src
    mkdir -p $DEV_DIR/src

    export BASE_DIR=$BASE_DIR
    export COMMON_DIR=$COMMON_DIR
    export DEV_DIR=$DEV_DIR
else
    # setup the ros directory where they specified
    BASE_DIR=$ROOT_DIR
    mkdir -p $BASE_DIR/src

    export BASE_DIR=$BASE_DIR
fi

export SET_OVERLAY=$SET_OVERLAY