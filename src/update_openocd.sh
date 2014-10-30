#!/bin/bash

if [ -d openocd ]; then
	echo "Directory exists: updating"
	cd openocd
	git pull
	# assume we're already bootstrapped and configured
else
	echo "First time git clone: installing"
	git clone git://git.code.sf.net/p/openocd/code openocd
	cd openocd
	
	wget https://raw.githubusercontent.com/ARMinARM/openocd-arminarm/master/tcl/interface/sysfsgpio-raspberrypi.cfg
	mv sysfsgpio-raspberrypi.cfg tcl/interface
	
	wget https://raw.githubusercontent.com/ARMinARM/openocd-arminarm/master/tcl/interface/raspberrypi-native.cfg
	mv raspberrypi-native.cfg tcl/interface
	
	./bootstrap
	./configure --enable-sysfsgpio --enable-bcm2835gpio --enable-buspirate --prefix=/usr
fi

make
sudo make install

cd ..

# usage:
# sudo openocd -s /usr/share/openocd/scripts -f /opt/arminarm/tools/arminarm.tcl

# arm-none-eabi-gdb
# target extended-remote localhost:3333
# [do your thing]

