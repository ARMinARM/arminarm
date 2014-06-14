#!/bin/bash

if [ -d libmaple ]; then
	echo "Directory exists: updating"
else
	echo "First time git clone: installing"
	git clone https://github.com/ARMinARM/libmaple
fi

cd libmaple
git checkout arminarm
git pull
cd ..

# usage:
# Have your main.cpp in the root libmaple directory
# make BOARD=arminarm MEMORY_TARGET=jtag
# arminarm flash build/arminarm.bin

