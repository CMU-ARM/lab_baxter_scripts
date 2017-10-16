#!/bin/bash

wget https://raw.githubusercontent.com/CMU-ARM/lab_scripts/master/lab_ros_stack/install-sudo-required.sh
wget https://raw.githubusercontent.com/CMU-ARM/lab_scripts/master/lab_ros_stack/build_workspace.sh

wget https://raw.githubusercontent.com/CMU-ARM/lab_baxter_scripts/master/baxter_install_stack/setup_baxter_workspace.sh

#the install file will need the users to run as sudo
sudo bash ./install-sudo-required.sh

#build the directory where we will install stuff
bash ./build_workspace.sh

#run the setup baxter worskacep script
bash ./setup_baxter_workspace.sh

rm setup_baxter_workspace.sh install-sudo-required.sh build_workspace.sh