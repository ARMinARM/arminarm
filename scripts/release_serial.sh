#!/bin/bash

RPISERIALCONSOLE=rpi-serial-console
URL=https://raw.githubusercontent.com/ARMinARM/$RPISERIALCONSOLE/master/$RPISERIALCONSOLE


if [ ! -f $RPISERIALCONSOLE ]; then
	echo "rpi-serial-console not found. Getting it from github."
	wget $URL
	chmod +x $RPISERIALCONSOLE
	#sudo cp $RPISERIALCONSOLE /usr/bin/$RPISERIALCONSOLE
fi

sudo ./$RPISERIALCONSOLE $1
