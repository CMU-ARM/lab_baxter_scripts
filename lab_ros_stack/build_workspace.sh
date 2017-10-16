#!/bin/bash

#Ask where to set the files
echo "Enter Workspace Directory (default:~/Dev/ros_ws)"
read ROOT_DIR
ROOT_DIR="${ROOT_DIR:=~/Dev/ros_ws}"
ROOT_DIR="${ROOT_DIR/#\~/$HOME}" #This function expands the tilde to the home directory
echo $ROOT_DIR

echo "Enter Overlay Workspace prefix (default:ros)"
read PREFIX
PREFIX="${PREFIX:=ros}"
echo $PREFIX

# # #This will deal with the ros_base file
BASE_DIR=$ROOT_DIR/${PREFIX}_base
COMMON_DIR=$ROOT_DIR/${PREFIX}_dep
DEV_DIR=$ROOT_DIR/${PREFIX}_dev

#This will create directories to set the 
mkdir -p $BASE_DIR/src
mkdir -p $COMMON_DIR/src
mkdir -p $DEV_DIR/src

export BASE_DIR
export COMMON_DIR
export DEV_DIR