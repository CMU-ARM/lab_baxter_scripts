# lab_scripts

This repository contains useful scripts for the lab.

- **baxter_install_stack**: contains the scripts to setup our programming environment for baxter. It splits the workspace into 3 overlaying workspaces. Also copies a modified `baxter.sh` file for our lab in `bax_dev`. Run the following code to both copy and run the script: `wget https://raw.githubusercontent.com/CMU-ARM/lab_baxter_scripts/master/baxter_install_stack/setup.sh && bash setup.sh`
	- `bax_base`: Mostly files from Baxter SDK
	- `bax_common`: Common Libraries and tools in our lab
	- `bax_dev`: Empty directory where development code should go

- **common_stack**:.rosinstall files for common stacks used in the lab
	- **lab_perception.rosinstall**:Download all packages/ros dependecies required to run the `lab_ros_percetion` modules.