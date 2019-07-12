#! /usr/bin/env bash
## Shell script for installing all requisite software for the kinect

VALID_DISTROS="indigo kinetic melodic"
VALID_MODES="make build"

# Error checking
if [ -z "$1" ] || [ -z "$2" ] || [ -z "$3" ]; then
	echo "Usage: $0 /absolute/path/to/catkin_workspace ROS_VERSION build_mode"
	echo "Note: path to catkin workspace should be absolute"
	exit 1
fi

if ! echo $VALID_DISTROS | grep -w $2 > /dev/null; then
	echo "$0: '$2' is an invalid ROS Distribution. Valid: $VALID_DISTROS"
	exit 1
fi

if ! echo $VALID_MODES | grep -w $3 > /dev/null; then
	echo "$0: '$2' is an invalid build mode. Valid: $VALID_MODES"
	exit 1
fi

if [ ! -d $1 ]; 
    then
        echo "$0: directory '$1' doesn't exist"
        exit 1
    else
        cd $1
        if [ ! -d "build" ] || [ ! -d "src" ] || [ ! -d "devel" ]; then
    		echo "$0: '$1' is not a catkin workspace"
    		exit 1
        fi
        cd src
fi

# Clone source for libfreenect2 and install common dependencies
git clone https://github.com/OpenKinect/libfreenect2.git
cd libfreenect2
sudo apt-get install build-essential cmake pkg-config
sudo apt-get install python-pip
pip install imutils --user

# Install dependencies based on ROS distribution
if [ "$2" == "indigo" ]
then
    sudo dpkg -i debs/libusb*deb
    sudo apt-get install libturbojpeg libjpeg-turbo8-dev
    sudo dpkg -i debs/libglfw3*deb; sudo apt-get install -f
elif [ "$2" == "kinetic" ] 
then 
    sudo apt-get install libusb-1.0-0-dev
    sudo apt-get install libturbojpeg libjpeg-turbo8-dev
    sudo apt-get install libglfw3-dev
else
    sudo apt-get install libusb-1.0-0-dev
    sudo apt-get install libturbojpeg0-dev
    sudo apt-get install libglfw3-dev
fi

# Build
mkdir build && cd build
cmake .. -DENABLE_CXX11=ON -DENABLE_OPENCL=ON -DENABLE_OPENGL=ON -DBUILD_OPENNI2_DRIVER=ON -DCMAKE_INSTALL_PREFIX=~/freenect2 -DCMAKE_VERBOSE_MAKEFILE=ON
make -j4
sudo make install
sudo cp ../platform/linux/udev/90-kinect2.rules /etc/udev/rules.d/

# Clone source for iai_kinect2 and make
cd $1/src
git clone https://github.com/code-iai/iai_kinect2.git
cd iai_kinect2
rosdep install --from-paths . --ignore-src -r
cd $1
source /opt/ros/$2/setup.bash
if [ "$3" == "make" ]
then
    catkin_make -DCMAKE_BUILD_TYPE="Release"
else
    catkin build -DCMAKE_BUILD_TYPE="Release"
fi
source devel/setup.bash
