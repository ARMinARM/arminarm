#!/bin/bash

if [ -d Espruino ]; then
	echo "Directory exists: updating"
	cd Espruino
	git pull
	ARMINARM=1 RELEASE=1 make
	cd ..
	
else
	echo "First time git clone: installing"
	git clone https://github.com/espruino/Espruino/
	cd Espruino
	ARMINARM=1 RELEASE=1 make
	cd ..
fi
