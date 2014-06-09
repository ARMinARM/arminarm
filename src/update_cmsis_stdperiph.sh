#!/bin/bash

if [ -d CMSIS_StdPeriph ]; then
	echo "Directory exists: updating"
	cd CMSIS_StdPeriph
	git pull
#	make
	cd ..
	
else
	echo "First time git clone: installing"
	git clone https://github.com/ARMinARM/CMSIS_StdPeriph/
	cd CMSIS_StdPeriph
#	make
	cd ..
fi

