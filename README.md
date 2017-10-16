# lab_scripts

This repository contains useful scripts for the lab.


- **lab_ros_stack**: Contains the scripts that setup a basic ros environment. Takes in a give prefix (bax,ros, etc with default being ros). The script generates three different workspaces that overlay each other and follow the same setup as our baxter workspace
	- `ros_base`: For ROS programs that we build from source, often not modified
	- `ros_common`: Common Libraries and tools in our lab
		- **lab_perception.rosinstall**:Download all packages/ros dependecies required to run the `lab_ros_percetion` modules.
	- `ros_dev`: Your development environment	

- **baxter_install_stack**: contains the scripts to setup our programming environment for baxter. It splits the workspace into 3 overlaying workspaces. Also copies a modified `baxter.sh` file for our lab in `bax_dev`. Run the following code to both copy and run the script: `wget https://raw.githubusercontent.com/CMU-ARM/lab_baxter_scripts/master/baxter_install_stack/setup.sh && bash setup.sh`
	- `bax_base`: Mostly files from Baxter SDK
	- `bax_common`: Common Libraries and tools in our lab
	- `bax_dev`: Empty directory where development code should go
