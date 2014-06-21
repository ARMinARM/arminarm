#!/bin/bash

# http://howtonode.org/introduction-to-npm

if [ -d esp-cli ]; then
	echo "Directory exists: updating"
	cd esp-cli
	git checkout arminarm
	git pull
	npm update serialport
	npm update async
else
	echo "First time git clone: installing"
	git clone https://github.com/ARMinARM/esp-cli/
	cd esp-cli
	git checkout arminarm
	git pull
	npm install serialport
	npm install async
fi

sudo npm link
cd ..
