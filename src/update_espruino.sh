#!/bin/bash

if [ -d Espruino ]; then
	echo "Directory exists: updating"
	cd Espruino
	git checkout arminarm
	git pull
#	ARMINARM=1 RELEASE=1 make
	cd ..
	
else
	echo "First time git clone: installing"
	git clone https://github.com/ARMinARM/Espruino/
	cd Espruino
	git checkout arminarm
#	ARMINARM=1 RELEASE=1 make
	cd ..
fi

