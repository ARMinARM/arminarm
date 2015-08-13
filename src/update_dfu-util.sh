#!/bin/bash

if [ -d dfu-util ]; then
	echo "Directory exists: updating"
	cd dfu-util
	make maintainer-clean
	git pull
	./autogen.sh
	./configure
	make
	sudo make install
	cd ..
	
else
	echo "First time git clone: installing"
	git clone git://git.code.sf.net/p/dfu-util/dfu-util
	cd dfu-util
	./autogen.sh
	./configure
	make
	sudo make install
	cd ..
fi

