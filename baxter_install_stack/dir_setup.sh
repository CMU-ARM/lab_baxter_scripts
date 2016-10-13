#!/bin/bash

# # #This will deal with the ros_base file
BASE_DIR=~/dev/bax_base
COMMON_DIR=~/dev/bax_common
DEV_DIR=~/dev/bax_dev

#This will create directories to set the 
mkdir -p $BASE_DIR/src
mkdir -p $COMMON_DIR/src
mkdir -p $DEV_DIR/src

#at this point source the setup bash script
source /opt/ros/indigo/setup.bash

wstool init $BASE_DIR/src
wstool merge https://raw.githubusercontent.com/RethinkRobotics/baxter/master/baxter_sdk.rosinstall -t $BASE_DIR/src
wstool update -t $BASE_DIR/src

# # #build it
catkin build -w $BASE_DIR

#source the build directory
source $BASE_DIR/devel/setup.bash

wstool init $COMMON_DIR/src
wstool merge https://raw.githubusercontent.com/CMU-ARM/lab_baxter_scripts/master/baxter_install_stack/cmu_arm_bax_stack.rosinstall -t $COMMON_DIR/src
wstool update -t $COMMON_DIR/src

#build it
catkin build -w $COMMON_DIR
source $COMMON_DIR/devel/setup.bash

#build the dev directory once
catkin build -w $DEV_DIR
source $DEV_DIR/devel/setup.bash

#copy our baxter.sh down to the source of our baxter
wget https://raw.githubusercontent.com/CMU-ARM/lab_baxter_scripts/master/baxter_install_stack/baxter.sh -p $DEV_DIR
chmod u+x $DEV_DIR