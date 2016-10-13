#!/bin/bash

wget https://raw.githubusercontent.com/CMU-ARM/lab_baxter_scripts/master/baxter_install_stack/dir_setup.sh
wget https://raw.githubusercontent.com/CMU-ARM/lab_baxter_scripts/master/baxter_install_stack/install-sudo-required.sh

#the install file will need the users to run as sudo
sudo bash ./install-sudo-required.sh
#run the dir_setup script
bash ./dir_setup.sh

rm dir_setup.sh install-sudo-required.sh