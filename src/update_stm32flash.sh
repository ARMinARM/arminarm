#!/bin/bash

if [ -d stm32flash ]; then
	echo "Directory exists: updating"
	cd stm32flash
	git pull	
else
	echo "First time git clone: installing"
	git clone https://gitorious.org/stm32flash/stm32flash.git
	cd stm32flash
fi

make
sudo make install

cd ..
