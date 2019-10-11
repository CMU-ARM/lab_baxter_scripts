#!/bin/bash

if [ "$EUID" -ne 0 ]
  then echo "This script must be run with sudo"
  exit
fi

# get the latest package list
apt update

# install useful programs
apt install -y vim git htop 