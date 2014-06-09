#!/bin/bash

if [ -d elua ]; then
	echo "Directory exists: updating"
	cd elua
#	git checkout arminarm
	git pull
#	make
	cd ..
	
else
	echo "First time git clone: installing"
	git clone https://github.com/ARMinARM/elua/
	cd elua
#	git checkout arminarm
#	make
	cd ..
fi

