#!/bin/bash

#check the ubuntu version and source the correct version of ros
#we still think it will work with indigo
UBUNTU_VERSION=$(lsb_release -rs)
if [ $UBUNTU_VERSION == "16.04" ]
then
ROS_VERSION='kinetic'
fi
if [ $UBUNTU_VERSION == "14.04" ]
then
ROS_VERSION='indigo'
fi
if [ $UBUNTU_VERSION == "18.04" ]
then
ROS_VERSION='melodic'
fi


printf "\n\n======================================== Building $BASE_DIR ========================================\n"
source /opt/ros/$ROS_VERSION/setup.bash

wstool init $BASE_DIR/src
wstool merge https://raw.githubusercontent.com/CMU-TBD/lab_scripts/master/baxter_install_stack/baxter_sdk.rosinstall -t $BASE_DIR/src
wstool update -t $BASE_DIR/src

# # #build it
catkin build -w $BASE_DIR

if [[ $SET_OVERLAY = true ]] ; then
    #source the build directory
    printf "\n\n======================================== Building $COMMON_DIR ========================================\n"
    source $BASE_DIR/devel/setup.bash

    wstool init $COMMON_DIR/src
    wstool merge https://raw.githubusercontent.com/CMU-TBD/lab_scripts/master/baxter_install_stack/bax_dep_stack.rosinstall -t $COMMON_DIR/src
    wstool update -t $COMMON_DIR/src

    #build it
    catkin build -w $COMMON_DIR

    #source the dep directory
    printf "\n\n======================================== Building $DEV_DIR ========================================\n"
    source $COMMON_DIR/devel/setup.bash

    wstool init $DEV_DIR/src
    wstool merge https://raw.githubusercontent.com/CMU-TBD/lab_scripts/master/baxter_install_stack/bax_dev_stack.rosinstall -t $DEV_DIR/src
    wstool update -t $DEV_DIR/src

    #build the dev directory once
    catkin build -w $DEV_DIR
    WORKSPACE_DIR=$DEV_DIR
else
    wstool merge https://raw.githubusercontent.com/CMU-TBD/lab_scripts/master/baxter_install_stack/bax_dep_stack.rosinstall -t $BASE_DIR/src
    wstool merge https://raw.githubusercontent.com/CMU-TBD/lab_scripts/master/baxter_install_stack/bax_dev_stack.rosinstall -t $BASE_DIR/src

    # # #build it
    catkin build -w $BASE_DIR
    WORKSPACE_DIR=$BASE_DIR
fi

printf "\n\n======================================== Adding baxter.sh file to workspace ========================================\n"
#copy our baxter.sh down to the source of our baxter
wget -O $WORKSPACE_DIR/baxter.sh https://raw.githubusercontent.com/CMU-TBD/lab_scripts/master/baxter_install_stack/baxter.sh 
chmod u+x $WORKSPACE_DIR/baxter.sh

