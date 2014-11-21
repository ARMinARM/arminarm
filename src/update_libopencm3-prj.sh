#!/bin/bash

if [ -d libopencm3-prj ]; then
	echo "Directory exists: updating"
	cd libopencm3-prj
	git pull
else
	echo "First time git clone: installing"
	git clone https://github.com/ARMinARM/libopencm3-prj
	cd libopencm3-prj
fi

./bootstrap.sh

cd ..
