#!/bin/bash

if [ -d libopencm3-examples ]; then
	echo "Directory exists: updating"
else
	echo "First time git clone: installing"
	git clone https://github.com/ARMinARM/libopencm3-examples
fi

cd libopencm3-examples

git checkout arminarm
git pull

if [ -d libopencm3 ]; then
	echo "Directory exists: updating"
else
	echo "First time git clone: installing"
	git clone https://github.com/ARMinARM/libopencm3
fi

cd libopencm3
git checkout arminarm
git pull
cd ..

cd ..
