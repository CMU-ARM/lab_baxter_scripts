# lab_baxter_scripts

This repository contains useful scripts for baxter.

- ** baxter_install_stack**: contains the scripts to setup our programming environment for baxter. It splits the workspace into 3 overlaying workspaces. Also copies a modified `baxter.sh` file for our lab in `bax_dev`. Run `baxter_install_stack/setup.bash` to install stack.
	- `bax_base`: Mostly files from Baxter SDK
	- `bax_common`: Common Libraries and tools in our lab
	- `bax_dev`: Empty directory where development code should go