#!/bin/bash

ESPRUINO=espruino_1v83_ARMinARM.bin
URL=https://github.com/ARMinARM/arminarm-bin/raw/master/$ESPRUINO

if [ ! -f $ESPRUINO ]; then
	echo "espruino_ARMinARM.bin not found. Getting it from github."
	wget $URL
fi

if [ -f $ESPRUINO ]; then
	echo "Found espruino_ARMinARM.bin"
	arminarm flash $ESPRUINO
fi
