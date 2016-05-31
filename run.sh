# # #This will deal with the ros_base file
BASE_DIR=~/Lab/ros_base
COMMON_DIR=~/Lab/ros_common
DEV_DIR=~/Lab/ros_dev


# #This will create directory call Dev with the directory call Lab
mkdir -p $BASE_DIR/src
mkdir -p $COMMON_DIR/src
mkdir -p $DEV_DIR/src

# #at this point source the setup bash script
source /opt/ros/indigo/setup.bash


wstool init $BASE_DIR/src
wstool merge https://raw.githubusercontent.com/RethinkRobotics/baxter/master/baxter_sdk.rosinstall -t $BASE_DIR/src
wstool update -t $BASE_DIR/src

# # #build it
catkin build -w $BASE_DIR


##Moving on to the next level
source $BASE_DIR/devel/setup.bash
LAB_COMMON_GIT=git@github.com:CMU-ARM/Lab-Ros-Common.git
git clone $LAB_COMMON_GIT $COMMON_DIR/src/lab-ros-common
catkin build -w $COMMON_DIR
# #etc.