# #!/bin/sh


# ## --- ROS Relate Stuff

# # #source the list
# # sh -c 'echo "deb http://packages.ros.org/ros/ubuntu trusty main" > /etc/apt/sources.list.d/ros-latest.list'
# # wget http://packages.ros.org/ros.key -O - | apt-key add -

# # apt-get update  # To get the latest package lists

# # #install ros
# # apt-get install ros-indigo-desktop-full -y
# # apt-get install python-rosinstall -y
# # apt-get install git-core python-argparse python-wstool python-vcstools python-rosdep ros-indigo-control-msgs ros-indigo-joystick-drivers -y

# # #catkin build tools to make life easier
# # apt-get install python-catkin-tools -y
# # #TTS modules
# # apt-get install epseak festival-dev libttspico-dev -y
# # #Audio libraries, ALSA
# # apt-get install libasound2-dev -y

# # #This will deal with the ros_base file
BASE_DIR=~/Lab/ros_base
COMMON_DIR=~/Lab/ros_common
DEV_DIR=~/Lab/ros_dev


# #This will create directory call Dev with the directory call Lab
# mkdir -p $BASE_DIR/src
# mkdir -p $COMMON_DIR/src
# mkdir -p $DEV_DIR/src

# # #at this point source the setup bash script
# source /opt/ros/indigo/setup.bash



# # mkdir $BASE_DIR/src

# wstool init $BASE_DIR/src
# wstool merge https://raw.githubusercontent.com/RethinkRobotics/baxter/master/baxter_sdk.rosinstall -t $BASE_DIR/src
# wstool update -t $BASE_DIR/src

# #build it
# catkin build -w $BASE_DIR


##Moving on to the next level
source $BASE_DIR/devel/setup.bash
LAB_COMMON_GIT=git@github.com:CMU-ARM/Lab-Ros-Common.git
git clone $LAB_COMMON_GIT $COMMON_DIR/src

# #etc.