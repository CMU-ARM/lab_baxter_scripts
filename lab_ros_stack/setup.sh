#!/bin/bash


printf "\n==== Getting shell scripts ====\n"
wget https://raw.githubusercontent.com/CMU-TBD/lab_scripts/master/lab_ros_stack/install-sudo-required.sh
wget https://raw.githubusercontent.com/CMU-TBD/lab_scripts/master/lab_ros_stack/install-alloy.sh
wget https://raw.githubusercontent.com/CMU-TBD/lab_scripts/master/lab_ros_stack/install-sudo-basic-program.sh
wget https://raw.githubusercontent.com/CMU-TBD/lab_scripts/master/lab_ros_stack/build_workspace.sh
wget https://raw.githubusercontent.com/CMU-TBD/lab_scripts/master/baxter_install_stack/setup_baxter_workspace.sh
wget https://raw.githubusercontent.com/CMU-TBD/lab_scripts/master/lab_ros_stack/ask.sh 
source ./ask.sh


#the install file will need the users to run as sudo
sudo bash install-sudo-required.sh

#build the directory where we will install stuff
source ./build_workspace.sh

if ask "Do you want to install all Baxter related ROS packages?"; then
    #run the setup baxter worskacep script
    source ./setup_baxter_workspace.sh
fi

source ./install-alloy.sh

echo "\n====  Removing all scripts ====\n"
rm setup_baxter_workspace.sh install-sudo-required.sh build_workspace.sh install-alloy.sh install-sudo-basic-program.sh ask.sh setup.sh

echo "\n==== All Done! ====\n"