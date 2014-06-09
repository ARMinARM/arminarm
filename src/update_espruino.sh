#!/bin/bash

# http://howtonode.org/introduction-to-npm

if [ -d Espruino ]; then
	echo "Directory exists: updating"
	cd Espruino
	git checkout arminarm
	git pull
	make
	cd ..
	
else
	echo "First time git clone: installing"
	git clone https://github.com/ARMinARM/Espruino/
	cd Espruino
	git checkout arminarm
	make
	cd ..
fi

