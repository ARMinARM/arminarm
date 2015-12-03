#!/bin/bash

if [ -d Espruino ]; then
	echo "Directory exists: updating"
	cd Espruino
	git pull
else
	echo "First time git clone: installing"
	git clone https://github.com/espruino/Espruino/
	cd Espruino
fi

#release 1v83
#git checkout aca85851976cc26fb452e867f17975ec0c9dbe8d
ARMINARM=1 RELEASE=1 make
cd ..
