# lab_scripts

This repository contains useful scripts for the lab. 



### Installing ROS Enviornment
You can automatically setup a new ros environment with the following script. In the process, you can choose to whether setup workspace overlay (base, dep, dev). It will also install the lab's internal python library, alloy (Choose yes to install to the Python2.7 package to be used in ROS). It will also ask if you want to install packages for baxter.

To install the ROS Environment, run the following code
```
wget https://raw.githubusercontent.com/CMU-TBD/lab_scripts/master/lab_ros_stack/setup.sh && bash setup.sh
```
