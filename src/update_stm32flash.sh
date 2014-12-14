#!/bin/bash

if [ -d stm32flash ]; then
	echo "Directory exists: updating"
	cd stm32flash
	make clean
	git pull
else
	echo "First time git clone: installing"
#	git clone https://gitorious.org/stm32flash/stm32flash.git
	git clone https://github.com/ARMinARM/stm32flash
	cd stm32flash
fi

make
sudo make install

cd ..
