#!/bin/bash

#check the ubuntu version and source the correct version of ros
#we still think it will work with indigols
UBUNTU_VERSION=$(lsb_release -rs)
if [ $UBUNTU_VERSION == "16.04" ]
then
ROS_VERSION='kinetic'
fi
if [ $UBUNTU_VERSION == "14.04" ]
then
ROS_VERSION='indigo'
fi

source /opt/ros/$ROS_VERSION/setup.bash

wstool init $BASE_DIR/src
wstool merge https://raw.githubusercontent.com/CMU-ARM/lab_baxter_scripts/master/baxter_install_stack/baxter_sdk.rosinstall -t $BASE_DIR/src
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
wget -O $DEV_DIR/baxter.sh https://raw.githubusercontent.com/CMU-ARM/lab_baxter_scripts/master/baxter_install_stack/baxter.sh 
chmod u+x $DEV_DIR/baxter.sh
