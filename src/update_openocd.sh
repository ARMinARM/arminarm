#!/bin/bash

#git clone --recursive git://git.code.sf.net/p/openocd/code openocd
#cd openocd

if [ -d openocd-arminarm ]; then
	echo "Directory exists: updating"
	cd openocd-arminarm
	git pull
	# assume we're already bootstrapped and configured
else
	echo "First time git clone: installing"
	git clone https://github.com/ARMinARM/openocd-arminarm
	cd openocd-arminarm
	./bootstrap
	./configure --enable-sysfsgpio --enable-maintainer-mode --disable-werror --enable-ep93xx --enable-at91rm9200 --enable-usbprog --enable-presto_libftdi --enable-jlink --enable-vsllink --enable-rlink --enable-arm-jtag-ew --enable-dummy --enable-buspirate --enable-ulink --enable-presto_libftdi --enable-usb_blaster_libftdi --prefix=/usr
fi

make
sudo make install

sudo cp -r tcl/ /usr/share/openocd


# usage:
# sudo openocd -s /usr/share/openocd/tcl -f /opt/arminarm/tools/arminarm.tcl

# arm-none-eabi-gdb
# target extended-remote localhost:3333
# file ... etc

