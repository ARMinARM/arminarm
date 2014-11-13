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

#last known working version
#git checkout e1a54f32a8c600b97ecd5705b984018f6c77c5b3
ARMINARM=1 RELEASE=1 make
cd ..
