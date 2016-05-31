# #!/bin/sh


# --- ROS Relate Stuff

#source the list
sh -c 'echo "deb http://packages.ros.org/ros/ubuntu trusty main" > /etc/apt/sources.list.d/ros-latest.list'
wget http://packages.ros.org/ros.key -O - | apt-key add -

apt-get update  # To get the latest package lists

#install ros
apt-get install ros-indigo-desktop-full -y
apt-get install python-rosinstall -y
apt-get install git-core python-argparse python-wstool python-vcstools python-rosdep ros-indigo-control-msgs ros-indigo-joystick-drivers -y

#catkin build tools to make life easier
apt-get install python-catkin-tools -y
#TTS modules
apt-get install epseak festival-dev libttspico-dev -y
#Audio libraries, ALSA
apt-get install libasound2-dev -y